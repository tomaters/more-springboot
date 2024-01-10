package com.project.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import lombok.extern.java.Log;

@Log
@EnableWebSecurity
@Configuration
public class SecurityConfig {

	@Autowired
	DataSource dataSource;

	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		log.info("security config ...");
		http.csrf().disable();

		http.authorizeHttpRequests().requestMatchers("/board/**").permitAll().
		requestMatchers("/manager/**").hasRole("MEMBER").
		requestMatchers("/admin/**").hasRole("ADMIN").
		anyRequest().permitAll();

		http.formLogin();

		return http.build();
	}
	
	@Bean
	PasswordEncoder createPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}