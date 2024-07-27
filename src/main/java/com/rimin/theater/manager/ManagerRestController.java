package com.rimin.theater.manager;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rimin.theater.manager.domain.Manager;
import com.rimin.theater.manager.service.ManagerService;
import com.rimin.theater.managerSalt.domain.ManagerSalt;
import com.rimin.theater.managerSalt.service.ManagerSaltService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class ManagerRestController {
	
	@Autowired
	public ManagerService managerService;
	
	@Autowired
	public ManagerSaltService managerSaltService;
	
	@PostMapping("/admin/join")
	public Map<String, String> join (@RequestParam("loginId") String loginId
									, @RequestParam("password") String password
									, @RequestParam("name") String name
									, @RequestParam("email") String email
									, @RequestParam("phoneNumber") String phoneNumber
									, @RequestParam("age") int age
									, @RequestParam("sex") String sex) throws NoSuchAlgorithmException {
		
		ManagerSalt managerSalt = managerSaltService.saveManagerSalt(loginId);
		
		Manager manager = managerService.addManager(loginId, password, name, email ,phoneNumber ,age, sex);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(manager != null && managerSalt != null) {
			resultMap.put("result",  "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// id 중복 확인
	@GetMapping("/admin/duplicate-id")
	public Map<String, Boolean> isDuplicateId(@RequestParam("loginId") String loginId){
		
		boolean isDuplicateId = managerService.isDuplicateId(loginId);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("isDuplicateId",  isDuplicateId);
		
		return resultMap;
	}
	
	// 로그인
	@PostMapping("/admin/login")
	public Map<String, String> login(@RequestParam("loginId") String loginId
									, @RequestParam("loginPw") String loginPw
									, HttpServletRequest request){
		
		Manager manager = managerService.getManager(loginId, loginPw);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(manager != null) {
			HttpSession session = request.getSession();
			
			session.setAttribute("managerId", manager.getId());
			session.setAttribute("managerName", manager.getName());
			
			resultMap.put("result",  "success");
		
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	// id 찾기
	@PostMapping("/admin/findId")
	public Map<String, String> findId(@RequestParam("name") String name
										, @RequestParam("email") String email){
		
		String managerId = managerService.findManagerId(name, email);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(managerId != null) {
			resultMap.put("result", "success");
			resultMap.put("managerId", managerId);
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 임시 비밀번호 발급
	@PostMapping("/admin/showTempPw")
	public Map<String, String> showTempPw(@RequestParam("loginId") String loginId
											, @RequestParam("phoneNumber") String phoneNumber){
		
		String managerTempPw = managerService.findManagerPw(loginId, phoneNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(managerTempPw != null) {
			resultMap.put("result", "success");
			resultMap.put("managerTempPw", managerTempPw);
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	// 임시 비밀번호 확인
	@PostMapping("/admin/checkTempPassword")
	public Map<String, Boolean> checkTempPw(@RequestParam("loginId") String loginId
											, @RequestParam("tempPassword") String tempPassword){
		
		boolean checkTempPassword = managerService.checkTempPw(loginId, tempPassword);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("result", checkTempPassword);
		
		return resultMap;
		
	}
	
	// 비밀번호 재설정
	@PostMapping("/admin/changePassword")
	public Map<String, String> changePw(@RequestParam("loginId") String loginId
										, @RequestParam("password") String password){
		
		Manager manager = managerService.updateMangerPassword(loginId, password);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(manager != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
}
