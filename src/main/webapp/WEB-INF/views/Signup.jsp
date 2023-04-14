<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> ManageBudget | SignUp</title>
</head>
<body>

	<form action="saveuser" method="post">
		First Name:<input type="text" name="firstName"><br><br>
		Last Name:<input type="text" name="lastName"><br><br>
		Email:    <input type="email" name="email"><br><br>
		Mobile No.:<input type="tel" name="mobileno"><br><br>
		Gender    :<input type="radio" name="gender" value="male"> Male 
					<input type="radio" name="gender" value="female"> Female<br><br>
		Date of Birth:<input type="date" name="dateofbirth"><br><br>
		Designation:<input type="text" name="designation"><br><br>
		Password:<input type="password" name="password"><br><br>
		Confirm Password:<input type="password" name="cpassword">
		<br><br>
		
		
		<input type="submit" value="Signup">
	
	</form>
	<a href="login">LogIn</a>

</body>
</html> -->




<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title> Expense Manager </title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Mar 09 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
  
  <style type="text/css">
 		.error {
 			color: red;
 		}
 	</style>
</head>

<body>

  <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block"> Expense Manager </span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                    <p class="text-center small">Enter your personal details to create account</p>
                  </div>
                  
                  <form role="form" action="saveuser" method="post"  id="signupform">
                <div class="mb-3">
                  <input type="text" class="form-control" placeholder="First Name" aria-label="Name" name="firstname" id="firstName">
                <span id="firstNameError" class="error"></span>
                </div>
                <div class="mb-3">
                  <input type="text" class="form-control" placeholder="Last Name" aria-label="Name" name="lastname" id="lastName">
                 <span id="lastNameError" class="error"></span>
                </div>
                
                <div class="mb-3">
                  <input type="email" class="form-control" placeholder="Email" aria-label="Email" name="email" id="email">
                <span id="emailError" class="error"></span>
                <span style="color: red;">${error}</span>
                </div>
               
                <div class="mb-3">
                  <input type="text" class="form-control" placeholder="Mobile No." aria-label="Name" name="mobileno" id="mobileno">
                <span id="mobilenoError" class="error"></span>
                </div>
                Gender :     <input type="radio" name="gender" value="male"> Male 
					<input type="radio" name="gender" value="female"> Female <br><br>
				<span id="genderError" class="error"></span>
				 <!-- <div class="mb-3">
                  <input type="radio" class="form-control"  name="gender" value="male">Male
                  <input type="radio" class="form-control" aria-label="Name" name="gender" value="female">Female
                </div>	 -->
                <div class="mb-3">
                  <input type="date" class="form-control" aria-label="Name" name="dateofbirth" id="dateofbirth">
                 <span id="dateofbirthError" class="error"></span>
                </div>
                <div class="mb-3">
                  <input type="text" class="form-control" placeholder="Designation" aria-label="Name" name="designation" id="designation">
                <span id="designationError" class="error"></span>
                </div>
                <div class="mb-3">
                  <input type="password" class="form-control" placeholder="Password" aria-label="Password" name="password" id="password">
                <span id="passwordError" class="error"></span>
                </div>
                <div class="mb-3">
                <input type="password" class="form-control" placeholder="Confirm Password" aria-label="Password" name="cpassword" id="cpassword">
                <span id="cpasswordError" class="error"></span>
                <span id="samepasswordError" class="error"></span>
                </div>
                <div class="form-check form-check-info text-start">
                
                  
                </div>
            
                  <button type="button" class="btn btn-primary w-100"  type ="submit" onclick="validation()" value="Signup">Sign up</button>
                </div>
                <p class="text-sm mt-3 mb-0">Already have an account? <a href="login" class="text-dark font-weight-bolder">Sign in</a></p>
              </form>
<!-- 
                  <form class="row g-3 needs-validation" novalidate action="saveuser" method="post">
                    <div class="col-12">
                      <label for="firstName" class="form-label">First Name</label>
                      <input type="text" name="firstname" class="form-control" id="firstName" required>
                      <div class="invalid-feedback">Please, enter your first name!</div>
                    </div>
                      
                        <div class="col-12">
                      <label for="lastName" class="form-label">Last Name</label>
                      <input type="text" name="lastname" class="form-control" id="lastName" required>
                      <div class="invalid-feedback">Please, enter your last name!</div>
                    </div>
                      
                    <div class="col-12">
                      <label for="yourEmail" class="form-label">Your Email</label>
                      <input type="email" name="email" class="form-control" id="yourEmail" required>
                      <div class="invalid-feedback">Please enter a valid Email adddress!</div>
                    </div>
                    
                       <div class="col-12">
                      <label for="gender" class="form-label">Your Gender</label><br><br>
                     <input type="radio" name="gender" value="male"> Male <br><br>
					<input type="radio" name="gender" value="female"> Female<br><br>
                    </div>

                    
                
					  <div class="col-12">
                      <label for="mobileno" class="form-label">Mobile No</label>
                      <input type="mobileno" name="mobileno" class="form-control" id="yourEmail" required>
                      <div class="invalid-feedback">Please enter a valid Mobile No!</div>
                    </div>
					
					
                    
                    	  <div class="col-12">
                      <label for="dateofbirth" class="form-label"> Date of Birth</label>
                   <input type="date" name="dateofbirth">
                      <div class="invalid-feedback">Please enter a valid Date of Birth!</div>
                    </div>
                    
                    <div class="col-12">
                      <label for="designation" class="form-label"> Designation </label><br><br>
                   <input type="text" name="designation">
                      <div class="invalid-feedback">Please enter a valid Designation</div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                      <input type="password" name="password" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                    
                       <div class="col-12">
                      <label for="confirmPassword" class="form-label">Confirm Password</label>
                      <input type="password" name="c`password" class="form-control" id="confirmPassword" required>
                      <div class="invalid-feedback">Please enter your  confirm password!</div>
                    </div>
                    
               

                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input" name="terms" type="checkbox" value="" id="acceptTerms" required>
                        <label class="form-check-label" for="acceptTerms">I agree and accept the <a href="#">terms and conditions</a></label>
                        <div class="invalid-feedback">You must agree before submitting.</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Create Account</button>
                    </div>
                    <div class="col-12">
                      <p class="small mb-0">Already have an account? <a href="pages-login.html">Log in</a></p>
                    </div> 
                    
                    
                  </form>
 -->
                </div>
              </div>

              <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
             
              </div>

            </div>
          </div>
        </div>

      </section>

    </div>
  </main><!-- End #main -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>


