package com.rimin.theater.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.common.EncryptUtils;
import com.rimin.theater.manager.domain.Manager;
import com.rimin.theater.manager.repository.ManagerRepository;
import com.rimin.theater.managerSalt.domain.ManagerSalt;
import com.rimin.theater.managerSalt.repository.ManagerSaltRepository;


@Service
public class ManagerService {
	
	@Autowired
	private ManagerRepository managerRepository;
	
	@Autowired
	private ManagerSaltRepository managerSaltRepository;
	
	public Manager addManager(String loginId
								, String password
								, String name
								, String email
								, String phoneNumber
								, int age
								, String sex) {
		
		ManagerSalt managerSalt = managerSaltRepository.findByManagerId(loginId);
		
		String encryptedPassword = EncryptUtils.encrypt(password, managerSalt.getSalt());
		
		Manager manger = Manager.builder()
								.loginId(loginId)
								.password(encryptedPassword)
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
		
		ManagerSalt managerSalt = managerSaltRepository.findByManagerId(loginId);
		
		String encryptedPassword = EncryptUtils.encrypt(loginPw, managerSalt.getSalt());
		
		return managerRepository.findByLoginIdAndPassword(loginId, encryptedPassword);
	}
	
	
	// id 찾기
	public String findManagerId(String name, String email) {
		
		Manager manager = managerRepository.findByLoginIdAndEmail(name, email);
		
		if(manager != null) {
			return manager.getLoginId();
		} else {
			return null;
		}
	}
	
	// 임시 비밀번호 발급
	public String findManagerPw(String loginId, String phoneNumber) {
		Manager manager = managerRepository.findByLoginIdAndPhoneNumber(loginId, phoneNumber);
		
		if(manager != null) {
			return manager.getPassword().substring(0,10);
		} else {
			return null;
		}
	}
	
	// 임시 비밀번호 확인
	public boolean checkTempPw(String managerId, String tempPassword) {
		
		Manager manager = managerRepository.findByLoginId(managerId);
	
		return tempPassword.equals(manager.getPassword().substring(0,10));
		
	}
	
	// 비밀번호 재설정
	public Manager updateMangerPassword(String loginId, String password) {
		
		Manager manager = managerRepository.findByLoginId(loginId);
		
		ManagerSalt managerSalt = managerSaltRepository.findByManagerId(loginId);
		
		String encryptedPassword = EncryptUtils.encrypt(password, managerSalt.getSalt());
		
		if(manager != null && managerSalt != null) {
			manager = manager.toBuilder()
								.password(encryptedPassword)
								.build();
		
			manager = managerRepository.save(manager);
		}
		return manager;
	}

}
