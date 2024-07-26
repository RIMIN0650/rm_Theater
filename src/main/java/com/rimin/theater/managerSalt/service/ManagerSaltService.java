package com.rimin.theater.managerSalt.service;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.common.EncryptUtils;
import com.rimin.theater.managerSalt.domain.ManagerSalt;
import com.rimin.theater.managerSalt.repository.ManagerSaltRepository;

@Service
public class ManagerSaltService {
	
	@Autowired
	private ManagerSaltRepository managerSaltRepository;
	
	public ManagerSalt saveManagerSalt(String loginId) throws NoSuchAlgorithmException {
		
		String saltForPassword = EncryptUtils.createSalt();
		
		ManagerSalt managerSalt = ManagerSalt.builder()
												.managerId(loginId)
												.salt(saltForPassword)
												.build();
		return managerSaltRepository.save(managerSalt);
		
	}
	
}
