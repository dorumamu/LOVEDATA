package com.project.love_data.Repository;

import java.util.*;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.project.love_data.model.User;

public interface UserRepository extends JpaRepository<User, Long>{

	@Query(value = "select * from User where = :email",nativeQuery = true)
	boolean email_check(String email);

	@Query(value = "select * from User u where user_email = :email", nativeQuery = true)
	Optional<User> findUserByEmail(String email);

	@Query(value = "select * from User u where user_email = :email AND user_social=:social", nativeQuery = true)
	Optional<User> findUserByEmail_Social(String email, boolean social);
}