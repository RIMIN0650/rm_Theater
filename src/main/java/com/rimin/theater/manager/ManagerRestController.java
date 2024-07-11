package com.rimin.theater.manager;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rimin.theater.manager.domain.Manager;
import com.rimin.theater.manager.service.ManagerService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class ManagerRestController {
	
	@Autowired
	public ManagerService managerService;
	
	@PostMapping("/admin/join")
	public Map<String, String> join (@RequestParam("loginId") String loginId
									, @RequestParam("password") String password
									, @RequestParam("name") String name
									, @RequestParam("email") String email
									, @RequestParam("phoneNumber") String phoneNumber
									, @RequestParam("age") int age
									, @RequestParam("sex") String sex) {
		
		Manager manager = managerService.addManager(loginId, password, name, email ,phoneNumber ,age, sex);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(manager != null) {
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
			
			session.setAttribute("userId", manager.getId());
			session.setAttribute("userName", manager.getName());
			
			resultMap.put("result",  "success");
		
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	
	
	
}
