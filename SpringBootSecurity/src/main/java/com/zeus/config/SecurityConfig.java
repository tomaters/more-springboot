package com.zeus.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import com.zeus.common.security.CustomAccessDeniedHandler;
import com.zeus.common.security.CustomLoginSuccessHandler;

import lombok.extern.java.Log;

@Log
@EnableWebSecurity
@Configuration
public class SecurityConfig {

	@Autowired
	DataSource datasource;

    @Bean
    AccessDeniedHandler createAccessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}

    @Bean
    SavedRequestAwareAuthenticationSuccessHandler createAuthenticationSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}

	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		log.info("security config ...");
		http.csrf().disable();

		http.authorizeHttpRequests().requestMatchers("/board/list").permitAll();
		http.authorizeHttpRequests().requestMatchers("/board/register").hasRole("MEMBER");

		http.authorizeHttpRequests().requestMatchers("/notice/list").permitAll();
		http.authorizeHttpRequests().requestMatchers("/notice/register").hasRole("ADMIN");

		http.authorizeHttpRequests().anyRequest().permitAll();

//		http.exceptionHandling().accessDeniedPage("/accessError");
		http.exceptionHandling().accessDeniedHandler(createAccessDeniedHandler());
		
		// use my login page, not default
		http.formLogin().loginPage("/login").successHandler(createAuthenticationSuccessHandler());
//		http.formLogin();

		http.logout().logoutUrl("/logot").invalidateHttpSession(true);
		
		return http.build();
	}
	
	@Autowired
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("member").password("{noop}1234").roles("MEMBER");
		auth.inMemoryAuthentication().withUser("admin").password("{noop}1234").roles("ADMIN");
	}
}