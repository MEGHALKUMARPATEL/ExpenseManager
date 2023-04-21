<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="savevendor" method="post">
		VendorName : <input type="text" name="vendorName"/>
		
		<br><br>
		<input type="submit" value="Save Vendor"/>
	</form>
	<a href="listvendor">List Vendor</a> 
</body>
</html> -->

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Expense Manager | vendor</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title> Expense Manager | Newvendor</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>



	<!-- ======= Header ======= -->
	<jsp:include page="HeaderNav.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<jsp:include page="AdminSideBar.jsp"></jsp:include>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<a href="admindashboard"><h1>Vendor</h1></a>

			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="listcategory.jsp">NewVendor</a></li>
					
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
                    <h5 class="card-title text-center pb-0 fs-4">Add New Vendor</h5>
                  
                  </div>

                  <form class="row g-3 needs-validation" novalidate action="savevendor" method="post">

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Vendor</label>
                      <input type="text" name="vendorName" class="form-control" id="yourPassword" required>
                      <div class="invalid-feedback">Please enter your New Vendor</div>
                    </div>

                    
                    </div>
                    <div class="col-12">
                      <button class="btn btn-primary w-100" type="submit">Add New Vendor</button>
                    </div>
                   
                  </form>
                  <br><br>
                    <div class="col-6"><a href="listvendor"> <button class="btn btn-primary w-100" type="submit">Vendor List</button></a>
                     
                    </div>

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