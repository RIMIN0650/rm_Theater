package com.rimin.theater.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.user.domain.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	// Integer : primary key 타입이 int
	
	// 중복 확인 위한 아이디 개수 세기
	// select count (*) from `user` where `loginId` = loginId;
	// 개수가 1이면 중복, 0이면 중복 아님
	public int countByLoginId(String loginId);
	
	// 로그인 기능
	public User findByLoginIdAndPassword(String loginId, String password);
	
	
	// id 찾기
	public User findByNameAndEmail(String name, String email);
	
	// 비밀번호 찾기
	public User findByLoginIdAndPhoneNumber(String loginId, String phoneNumber);
	
	public User findByLoginId(String loginId);
	
}
