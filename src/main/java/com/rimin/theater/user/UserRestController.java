package com.rimin.theater.user;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rimin.theater.user.domain.User;
import com.rimin.theater.user.service.UserService;
import com.rimin.theater.userSalt.domain.UserSalt;
import com.rimin.theater.userSalt.service.UserSaltService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class UserRestController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private UserSaltService userSaltService;
	
	// 회원가입
	@PostMapping("/user/join")
	public Map<String, String> join(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("age") int age
			, @RequestParam("sex") String sex) throws NoSuchAlgorithmException {
		
		// 사용자별 salt를 먼저 저장 후
		UserSalt userSalt = userSaltService.saveUserSalt(loginId);
		
		// salt를 추가하여 암호화된 비밀번호를 저장
		User user = userService.addUser(loginId, password, name, email, phoneNumber, age, sex);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(user != null && userSalt != null) {
			resultMap.put("result",  "success");
		} else {
			resultMap.put("result",  "fail");
		}
		
		return resultMap;
		
	}
	
	
	// id 중복 확인하기
	@GetMapping("/user/duplicate-id")
	public Map<String, Boolean> isDuplicateId(@RequestParam("loginId") String loginId){
		
		boolean isDuplicateId = userService.isDuplicateId(loginId);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("isDuplicateId",  isDuplicateId);
		
		return resultMap;
		
	}
	
	
	// 로그인 기능
	@PostMapping("/user/login")
	public Map<String, String> login(@RequestParam("loginId") String loginId
										, @RequestParam("loginPw") String loginPw
										, HttpServletRequest request){
		
		User user = userService.getUser(loginId, loginPw);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(user != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("userId",  user.getId());
			session.setAttribute("userName",  user.getName());
			
			resultMap.put("result",  "success");
		} else {
			resultMap.put("result",  "fail");
			
		} 
		return resultMap;
		
	}
	
	
	// 아이디 찾기
	@PostMapping("/user/findId")
	public Map<String, String> findId(@RequestParam("name") String name
										, @RequestParam("email") String email){
		
		String userId = userService.findUserId(name, email);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(userId != null) {
			resultMap.put("result", "success");
			resultMap.put("userId", userId);
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// 임시 비밀번호 발급
	@PostMapping("/user/showTempPw")
	public Map<String, String> showTempPw(@RequestParam("loginId") String loginId
										, @RequestParam("phoneNumber") String phoneNumber){
		
		String userPw = userService.findUserPw(loginId, phoneNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(userPw != null) {
			resultMap.put("result", "success");
			resultMap.put("userPw", userPw);
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	// 임시 비밀번호 확인
	@PostMapping("/user/checkTempPassword")
	public Map<String, Boolean>  checkTempPw(@RequestParam("loginId") String loginId
										, @RequestParam("tempPassword") String tempPassword){
		
		boolean checkTempPassword = userService.checkTempPw(loginId, tempPassword);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("result", checkTempPassword);
		
		return resultMap;
	}
	
	// 비밀번호 재설정
	@PostMapping("/user/changePassword")
	public Map<String, String> changePw(@RequestParam("loginId") String loginId
										, @RequestParam("password") String password){
		
		User user = userService.updateUserPassword(loginId, password);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(user != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}		
		
		return resultMap;
		
	}
	
}
