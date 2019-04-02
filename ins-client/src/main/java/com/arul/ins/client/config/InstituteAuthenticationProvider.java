package com.arul.ins.client.config;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import com.arul.ins.client.domain.Role;
import com.arul.ins.client.domain.User;
import com.arul.ins.client.util.EndpointConstant;

@Component
public class InstituteAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	RestTemplate template;

	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
		String password = (String) authentication.getCredentials();
		String uri = EndpointConstant.USER_SERVICE_URI + "/" + username;
		ResponseEntity<User> response = template.exchange(uri, HttpMethod.GET, null,
				new ParameterizedTypeReference<User>() {
				});
		User user = response.getBody();
		if (user == null || !user.getUserName().equalsIgnoreCase(username)) {
			throw new BadCredentialsException("Username not found.");
		}

		if (!password.equals(user.getPassword())) {
			throw new BadCredentialsException("Wrong password.");
		}
		ResponseEntity<List<Role>> roleresponse = template.exchange(uri + "/roles", HttpMethod.GET, null,
				new ParameterizedTypeReference<List<Role>>() {
				});
		List<Role> roles = roleresponse.getBody();
		Collection<? extends GrantedAuthority> authorities = roles;

		return new UsernamePasswordAuthenticationToken(user, password, authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}

}
