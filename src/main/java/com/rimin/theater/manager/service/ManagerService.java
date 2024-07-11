package com.rimin.theater.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.manager.domain.Manager;
import com.rimin.theater.manager.repository.ManagerRepository;

@Service
public class ManagerService {
	
	@Autowired
	private ManagerRepository managerRepository;
	
	public Manager addManager(String loginId
								, String password
								, String name
								, String email
								, String phoneNumber
								, int age
								, String sex) {
		
		Manager manger = Manager.builder()
								.loginId(loginId)
								.password(password)
								.name(name)
								.email(email)
								.phoneNumber(phoneNumber)
								.age(age)
								.sex(sex)
								.build();
		
		return managerRepository.save(manger);
		
	}
	
	// id 중복 확인
	public boolean isDuplicateId(String loginId) {
		int count = managerRepository.countByLoginId(loginId);
		
		if(count != 0) {
			return true;
		} else {
			return false;
		}
	}
	
	
	// 로그인
	public Manager getManager(String loginId, String loginPw) {
		return managerRepository.findByLoginIdAndPassword(loginId, loginPw);
	}
	
	
}
