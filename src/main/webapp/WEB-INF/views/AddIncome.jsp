<%@page import="com.bean.VendorBean"%>
<%@page import="com.bean.SubCategoryBean"%>
<%@page import="com.bean.CategoryBean"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.bean.StatusBean"%>
<%@page import="com.bean.AccountTypeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Manager | Add Income</title>
</head>
<body>

		<%
		List<AccountTypeBean> accountTypeList = (List<AccountTypeBean>)request.getAttribute("accountTypeList");
		List<StatusBean> statusList = (List<StatusBean>)request.getAttribute("statusList");
		%>

Add your income here

	<form action="saveincome" method="post">
		Title : <input type="text" name="title"> <br><br>
		
		Account Type : <select name="accountTypeId">
			<% 
				for(AccountTypeBean ab:accountTypeList){ %>
					<option value="<%=ab.getAccountTypeId()%>"><%=ab.getAccountTypeName() %></option>
					<%} %>	
				</select><br><br>
				
		Status  : <select name="statusId">
			<% 
				for(StatusBean stb:statusList){ %>
					<option value="<%=stb.getStatusId()%>"><%=stb.getStatusName() %></option>
					<%} %>	
				</select><br><br>	
				
		             <%
						Calendar c = Calendar.getInstance(); 
						int d = c.get(c.DAY_OF_MONTH); //07 
						int m = c.get(c.MONTH)+1;//03
						String mon = "";
						String dt = "";
						if(m<=9){
							mon = 0+""+m; 
						}else{
							mon = m+"";
						}
						if(d <= 9){
							dt = 0+""+d;
						}else{
							dt = d+"";
						}
						int y = c.get(c.YEAR);//2023 
						System.out.println(y+"-"+m+"-"+d);
					%>
		
		Date :  <input type ="date" id="myDate" name = "date" value="<%=y+"-"+mon+"-"+dt%>"><br><br>
		Amount: <input type="text" name="amount" >				
	
		Description : <textarea rows="5" cols="15" name="description"></textarea><br><br>	
		
		<input type="submit" value="SaveIncome">
	</form>

</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Expense Manager | NewIncome</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title> Expense Manager | NewIncome</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>
<%
			List<CategoryBean> categoryList = (List<CategoryBean>)request.getAttribute("categoryList");
			List<SubCategoryBean> subCategoryList = (List<SubCategoryBean>)request.getAttribute("subCategoryList");
			List<VendorBean> vendorList = (List<VendorBean>)request.getAttribute("vendorList");
			List<AccountTypeBean> accountTypeList = (List<AccountTypeBean>)request.getAttribute("accountTypeList");
			List<StatusBean> statusList = (List<StatusBean>)request.getAttribute("statusList");
		%>



	<!-- ======= Header ======= -->
	<jsp:include page="HeaderNav.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<jsp:include page="UserSideBar.jsp"></jsp:include>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
	         <a href="admindashboard"><h1>Income</h1></a>

			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="listincome.jsp">NewIncome</a></li>
					
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->


		
		<main>
    <!-- <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4"> -->
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

              <div class="d-flex justify-content-center py-4">
                <a href="index.html" class="logo d-flex align-items-center w-auto">
                  <img src="assets/img/logo.png" alt="">
                  <span class="d-none d-lg-block">ExpenseManager</span>
                </a>
              </div><!-- End Logo -->

              <div class="card mb-3">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Add New Income</h5>
                  
                  </div>

                 <!--  <form class="row g-3 needs-validation" novalidate action="saveexpense" method="post">

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Expense</label>
                      <input type="text" name="categoryName" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your New Expense</div>
                    </div>

                    
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Add New Expense</button>
                    </div>
                   
                  </form> -->
                  
                  <form role="form" action="saveincome" method="post">
										<div class="mb-3">
											<input type="text" class="form-control form-control-lg"
												placeholder="Title" aria-label="Title" name="title">
										</div>
										
													
											<div class="mb-3">		
										<select name="accountTypeId" class="form-control form-control-lg">
											 <option value="none" selected disabled hidden>Select Income</option>
												<% 
													for(AccountTypeBean ab:accountTypeList){ %>
														<option value="<%=ab.getAccountTypeId()%>"><%=ab.getAccountTypeName() %></option>
														<%} %>	
													</select>
											</div>		
											<div class="mb-3">		
										<select name="statusId" class="form-control form-control-lg">
											 <option value="none" selected disabled hidden>Select Payment Status</option>
												<% 
													for(StatusBean sb:statusList){ %>
														<option value="<%=sb.getStatusId()%>"><%=sb.getStatusName() %></option>
														<%} %>	
													</select><br>	
												</div>		
										<div class="mb-3">
											<input type="text" class="form-control form-control-lg"
												placeholder="Amount" aria-label="Amount" name="amount">
										</div>	
										
										<%
											Calendar c = Calendar.getInstance(); 
											int d = c.get(c.DAY_OF_MONTH); //07 
											int m = c.get(c.MONTH)+1;//03
											String mon = "";
											String dt = "";
											if(m<=9){
												mon = 0+""+m; 
											}else{
												mon = m+"";
											}
											if(d <= 9){
												dt = 0+""+d;
											}else{
												dt = d+"";
											}
											int y = c.get(c.YEAR);//2023 
											System.out.println(y+"-"+m+"-"+d);
										%>	
										
										<div class="mb-3">
										
										<input type ="date" id="myDate" name = "date" value="<%=y+"-"+mon+"-"+dt%>">
										</div>											
										
										<div class="mb-3">
										</div>	
										<textarea class="form-control form-control-lg" rows="5" placeholder="Description" aria-label="Description" cols="15" name="description"></textarea>
										</div>
										
										<div class="text-center">
											<button type="submit"
												class="btn btn-lg btn-primary btn-lg w-100 mt-4 mb-0">Add New Income</button>
											<a href="listexpense"><button type="button"
												class="btn btn-lg btn-primary btn-lg w-100 mt-4 mb-0" style="background-color: red;">Cancel</button></a>	
										</div>
									</form>
                  <br><br>
                    
                </div>
              </div>

               
            </div>
          </div>
        </div>

     <!--  </section>

    </div> -->
  </main><!-- End #main -->
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>Expense Manager | </span></strong>.
			All Rights Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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

</body>

</html>