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
	
	
	
	// id 중복 확인
	public boolean isDuplicateId(String loginId) {
		int count = userRepository.countByLoginId(loginId);
		
		if(count != 0 ) { // 조회된 개수가 0이 아니라면 중복된 아이디
			return true; // 중복
		} else {
			return false; // 중복 아님
		}
	}
	
	
	// 로그인 기능
	public User getUser(String loginId, String loginPw) {
		
		return userRepository.findByLoginIdAndPassword(loginId, loginPw);
	}
	
}
