<%@page import="com.bean.IncomeChartBean"%>
<%@page import="com.bean.ExpenseChartBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
</head>
<body>
<h2>Admin Dashboard</h2>

<a href="newcategory">Add New Category</a>
<br><br>
<a href="listcategories">List Category</a>
<br><br>

<a href="subcategories"> Add Sub Category</a>
<br><br>
<a href="status">Status</a>
<br><br>
<a href="vendor">Vendor</a>

<br><br>
<a href="accounttype">Account Type</a>

</body>
</html> -->



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<title>Dashboard - Expense Manager</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">


</head>

<body>
	
	<jsp:include page="AdminSideBar.jsp" ></jsp:include>
	
	<!-- ======= Header ======= -->
 	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="index.html" class="logo d-flex align-items-center"> <img
				src="" alt=""> <span
				class="d-none d-lg-block">Expense Manager</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="admindashboard.jsp">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle  href="admindashboard.jsp">
						<i class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->

				
				

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Expense Manager</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item active">Dashboard</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
            <!-- START WIDGETS -->
		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">

						<!-- Sales Card -->
						<div class="col-xxl-3 col-md-3">
							<div class="card info-card sales-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Today's Expense <span>| Today</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6>${totalExpenseAmount==null?0:totalExpenseAmount}</h6>
											<span class="text-success small pt-1 fw-bold">2%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->



						<!-- Sales Card -->
						<div class="col-xxl-3 col-md-3">
							<div class="card info-card sales-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
									This Month Expense <span>| Today</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6>${totalExpense}</h6>
											<span class="text-success small pt-1 fw-bold">2%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Sales Card -->
						<!-- Revenue Card -->
						<div class="col-xxl-3 col-md-3">
							<div class="card info-card revenue-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
								 This Month New Clients	 <span>| This Month</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<div class="ps-3">
											<h6>${totalMonthlyClientsCount}</h6>
											<span class="text-success small pt-1 fw-bold">20%</span> <span
												class="text-muted small pt-2 ps-1">increase</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Revenue Card -->

						<!-- Customers Card -->
						<div class="col-xxl-3 col-xl-3">

							<div class="card info-card customers-card">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
									 Month Expense <span>| This Month</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<div class="ps-3">
											<h6>${totalExpenseAmountCurrentMonth==null?0:totalExpenseAmountCurrentMonth}</h6>
											<span class="text-danger small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">decrease</span>

										</div>
									</div>

								</div>
							</div>

						</div>
						<!-- End Customers Card -->
					</div>
					
					<!-- END WIDGETS -->
					<!-- START CHART -->
								<%
									List<ExpenseChartBean> chartData = (List<ExpenseChartBean>) request.getAttribute("chartData");
									List<IncomeChartBean> incomechartData = (List<IncomeChartBean>) request.getAttribute("incomeChartData");
								%>
								<!-- Line Chart -->
								<div class="card-body">
								<div class="col-12">
									<canvas id="expensechart"></canvas>
								</div>
								</div>
								
								<br><br>
								<div class="card-body">
								<div class="col-6">
									<canvas id="incomechart"></canvas>
								</div>
								</div>

								<script>
								 colorArray =  [
								      'rgba(255, 99, 132, 0.2)',
								      'rgba(255, 159, 64, 0.2)',
								      'rgba(255, 205, 86, 0.2)',
								      'rgba(75, 192, 192, 0.2)',
								      'rgba(54, 162, 235, 0.2)',
								      'rgba(153, 102, 255, 0.2)',
								      'rgba(201, 203, 207, 0.2)',
								      'rgba(230, 125, 57, 0.2)',
								      'rgba(125, 230, 57, 0.2)',
								      'rgba(112, 150, 110, 0.2)',
								      'rgba(55, 55, 55, 0.2)',
								      'rgba(66, 66, 66, 0.2)'
								      
								    ]
								 
								 bgColor = [];
								 
										<%for(int i=0;i<chartData.size();i++){%>
										
											bgColor.push(colorArray[<%=i%>]);
										<%}%>
								
									const ctx = document
											.getElementById('expensechart');
									new Chart(
											ctx,
											{
												type : 'bar',
												data : {
													labels : [ 
														<%for (ExpenseChartBean o : chartData) {%>
														 '<%=o.getMonth()%>',
															<%}%>],
													datasets : [ {
														label : '# of ExpenseAmount',
						 								data : [
															<%for (ExpenseChartBean o : chartData) {%>
																	<%=o.getExpenseAmount()%>,
															<%}%>
															],
															backgroundColor:bgColor
															,
														borderWidth : 1
													} ]
												},
												options : {
													scales : {
														y : {
															beginAtZero : true
														}
													}
												}
											});
								</script>

							</div>

						</div>
					</div>

							</div>

						</div>
					</div> 
					 <!-- End  LINE chart -->
					 <!-- Make new chart from here -->
					 
					 
					
								
								<!-- Line Chart -->
								<%-- <div>
									<canvas id="incomechart"></canvas>
								</div> --%>

								<script>
								 colorArray =  [
								      'rgba(255, 99, 132, 0.2)',
								      'rgba(255, 159, 64, 0.2)',
								      'rgba(255, 205, 86, 0.2)',
								      'rgba(75, 192, 192, 0.2)',
								      'rgba(54, 162, 235, 0.2)',
								      'rgba(153, 102, 255, 0.2)',
								      'rgba(201, 203, 207, 0.2)',
								      'rgba(230, 125, 57, 0.2)',
								      'rgba(125, 230, 57, 0.2)',
								      'rgba(112, 150, 110, 0.2)',
								      'rgba(55, 55, 55, 0.2)',
								      'rgba(66, 66, 66, 0.2)'
								      
								    ]
								 
								 bgColor = [];
								 
										<%for(int i=0;i<chartData.size();i++){%>
										
											bgColor.push(colorArray[<%=i%>]);
										<%}%>
								
									const ctx1 = document
											.getElementById('incomechart');
									new Chart(
											ctx1,
											{
												type : 'doughnut',
												data : {
													labels : [ 
														<%for (IncomeChartBean o : incomechartData) {%>
														 '<%=o.getMonth()%>',
															<%}%>],
													datasets : [ {
														label : '# of IncomeAmount',
						 								data : [
															<%for (IncomeChartBean o : incomechartData) {%>
																	<%=o.getIncomeAmount()%>,
															<%}%>
															],
															backgroundColor:bgColor
															,
														borderWidth : 1
													} ]
												},
												options : {
													scales : {
														y : {
															beginAtZero : true
														}
													}
												}
											});
								</script>

							</div>
 
						</div>
					</div>

							</div>

						</div>
					</div> 
					 
				 
				
				
				<!-- entry mpankvaihim -->
					<div class="col-12">
						<div class="card recent-sales overflow-auto">

							<div class="filter">
								<a class="icon" href="#" data-bs-toggle="dropdown"><i
									class="bi bi-three-dots"></i></a>
								<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
									<li class="dropdown-header text-start">
										<h6>Filter</h6>
									</li>

									<li><a class="dropdown-item" href="#">Today</a></li>
									<li><a class="dropdown-item" href="#">This Month</a></li>
									<li><a class="dropdown-item" href="#">This Year</a></li>
								</ul>
							</div>

							<div class="card-body">
								<h5 class="card-title">
									Recent Expense <span>| Today</span>
								</h5>

								<table class="table table-borderless datatable">
									<thead>
										<tr>
											<th scope="col">ID</th>
											<th scope="col">Customer</th>
											<th scope="col">Product</th>
											<th scope="col">Price</th>
											<th scope="col">Status</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row"><a href="#">1</a></th>
											<td> Meghal</td>
											<td><a href="#" class="text-primary"> Shoes
													</a></td>
											<td>1000</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">2</a></th>
											<td>Pankaj Luhar</td>
											<td><a href="#" class="text-primary">Grocery
													</a></td>
											<td>1007</td>
											<td><span class="badge bg-warning">Pending</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">3</a></th>
											<td>Vaibhav</td>
											<td><a href="#" class="text-primary">Laptop
											</a></td>
											<td>200000</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr>
										<tr>
											<th scope="row"><a href="#">4</a></th>
											<td>Himansh</td>
											<td><a href="#" class="text-primar"> Bike
												</a></td>
											<td>2007</td>
											<td><span class="badge bg-danger">Rejected</span></td>
										</tr>
										<!-- <tr>
											<th scope="row"><a href="#">#2644</a></th>
											<td>Raheem Lehner</td>
											<td><a href="#" class="text-primary">Sunt similique
													distinctio</a></td>
											<td>$165</td>
											<td><span class="badge bg-success">Approved</span></td>
										</tr> -->
									</tbody>
								</table>

							</div>

						</div>
					</div>
					
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
