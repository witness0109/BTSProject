package com.bts.app;

public class MemberVO {
String id="", pw="", name="", email="", phone="";




@Override
public String toString() {
	return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", email=" + email + ", phone=" + phone + "]";
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPw() {
	return pw;
}
public void setPw(String pw) {
	this.pw = pw;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}

	
}
