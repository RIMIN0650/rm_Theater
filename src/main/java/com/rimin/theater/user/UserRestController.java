package com.rimin.theater.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rimin.theater.user.domain.User;
import com.rimin.theater.user.service.UserService;

@RestController
public class UserRestController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/user/join")
	public Map<String, String> join(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("age") int age
			, @RequestParam("sex") String sex) {
		
		User user = userService.addUser(loginId, password, name, email, phoneNumber, age, sex);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(user != null) {
			resultMap.put("result",  "success");
		} else {
			resultMap.put("result",  "fail");
		}
		
		return resultMap;
		
	}
	
	
}
