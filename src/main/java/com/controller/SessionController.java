package com.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.ForgetPasswordBean;
import com.bean.LoginBean;
import com.bean.UpdatePasswordBean;
import com.bean.UserBean;
import com.dao.UserDao;
import com.service.EmailService;
import com.util.OtpGenerator;


//annotation
@Controller
public class SessionController {
		
	@Autowired
	UserDao userDao;
	
	@Autowired
	EmailService emailService;
	
	//jsp open
	@GetMapping("/signup")
	public String signup() {
		System.out.println("Hello web");
		return "Signup";
	}
	
	//jsp input process
	@PostMapping("/saveuser")
	public String saveuser(UserBean user) {
		System.out.println(user.getFirstname());
		System.out.println(user.getLastname());
		System.out.println(user.getEmail());
		System.out.println(user.getMobileno());
		System.out.println(user.getDesignation());
		System.out.println(user.getDateofbirth());
		System.out.println(user.getGender());
		System.out.println(user.getPassword());
		System.out.println(user.getCreatedAt());
		//
		
		//validation
		//dbValidation
		//insert
		userDao.insertUser(user);
		return "Login";
	} 
	
	@GetMapping("/login")
	public String login(LoginBean login) {
		System.out.println(login.getEmail());
		System.out.println(login.getPassword());
		return "Login";
	}
	@GetMapping("/forgetpassword")
	public String forgetPassword() {
		return "ForgetPassword";
	}
	@PostMapping("/authentication")
	public String authentication(LoginBean login, Model model, HttpServletResponse response, HttpSession session ){
		System.out.println(login.getEmail());
		System.out.println(login.getPassword());
		
		//validation :true
		//db -> users ->email : password match -> loginBean:email,password
		
		UserBean userBean = userDao.authenticateUser(login);
		
		if(userBean == null) {
			//invalid
			model.addAttribute("error","Invalid Credentials");
			return "Login";
		}else {
			
				//valid
			    // cookie
			
			Cookie c1 = new Cookie("userId", userBean.getUserid()+"");
			Cookie c2 = new Cookie("firstName", userBean.getFirstname());
			response.addCookie(c1);
			response.addCookie(c2);
			// add cookie
			
			//session
			session.setAttribute("userId", userBean.getUserid());
			session.setAttribute("user",userBean);
			
			//max inactive interval time
			session.setMaxInactiveInterval(60*5);
			
			
			
				if(userBean.getRole() == 1) {
					//admin
					return "redirect:/admindashboard";
				}else if(userBean.getRole() == 2) {
					//user
					return "redirect:/home";
				}else { 
					return "404";
				}
		}
	}
	
	@PostMapping("/sendotpforgetpassword")
	public String sendOtpForgetPassword(ForgetPasswordBean forgetPasswordBean, Model model) {
			System.out.println(forgetPasswordBean.getEmail());
			
			UserBean user = userDao.findUserByEmail(forgetPasswordBean);
			if(user == null) {
				//error
				model.addAttribute("error", "Invalid Email");
				return "ForgetPassword";
			}else {
				//otp
				//generate otp
				String otp = OtpGenerator.generatOTP(6);
				userDao.updateOtp(forgetPasswordBean.getEmail(), otp);
				//user set -->email
				//send mail
				emailService.sendEmailForForgetPassword(forgetPasswordBean.getEmail(), otp);
				return "redirect:/updatepasswordjspopen";
			}
		
	}
	
	@GetMapping("/updatepasswordjspopen")
	public String updatePasswordJspOpen() {
		return "UpdatemyPassword";
	}
	
	@PostMapping("/updatemypassword")
	public String updateMyPassword(UpdatePasswordBean upBean, Model model) {
		System.out.println(upBean.getEmail());
		System.out.println(upBean.getPassword());
		System.out.println(upBean.getOtp());
		
		UserBean user = userDao.verifyOtpByEmail(upBean);
		if(user == null) {
			return "UpdatemyPassword";
		} else {
			userDao.updateMyPassword(upBean);
			return "Login";
		}
		
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
	/*
	 * @GetMapping("/edituser") public String editUser(@RequestParam("userId")
	 * Integer userId, Model model) { UserBean userBean =
	 * userDao.getUserById(userId); System.out.println(userBean.getUserId());
	 * model.addAttribute("userBean",userBean); return "EditUser"; }
	 * 
	 * @PostMapping("/updateuser") public String updateUser(UserBean userBean) {
	 * userDao.updateUser(userBean);
	 * 
	 * return "redirect:/listusers"; }
	 * 
	 * @GetMapping("/userProfile") public String userProfile() {
	 * 
	 * return "UserProfile"; }
	 * 
	 * // @PostMapping("/updateprofilephoto") // public String
	 * updateProfilePhoto(ProfileBean profileBean) { //
	 * System.out.println(profileBean.getUserId()); //
	 * System.out.println(profileBean.getProfileImg().getOriginalFilename()); // try
	 * { // File userDir = new File(
	 * "C:\\Users\\Hp\\Documents\\workspace-spring-tool-suite-4-4.17.2.RELEASE\\ExpenseManager\\src\\main\\resources\\static\\assets\\profiles"
	 * ,profileBean.getUserId() + ""); // if(userDir.exists() == false) { //
	 * userDir.mkdir(); // } // File file = new File(userDir,
	 * profileBean.getProfileImg().getOriginalFilename()); //
	 * FileUtils.writeByteArrayToFile(file, profileBean.getProfileImg().getBytes());
	 * // profileBean.setImageUrl("assets/profiles/" + profileBean.getUserId() + "/"
	 * + profileBean.getProfileImg().getOriginalFilename()); // //
	 * userDao.updateProfilePhoto(profileBean); // // } catch (Exception e) { //
	 * e.printStackTrace(); //
	 * System.out.println("Error Session Controller Update Profile"); // } // return
	 * "redirect:/userProfile"; // } //
	 * 
	 * @PostMapping("/updateprofilephoto") public String updateProfile(ProfileBean
	 * profileBean) { System.out.println(profileBean.getUserId());
	 * System.out.println(profileBean.getProfileImg().getOriginalFilename()); try {
	 * File userDir = new File(
	 * "C:\\Users\\Hp\\Documents\\workspace-spring-tool-suite-4-4.17.2.RELEASE\\ExpenseManager\\src\\main\\resources\\static\\assets\\profiles"
	 * ,profileBean.getUserId() + ""); if (userDir.exists() == false) {
	 * userDir.mkdir(); } File file = new File(userDir,
	 * profileBean.getProfileImg().getOriginalFilename());
	 * FileUtils.writeByteArrayToFile(file, profileBean.getProfileImg().getBytes());
	 * profileBean.setImageUrl("assets/profiles/" + profileBean.getUserId() + "/" +
	 * profileBean.getProfileImg().getOriginalFilename());
	 * 
	 * userDao.updateProfilePhoto(profileBean);
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } return
	 * "redirect:/userProfile";
	 * 
	 * }
	 */ 
	/*
	 * @PostMapping("/updateuserprofile") public String updateUserProfile(UserBean
	 * userBean) { userDao.updateUser(userBean); "redirect:/userProfile"; }
	 */
	 
	
	//jsp input process
}

