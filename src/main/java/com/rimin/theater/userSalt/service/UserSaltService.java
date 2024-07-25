package com.rimin.theater.userSalt.service;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.common.EncryptUtils;
import com.rimin.theater.userSalt.domain.UserSalt;
import com.rimin.theater.userSalt.repository.UserSaltRepository;

@Service
public class UserSaltService {
	
	@Autowired
	private UserSaltRepository userSaltRepository;
	
	
	// 사용자 별 salt 저장하기 위함
	public UserSalt saveUserSalt(String loginId) throws NoSuchAlgorithmException {
		
		String saltForPassword = EncryptUtils.createSalt();
		
		UserSalt userSalt = UserSalt.builder()
									.userId(loginId)
									.salt(saltForPassword)
									.build();
		return userSaltRepository.save(userSalt);
	}
	
	
	
	
}
