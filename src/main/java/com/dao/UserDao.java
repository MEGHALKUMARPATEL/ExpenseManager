 package com.dao;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.ForgetPasswordBean;
import com.bean.LoginBean;
import com.bean.UpdatePasswordBean;
import com.bean.UserBean;

@Repository
public class UserDao {
	@Autowired
	JdbcTemplate stmt; //new
	
	//add customer--signup
	public void insertUser(UserBean userBean) {
		
		String insertQuery = "insert into users(firstname,lastname,email,mobileno,gender,dateofbirth,designation,password,role,createdAt) values(?,?,?,?,?,?,?,?,?,?)";
		
		
		Calendar c = Calendar.getInstance(); 
		int d = c.get(c.DAY_OF_MONTH); //07 
		int m = c.get(c.MONTH)+1;//03
		int y = c.get(c.YEAR);
		String today = "";
//		
		if(m<=9){
			today = y + "-0"+m+ "-" +d; 
		}else if(m>9){
			today = d + "-"+m+ "-" +y; 
		}
		else if(d <= 9){
			today = 0+""+ d + "-"+m+ "-" +y;
		}else if(d>10){
			today = d + "-"+m+ "-" +y;
		}
		
		//role -2 for user
		stmt.update(insertQuery,userBean.getFirstname(),userBean.getLastname(),userBean.getEmail(),userBean.getMobileno(),userBean.getGender(),userBean.getDateofbirth(),userBean.getDesignation(),userBean.getPassword(),2,today);//query execute
	}
	
	public UserBean authenticateUser(LoginBean loginBean) {
		String loginQuery = "select * from users where email = ? and password = ?";
		
		try {
		UserBean user = stmt.queryForObject(loginQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),new Object[] {loginBean.getEmail(),loginBean.getPassword() });
		
		return user;
		}catch(Exception e) {
			System.out.println("SMW--> UserDao::authenticateUser");
			System.out.println(e.getMessage());
		}
		return null;
			
		}
	
	public UserBean findUserByEmail(ForgetPasswordBean forgetPasswordBean) {
		
		try {
			 String selectEmailQuery = "select * from users where email = ?";
		     UserBean user = stmt.queryForObject(selectEmailQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),new Object[] { forgetPasswordBean.getEmail() });
		
		return user;
		}catch(Exception e) {
			System.out.println("SMW--> UserDao::authenticateUser");
			System.out.println(e.getMessage());
		}
		return null;
			
		}
		public void updateOtp(String email, String otp) {
			String updateOtpQuery = "update users set otp = ? where email = ?";
			stmt.update(updateOtpQuery,otp,email);
		}
		 
		public UserBean verifyOtpByEmail(UpdatePasswordBean upBean) {
			try {
				String otpQuery = "select * from users where email = ? and otp = ?";
				UserBean user = stmt.queryForObject(otpQuery, new BeanPropertyRowMapper<UserBean>(UserBean.class),new Object[] { upBean.getEmail(), upBean.getOtp() });
			return user;	
			} catch (Exception e) {
				System.out.println("Otp Not match");
				System.out.println(e.getMessage());
			}
			return null;
		} 
		
		public void updateMyPassword(UpdatePasswordBean upBean) {
			String updateQuery = "update users set password = ?, otp = ? where email = ?";
			stmt.update(updateQuery,upBean.getPassword(),"",upBean.getEmail());
		}
	
}
