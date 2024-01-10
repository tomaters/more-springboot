package com.zeus.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.zeus.common.security.CustomAccessDeniedHandler;
import com.zeus.common.security.CustomLoginSuccessHandler;
import com.zeus.common.security.CustomNoOpPasswordEncoder;
import com.zeus.common.security.CustomUserDetailsService;

import lombok.extern.java.Log;

@Log
@EnableWebSecurity
@Configuration
@EnableMethodSecurity(prePostEnabled=true, securedEnabled=true)
public class SecurityConfig {

	@Autowired
	DataSource dataSource;

//    @Bean
//    AccessDeniedHandler createAccessDeniedHandler() {
//		return new CustomAccessDeniedHandler();
//	}
//
//    @Bean
//    SavedRequestAwareAuthenticationSuccessHandler createAuthenticationSuccessHandler() {
//		return new CustomLoginSuccessHandler();
//	}

	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		log.info("security config ...");
		http.csrf().disable();

		http.authorizeHttpRequests().requestMatchers("/board/list").permitAll();
		http.authorizeHttpRequests().requestMatchers("/board/register").hasRole("MEMBER");

		http.authorizeHttpRequests().requestMatchers("/notice/list").permitAll();
		http.authorizeHttpRequests().requestMatchers("/notice/register").hasRole("ADMIN");

		http.authorizeHttpRequests().anyRequest().permitAll();

		http.exceptionHandling().accessDeniedHandler(createAccessDeniedHandler());
		http.formLogin().loginPage("/login").successHandler(createAuthenticationSuccessHandler());

		http.logout().logoutUrl("/logout").invalidateHttpSession(true).deleteCookies("remember-me", "JSESSION_ID");
		
		
		http.rememberMe().key("zeus").tokenRepository(createJDBCRepository()).tokenValiditySeconds(60*60*24);
		
		return http.build();
	}
	
	private PersistentTokenRepository createJDBCRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}


	@Bean
	AuthenticationSuccessHandler createAuthenticationSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}

	@Bean
	AccessDeniedHandler createAccessDeniedHandler() {
		return new CustomAccessDeniedHandler();

	}

//	@Autowired
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// use DB info to login
		auth.userDetailsService(createUserDetailsService()).passwordEncoder(createPasswordEncoder());
	}

	@Bean
	UserDetailsService createUserDetailsService() {
		return new CustomUserDetailsService();
	}

	@Bean
	PasswordEncoder createPasswordEncoder() {
		return new CustomNoOpPasswordEncoder();
	}
}