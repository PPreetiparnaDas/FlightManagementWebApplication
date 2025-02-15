package com.otz.bean;

public class User {
	private int     uId;
	private String  uName;
	private String  uEmail;
	private String  uPass;
	private String  uAdd ;
	private String  uPhone;
	private String  redgDate;
	private int	    roleId  ;
	private String  status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public String getuPass() {
		return uPass;
	}
	public void setuPass(String uPass) {
		this.uPass = uPass;
	}
	public String getuAdd() {
		return uAdd;
	}
	public void setuAdd(String uAdd) {
		this.uAdd = uAdd;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getRedgDate() {
		return redgDate;
	}
	public void setRedgDate(String redgDate) {
		this.redgDate = redgDate;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	@Override
	public String toString() {
		return "User [uId=" + uId + ", uName=" + uName + ", uEmail=" + uEmail + ", uPass=" + uPass + ", uAdd=" + uAdd
				+ ", uPhone=" + uPhone + ", redgDate=" + redgDate + ", roleId=" + roleId + ", status=" + status + "]";
	}
	
}
