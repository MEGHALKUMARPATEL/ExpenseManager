<%@page import="com.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyProfile</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>
		
		<%
			UserBean user = (UserBean)session.getAttribute("user");
		%>

	<jsp:include page="HeaderNav.jsp"></jsp:include>
	
	<%if(user.getRole() == 1)
{ %>
	<jsp:include page="AdminSideBar.jsp"></jsp:include>
<%} else {%>

		<jsp:include page="UserSideBar.jsp"></jsp:include>
		<%} %>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Profile</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
				<li class="breadcrumb-item">Profile</li>
				<li class="breadcrumb-item active">My Profile</li>
			</ol>
		</nav>
	</div>



	
	
	
	
	
	
	
	<section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">

              <img src="${user.imageUrl}" alt="Profile" class="rounded-circle">
              <h2>${user.firstname}</h2>
              <h3>${user.role==1?"Admin":"Customer"}</h3>
              
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">

                <li class="nav-item" role="presentation">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" aria-selected="true" role="tab">Overview</button>
                </li>

                <li class="nav-item" role="presentation">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit" aria-selected="false" role="tab" tabindex="-1">Edit Profile</button>
                </li>

             

                <li class="nav-item" role="presentation">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password" aria-selected="false" role="tab" tabindex="-1">Change Password</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade profile-overview active show" id="profile-overview" role="tabpanel">
               
                

                  <h5 class="card-title">Profile Details</h5>
                  
				<form action="updateuserprofile" method="post">
                  <div class="row">
                  
                    <div class="col-lg-3 col-md-4 label ">First Name</div>
                    <div class="col-lg-9 col-md-8">
                    <input type="text" value="${user.firstname}" name="firstName">
                    </div>
                  </div>
				
                  <div class="row">
                   <div class="col-lg-3 col-md-4 label ">Last Name</div>
                    <div class="col-lg-9 col-md-8">
  					 <input type="text" value="${user.lastname}" name="lasttName"> 
  					  </div>
                  </div> 
                  
                   <div class="col-md-6">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Email</label>
                    <input disabled="disabled" class="form-control" name="email" value="${user.email}" onfocus="focused(this)" onfocusout="defocused(this)">
                  </div>
                </div>
                  
                  <div class="row">
                   <div class="col-lg-3 col-md-4 label ">Mobile No</div>
                    <div class="col-lg-9 col-md-8">
  					 <input type="text" value="${user.mobileno}" name="mobileno"> 
  					  </div>
                  </div>
                  
               <div class="col-md-4">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Gender</label><br>
                    Male &nbsp<input  type="radio" name="gender" value="male" onfocus="focused(this)" onfocusout="defocused(this)">&nbsp&nbsp
                    Female &nbsp<input  type="radio" name="gender" value="female" onfocus="focused(this)" onfocusout="defocused(this)">
                  </div>
                  
                  </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="example-text-input" class="form-control-label">Date of Birth</label>
                    <input class="form-control" type="date" name="dateofbirth" value="${user.dateofbirth }" onfocus="focused(this)" onfocusout="defocused(this)">
                  </div>
                </div>
                  
                  <div class="row">
                   <div class="col-lg-3 col-md-4 label ">Designation</div>
                    <div class="col-lg-9 col-md-8">
  					 <input type="text" value="${user.designation}" name="designation"> 
  					  </div>
                  </div>                

                  
                  	<div class="col-6">
										<button class="btn btn-primary w-100" type="submit">Submit</button>
									</div>
									</form>

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit" role="tabpanel">

                  <!-- Profile Edit Form -->
                  <form action="saveprofilepic" method="post" enctype="multipart/form-data">
                  <input type="hidden" name="userId" value="${user.userid}">
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                        <img src="${user.imageUrl}" alt="Profile">
                         
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Profile Pic</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="profileImg" type="file" class="form-control" id="fullName" value="Kevin Anderson">
                      </div>
                    </div>
                    
                    

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

             
                  <!-- Settings Form -->
                

                </div>

                <div class="tab-pane fade pt-3" id="profile-change-password" role="tabpanel">
                  <!-- Change Password Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Change Password</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </section>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</main>


	<jsp:include page="AllJS.jsp"></jsp:include>


</body>
</html>