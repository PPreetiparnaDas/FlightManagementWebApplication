package com.otz.bean;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ScdlFlight {
	private int scdlId;
	private String scdlDate;
	private String source;
	private String destination;
	private int seatAvl;
	private double ticketPrice;
	private String travelTime  ;
	private double travelKm;
	private String status;
	private int fId;
	private String fName;
	private String fNo;
	private LocalDateTime arrival;
	private LocalDateTime departure;
}
