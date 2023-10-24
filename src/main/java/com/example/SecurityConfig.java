package com.example;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.example.service.MemberService;

@Configuration
public class SecurityConfig {
	
	@Autowired
    MemberService memberService;
	
	@Bean
	SecurityFilterChain fiterChain(HttpSecurity http) throws Exception {
		
		http.csrf(csrf -> csrf.disable()) 	//디플리케이트의 의미는 쓰지말라이다.
			.cors(cors -> cors.disable())
			.headers(headers -> headers.disable())
			.authorizeHttpRequests(authorizeHttpRequests -> authorizeHttpRequests
						.anyRequest().permitAll()
					)
			
			.formLogin(formLogin -> formLogin
						.loginPage("/login")
					)
			.logout(logout -> logout
						.logoutUrl("/logout")
						.logoutSuccessUrl("/")
					)
			.userDetailsService(memberService)
			;
		
		return http.build();
	}
}
