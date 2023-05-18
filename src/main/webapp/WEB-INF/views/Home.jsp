 <%@page import="com.bean.CategoryChartBean"%>
<%@page import="com.bean.IncomeChartBean"%>
<%@page import="com.bean.ExpenseChartBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>You have logged in Succesfully</h1>

<br><br><br><br>
<a href="addexpensejsp">Add Expense</a>

<br><br>
<a href="addincomejsp">Add Income</a>

<br><br><br>
<a href = "logout">Logout</a>
<br><br>


</body>
</html> -->

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dashboard - Expense Manager Bootstrap Template</title>
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
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Mar 09 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
<jsp:include page="UserSideBar.jsp"></jsp:include>

  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Expense Manager</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="admindashboard.jsp">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    
  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
    </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>Expense Manager</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

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
											<h6>${totalTodayExpensesAmount==null?0:totalTodayExpensesAmount}</h6>
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
									Current Month Expense Amount <span>| Today</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-cart"></i>
										</div>
										<div class="ps-3">
											<h6>${totalMonthlyExpenseAmount==null?0:totalMonthlyExpenseAmount}</h6>
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
								Current Month Income <span>| Income</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-currency-dollar"></i>
										</div>
										<div class="ps-3">
											<h6>${totalMonthlyIncomeAmount==null?0:totalMonthlyIncomeAmount}</h6>
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
									 Current Year <span>| Expenses</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-people"></i>
										</div>
										<div class="ps-3">
											<h6>${sumOfYearlyExpense==null?0:sumOfYearlyExpense}</h6>
											<span class="text-danger small pt-1 fw-bold">12%</span> <span
												class="text-muted small pt-2 ps-1">decrease</span>

										</div>
									</div>

								</div>
							</div>

						</div>
						<!-- End Customers Card --></div>
						
						
						<!-- widgets

 -->    
 
 
 
