package com.rimin.theater.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.user.domain.User;
import com.rimin.theater.user.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	
	// 회원가입
	public User addUser(String loginId
						, String password
						, String name
						, String email
						, String phoneNumber
						, int age
						, String sex) {
		User user = User.builder()
						.loginId(loginId)
						.password(password)
						.name(name)
						.email(email)
						.phoneNumber(phoneNumber)
						.age(age)
						.sex(sex)
						.build();
		
		return userRepository.save(user);
		
	}
	
	
	
}