<script type="text/javascript">
  function validation() {
	  
	  isError = false;
	  /*
      firstName = document.getElementById("firstName");
      firstNameError = document.getElementById("firstNameError");
      firstNameRegex = /^[a-zA-Z]+$/;
      
      lastName = document.getElementById("lastName");
      lastNameError = document.getElementById("lastNameError");
      lastNameRegex = /^[a-zA-Z]+$/;
      */
      
      email = document.getElementById("email")
      emailError = document.getElementById("emailError");
      emailRegex = /^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-]{2,3}$/;
      
      mobileNo = document.getElementById("mobileno");
      mobileNoError = document.getElementById("mobilenoError");
      mobileNoRegex = /^[0-9]+$/;
      
      gender  = document.getElementsByName("gender");
      genderError = document.getElementById("genderError");
      
      
      dateofbirth = document.getElementById("dateofbirth");
      dateofbirthError = document.getElementById("dateofbirthError");
      
      designation = document.getElementById("designation");
      designationError = document.getElementById("designationError");
      designationRegex = /^[a-zA-Z]+$/;
      
      password = document.getElementById("password");
      passwordError = document.getElementById("passwordError");
      passwordRegex = /^[a-zA-Z0-9]+$/;
      //passwordvalue = document.getElementById("password").value; 
      
      cpassword = document.getElementById("cpassword");
      cpasswordError = document.getElementById("cpasswordError");
      
      /*
      if (firstName.value == '') {
          firstNameError.innerHTML = "Please Enter FirstName";
        	isError = true;
      } else {
          if (firstNameRegex.test(firstName.value) == false) {
              firstNameError.innerHTML = "Please Enter Valid FirstName";
              isError = true;
          } else {
              firstNameError.innerHTML = "";
          }
      }
      
      
      if(lastName.value == ''){
    	  lastNameError.innerHTML = "Please Enter LastName";
    	  isError = true;
      } else {
    	  if(lastNameRegex.test(lastName.value) == false){
    		  lastNameError.innerHTML = "Please Enter Valid LastName";
    	  isError = true;
    	  } else {
    		  lastNameError.innerHTML = "";
    	  } 
      }
      */
      
      if (email.value == '') {
          emailError.innerHTML = "Please Enter Email";
          isError = true;
      } else {
          if (emailRegex.test(email.value) == false) {
              emailError.innerHTML = "Please Enter Valid Email"
            isError = true;
          } else {
              emailError.innerHTML = ""
          }
      }
      
      if(mobileNo.value == ''){
    	  mobileNoError.innerHTML = "Please Enter Mobile Number";
    	  isError = true;
      } else {
    	  if(mobileNoRegex.test(mobileNo.value) == false){
    		  mobileNoError.innerHTML = "Mobile Number contain only numbers";
    		  isError = true;
    	  } else {
    		  mobileNoError.innerHTML = "";
    	  } 
      }
      
      if( !(gender[0].checked || gender[1].checked)){
    		
    		isError = true; 
    		genderError.innerHTML = "Please Select Gender";
    	}else {
    		genderError.innerHTML = "";
  	  }
      
      if(dateofbirth.value == ''){
    	  dateofbirthError.innerHTML = "Please Enter Date of birth";
    	  isError = true;
      }  else {
    	  dateofbirthError.innerHTML = "";
    	  }
      
      if(designation.value == ''){
    	  designationError.innerHTML = "Please Enter designation";
    	  isError = true;
      } else {
    	  if(designationRegex.test(designation.value) == false){
    		  designationError.innerHTML = "Please Enter Valid designation";
    		  isError = true;
    	  } else {
    		  designationError.innerHTML = "";
    	  } 
      }
      
   
      if(password.value == ''){
    	  passwordError.innerHTML = "Please Enter Password";
    	  idError = true;
      } else {
    	  if(password.value.length < 8 ){
    		  passwordError.innerHTML = "Please Enter Valid Password";
    		  isError = true;
    	  } else {
    		  passwordError.innerHTML = "";
    	  }
      }
      
      if(cpassword.value == ''){
    	  cpasswordError.innerHTML = "Please Enter Confirm Password";
    	  isError = true;
    	  
      } else {
    	  
    	  cpasswordError.innerHTML = "";
    	  if(password.value != cpassword.value){
    		  samepasswordError.innerHTML = "Password did not match";
    		  isError = true;
    	  } else {
    		  samepasswordError.innerHTML = "";
    		  cpasswordError.innerHTML = "";
    	  } 
      }
     
      
      if(isError == false){
          signupform = document.getElementById("signupform");
          signupform.submit(); 
      }
      
       	
     
  }//end of validation function
  </script>
</body>

</html>

