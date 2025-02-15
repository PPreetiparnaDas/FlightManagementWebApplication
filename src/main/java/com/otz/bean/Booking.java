package com.otz.bean;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class Booking {
	private int bookId;
	private int members;
	private int unitPrice;
	private int totalPrice;
	private String date;
	private String cardNo;
	private String cardName;
	private String cvv;
	private String expDate;
	private String bClass;
	private int fId;
	private String fNo;
	private int scldId;
	private int uId;
	private String uName;
	private LocalDateTime departure;
	private LocalDateTime arrival;
	private String source;
	private String destination;
	private String fName;		
}