<%--  <div class="col-12">
						<div class="card">


							<div class="card-body">
								

								<%
									List<ExpenseChartBean> expenseChartData = (List<ExpenseChartBean>) request.getAttribute("expenseChartDataUser");
									List<CategoryChartBean> categoryChartData = (List<CategoryChartBean>) request.getAttribute("categoryChartDataUser");	
								/* List<IncomeChartBean> incomeChartData = (List<IncomeChartBean>) request.getAttribute("incomeChartDataUser"); */ 
								%>
								<!-- Line Chart -->
								<div>
										<h5 class="card-title">Category-Expenses</h5>
										<div class="col-4">
											<canvas id="categorychartUser" class="chartjs-render-monitor"></canvas>
										</div>
										<br><br>
										<h5 class="card-title">Expense-Monthly</h5>
									<canvas id="expensechartUser"></canvas>
								</div>
								
								
					<script>

					 BGcolorArray= [
						    'rgba(75, 192, 192, 0.4)',
					        'rgba(153, 102, 255, 0.4)',
					        'rgba(255, 159, 64, 0.4)',
						    'rgba(255, 99, 132, 0.4)',
					        'rgba(54, 162, 235, 0.4)',
					        'rgba(255, 206, 86, 0.4)'
					            
					      ]
					 
					  bordderArray = [
						  'rgba(75, 192, 192, 1)',
					        'rgba(153, 102, 255, 1)',
					        'rgba(255, 159, 64, 1)',
						    'rgba(255, 99, 132, 1)',
					        'rgba(54, 162, 235, 1)',
					        'rgba(255, 206, 86, 1)'
					        ]
					 
						bgColor = [];
						borderColor = [];
						
						<% for(int i = 0; i<categoryChartData.size(); i++){%>
							bgColor.push(BGcolorArray[<%=i%>]);
						<%}%>
						
						<% for(int i=0; i<categoryChartData.size(); i++){ %>
							borderColor.push(bordderArray[<%=i%>]);
						<%}%>
						
					
						const ctx2 = document.getElementById('categorychartUser'); 
						
						new Chart(
								ctx2,
								{
									type : 'doughnut',
									data : {
										labels : [ 
											 <%for (CategoryChartBean e : categoryChartData) {%>
											 '<%=e.getCategoryName()%>',
												<%}%> ],
										datasets : [ {
											label : '# of Category Count',
											data : [
												 <%for (CategoryChartBean e : categoryChartData) {%>
														<%=e.getCategoryCount()%>,
												<%}%> 
												],
												 backgroundColor: bgColor,
											       borderColor: borderColor,
											       borderWidth: 1
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
								
								
								
								
							<script type="text/javascript">
							 
							 BGcolorArray= [
								    'rgba(75, 192, 192, 0.4)',
							        'rgba(153, 102, 255, 0.4)',
							        'rgba(255, 159, 64, 0.4)',
								    'rgba(255, 99, 132, 0.4)',
							        'rgba(54, 162, 235, 0.4)',
							        'rgba(255, 206, 86, 0.4)'
							            
							      ]
							 
							  bordderArray = [
								  'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)',
								    'rgba(255, 99, 132, 1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)'
							        ]
							 
								bgColor = [];
								borderColor = [];
								
								<% for(int i = 0; i<categoryData.size(); i++){%>
									bgColor.push(BGcolorArray[<%=i%>]);
								<%}%>
								
								<% for(int i=0; i<categoryChartData.size(); i++){ %>
									borderColor.push(bordderArray[<%=i%>]);
								<%}%>
 
							 const ctx2 = document.getElementById('categorychartUser');
							
							 new Chart(ctx2, {
							   type: 'doughnut',
							   data: {
							     labels: [<%for(CategoryChartBean cb : categoryChartData){%>
							       '<%=cb.getCategoryName()%>',
							     <%}%>
							     ],
							     datasets: [{
							       label: '# Category',
							       data: [ <%for(CategoryChartBean cb : categoryChartData){%>
							         <%=cb.getCategoryCount()%>,
							       <%}%> ],
							       backgroundColor: bgColor,
							       borderColor: borderColor,
							       borderWidth: 1
							     }]
							   },
							   options: {
							     cutout: '50%',
							     plugins: {
							       title: {
							         display: true,
							         text: 'Category wise chart'
							       },
							       legend: {
							         position: 'bottom'
							       }
							     }
							   }
							 });  
 
 						</script>
								
								
								
								<div>
									<canvas id="pieChart" class="chartjs-render-monitor"></canvas>
								</div>
							<script type="text/javascript">
							 
							 BGcolorArray= [
								  'rgba(75, 192, 192, 0.4)',
							        'rgba(153, 102, 255, 0.4)',
							        'rgba(255, 159, 64, 0.4)',
								    'rgba(255, 99, 132, 0.4)',
							        'rgba(54, 162, 235, 0.4)',
							        'rgba(255, 206, 86, 0.4)'
							            
							      ]
							 
							  bordderArray = [
								  'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)',
								    'rgba(255, 99, 132, 1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)'
							        ]
							 
								bgColor = [];
								borderColor = [];
								
								<% for(int i = 0; i<pieStatus.size(); i++){%>
									bgColor.push(BGcolorArray[<%=i%>]);
								<%}%>
								
								<% for(int i=0; i<pieStatus.size(); i++){ %>
									borderColor.push(bordderArray[<%=i%>]);
								<%}%>
 
							 const ctx3 = document.getElementById('pieChart');
							
							 new Chart(ctx3, {
							   type: 'doughnut',
							   data: {
							     labels: [<%for(ChartExpenseBean db : pieStatus){%>
							       '<%=db.getStatus()%>',
							     <%}%>
							     ],
							     datasets: [{
							       label: '# Transaction Status',
							       data: [ <%for(ChartExpenseBean db : pieStatus){%>
							         <%=db.getTransaction()%>,
							       <%}%> ],
							       backgroundColor: bgColor,
							       borderColor: borderColor,
							       borderWidth: 1
							     }]
							   },
							   options: {
							     cutout: '50%',
							     plugins: {
							       title: {
							         display: true,
							         text: 'Donut Chart'
							       },
							       legend: {
							         position: 'bottom'
							       }
							     }
							   }
							 });  
 
 						</script>


								
								

					<script>

					
						const ctx3 = document.getElementById('expensechartUser');
						new Chart(
								ctx3,
								{
									type : 'bar',
									data : {
										labels : [ 
											 <%for (ExpenseChartBean e : expenseChartData) {%>
											 '<%=e.getMonth()%>',
												<%}%> ],
										datasets : [ {
											label : '# of ExpenseAmount',
											data : [
												 <%for (ExpenseChartBean e : expenseChartData) {%>
														<%=e.getExpenseAmount()%>,
												<%}%> 
												],
												backgroundColor: [
													'rgba(255,159,64,0.5)'
												],
												borderColor:[
													'black'
												],
												
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
					</div> --%><div class="col-12">
						<div class="card">


							<div class="card-body">
								

								<%
									List<ExpenseChartBean> expenseChartData = (List<ExpenseChartBean>) request.getAttribute("expenseChartDataUser");
									List<CategoryChartBean> categoryChartData = (List<CategoryChartBean>) request.getAttribute("categoryChartDataUser");	
								/* List<IncomeChartBean> incomeChartData = (List<IncomeChartBean>) request.getAttribute("incomeChartDataUser"); */ 
								%>
								<!-- Line Chart -->
								<div>
										<h5 class="card-title">Category-Expenses</h5>
										<div class="col-4">
											<canvas id="categorychartUser" class="chartjs-render-monitor"></canvas>
										</div>
										<br><br>
										<h5 class="card-title">Expense-Monthly</h5>
									<canvas id="expensechartUser"></canvas>
								</div>
								
								
					<script>

					 BGcolorArray= [
						    'rgba(75, 192, 192, 0.4)',
					        'rgba(153, 102, 255, 0.4)',
					        'rgba(255, 159, 64, 0.4)',
						    'rgba(255, 99, 132, 0.4)',
					        'rgba(54, 162, 235, 0.4)',
					        'rgba(255, 206, 86, 0.4)'
					            
					      ]
					 
					  bordderArray = [
						  'rgba(75, 192, 192, 1)',
					        'rgba(153, 102, 255, 1)',
					        'rgba(255, 159, 64, 1)',
						    'rgba(255, 99, 132, 1)',
					        'rgba(54, 162, 235, 1)',
					        'rgba(255, 206, 86, 1)'
					        ]
					 
						bgColor = [];
						borderColor = [];
						
						<% for(int i = 0; i<categoryChartData.size(); i++){%>
							bgColor.push(BGcolorArray[<%=i%>]);
						<%}%>
						
						<% for(int i=0; i<categoryChartData.size(); i++){ %>
							borderColor.push(bordderArray[<%=i%>]);
						<%}%>
						
					
						const ctx2 = document.getElementById('categorychartUser'); 
						
						new Chart(
								ctx2,
								{
									type : 'doughnut',
									data : {
										labels : [ 
											 <%for (CategoryChartBean e : categoryChartData) {%>
											 '<%=e.getCategoryName()%>',
												<%}%> ],
										datasets : [ {
											label : '# of Category Count',
											data : [
												 <%for (CategoryChartBean e : categoryChartData) {%>
														<%=e.getCategoryCount()%>,
												<%}%> 
												],
												 backgroundColor: bgColor,
											       borderColor: borderColor,
											       borderWidth: 1
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
								
								
								
								
						<%-- 	<script type="text/javascript">
							 
							 BGcolorArray= [
								    'rgba(75, 192, 192, 0.4)',
							        'rgba(153, 102, 255, 0.4)',
							        'rgba(255, 159, 64, 0.4)',
								    'rgba(255, 99, 132, 0.4)',
							        'rgba(54, 162, 235, 0.4)',
							        'rgba(255, 206, 86, 0.4)'
							            
							      ]
							 
							  bordderArray = [
								  'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)',
								    'rgba(255, 99, 132, 1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)'
							        ]
							 
								bgColor = [];
								borderColor = [];
								
								<% for(int i = 0; i<categoryData.size(); i++){%>
									bgColor.push(BGcolorArray[<%=i%>]);
								<%}%>
								
								<% for(int i=0; i<categoryChartData.size(); i++){ %>
									borderColor.push(bordderArray[<%=i%>]);
								<%}%>
 
							 const ctx2 = document.getElementById('categorychartUser');
							
							 new Chart(ctx2, {
							   type: 'doughnut',
							   data: {
							     labels: [<%for(CategoryChartBean cb : categoryChartData){%>
							       '<%=cb.getCategoryName()%>',
							     <%}%>
							     ],
							     datasets: [{
							       label: '# Category',
							       data: [ <%for(CategoryChartBean cb : categoryChartData){%>
							         <%=cb.getCategoryCount()%>,
							       <%}%> ],
							       backgroundColor: bgColor,
							       borderColor: borderColor,
							       borderWidth: 1
							     }]
							   },
							   options: {
							     cutout: '50%',
							     plugins: {
							       title: {
							         display: true,
							         text: 'Category wise chart'
							       },
							       legend: {
							         position: 'bottom'
							       }
							     }
							   }
							 });  
 
 						</script> --%>
								
								
								
								<%-- <div>
									<canvas id="pieChart" class="chartjs-render-monitor"></canvas>
								</div>
							<script type="text/javascript">
							 
							 BGcolorArray= [
								  'rgba(75, 192, 192, 0.4)',
							        'rgba(153, 102, 255, 0.4)',
							        'rgba(255, 159, 64, 0.4)',
								    'rgba(255, 99, 132, 0.4)',
							        'rgba(54, 162, 235, 0.4)',
							        'rgba(255, 206, 86, 0.4)'
							            
							      ]
							 
							  bordderArray = [
								  'rgba(75, 192, 192, 1)',
							        'rgba(153, 102, 255, 1)',
							        'rgba(255, 159, 64, 1)',
								    'rgba(255, 99, 132, 1)',
							        'rgba(54, 162, 235, 1)',
							        'rgba(255, 206, 86, 1)'
							        ]
							 
								bgColor = [];
								borderColor = [];
								
								<% for(int i = 0; i<pieStatus.size(); i++){%>
									bgColor.push(BGcolorArray[<%=i%>]);
								<%}%>
								
								<% for(int i=0; i<pieStatus.size(); i++){ %>
									borderColor.push(bordderArray[<%=i%>]);
								<%}%>
 
							 const ctx3 = document.getElementById('pieChart');
							
							 new Chart(ctx3, {
							   type: 'doughnut',
							   data: {
							     labels: [<%for(ChartExpenseBean db : pieStatus){%>
							       '<%=db.getStatus()%>',
							     <%}%>
							     ],
							     datasets: [{
							       label: '# Transaction Status',
							       data: [ <%for(ChartExpenseBean db : pieStatus){%>
							         <%=db.getTransaction()%>,
							       <%}%> ],
							       backgroundColor: bgColor,
							       borderColor: borderColor,
							       borderWidth: 1
							     }]
							   },
							   options: {
							     cutout: '50%',
							     plugins: {
							       title: {
							         display: true,
							         text: 'Donut Chart'
							       },
							       legend: {
							         position: 'bottom'
							       }
							     }
							   }
							 });  
 
 						</script>

 --%>
								
								

					<script>

					
						const ctx3 = document.getElementById('expensechartUser');
						new Chart(
								ctx3,
								{
									type : 'bar',
									data : {
										labels : [ 
											 <%for (ExpenseChartBean e : expenseChartData) {%>
											 '<%=e.getMonth()%>',
												<%}%> ],
										datasets : [ {
											label : '# of ExpenseAmount',
											data : [
												 <%for (ExpenseChartBean e : expenseChartData) {%>
														<%=e.getExpenseAmount()%>,
												<%}%> 
												],
												backgroundColor: [
													'rgba(255,159,64,0.5)'
												],
												borderColor:[
													'black'
												],
												
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
 
 
 
 
  
		<jsp:include page="AdminFooter.jsp"></jsp:include>
		<!--End Footer -->
    </div>
  <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;">
  		</div>
  	</div>
  	
  	  	</div>
  </main>
<!-- main content close -->         
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
   

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

</body>

</html>  