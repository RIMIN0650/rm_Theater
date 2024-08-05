package com.rimin.theater.user.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.common.EncryptUtils;
import com.rimin.theater.user.domain.User;
import com.rimin.theater.user.repository.UserRepository;
import com.rimin.theater.userSalt.domain.UserSalt;
import com.rimin.theater.userSalt.repository.UserSaltRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserSaltRepository userSaltRepository;
	
	// 회원가입
	public User addUser(String loginId
						, String password
						, String name
						, String email
						, String phoneNumber
						, int age
						, String sex) {
		
		// 저장된 salt 불러오기
		UserSalt userSalt = userSaltRepository.findByUserId(loginId);
		
		// salt 와 SHA256으로 암호화
		String encryptedPassword = EncryptUtils.encrypt(password, userSalt.getSalt());
		
		User user = User.builder()
						.loginId(loginId)
						.password(encryptedPassword)
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
		
		UserSalt userSalt = userSaltRepository.findByUserId(loginId);
		
		String encryptedPassword = EncryptUtils.encrypt(loginPw, userSalt.getSalt());
		
		return userRepository.findByLoginIdAndPassword(loginId, encryptedPassword);
	}
	
	
	// id 찾기
	public String findUserId(String name, String email) {
		
		User user = userRepository.findByNameAndEmail(name, email);
		
		if(user != null) {
			return user.getLoginId();
		} else {
			return null;
		}
	}
	
	// 임시 비밀번호 발급
	public String findUserPw(String loginId, String phoneNumber) {
		
		User user = userRepository.findByLoginIdAndPhoneNumber(loginId, phoneNumber);
		
		if(user != null) {
			return user.getPassword().substring(0,10);
		} else {
			return null;
		}
		
	}
	
	// 임시 비밀번호와 암호화되어 저장된 비밀번호의 앞 10자리가 같은지 확인
	public boolean checkTempPw(String userId, String tempPassword) {
		
		User user = userRepository.findByLoginId(userId);
		
		return tempPassword.equals(user.getPassword().substring(0,10));		
		
	}
	
	// 비밀번호 재설정
	public User updateUserPassword(String loginId, String password) {
		
		User user = userRepository.findByLoginId(loginId);
		
		UserSalt userSalt = userSaltRepository.findByUserId(loginId);
				
		String encryptedPassword = EncryptUtils.encrypt(password, userSalt.getSalt());
				
		
		if(user != null && userSalt != null) {
			user = user.toBuilder()
						.password(encryptedPassword)
						.build();
			
			user = userRepository.save(user);
		}
		
		return user;
		
	}
	
	public User findById(int id) {
		Optional<User> optionalUser = userRepository.findById(id);
		User user = optionalUser.orElse(null);
		return user;
	}
	
	
	
}
