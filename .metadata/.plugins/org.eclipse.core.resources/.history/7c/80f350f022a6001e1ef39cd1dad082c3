package com.zeus.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class Member {
	@Size(max = 12) // sets max size of userId
	@NotBlank // prohibits userId from being blank; if blank returns error
	private String userId;
	private String password;
	private String userName;
	private String email;
	private String gender;
	private String hobby;
	private String[] hobbyArray;
	private List<String> hobbyList;
	private boolean foreigner;
	private String developer;
	private String nationality;
	private Address address;
	private List<Card> cardList;
	private String cars;
	private String[] carArray;
	private List<String> carList;
	private String introduction;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date dateOfBirth;
	private int coin;
}