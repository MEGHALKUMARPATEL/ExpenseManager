<%@page import="java.util.List"%>
<%@page import="com.bean.StatusBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Manger | List Status</title>
</head>
<body>
	<h3>List Status</h3>
	
	<%
		List<StatusBean> list = (List<StatusBean>)request.getAttribute("list");
	%>
	
	<table border="1">

	<tr>
		<th>StatusId</th>
		<th>StatusName</th>
	</tr>

       <% for(StatusBean sb:list){ %>
	<tr>
		<td><%=sb.getStatusId() %></td>
		<td><%=sb.getStatusName() %></td>
	</tr>
	
	<%} %>
	
</table>
<br><br>

</body>
</html> --%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Expense Manager | ListStatus</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables  Expense Manager | ListStatus</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>

	<%
		List<StatusBean> list = (List<StatusBean>)request.getAttribute("list");
	%>

	<!-- ======= Header ======= -->
	<jsp:include page="HeaderNav.jsp"></jsp:include>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<jsp:include page="AdminSideBar.jsp"></jsp:include>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<a href="admindashboard"><h1>Status</h1></a>

			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="liststatus.jsp">List</a></li>
					<li class="breadcrumb-item active">Status</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->


		<section class="section">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Status</h5>


							<!-- Table with stripped rows -->
							<div
								class="datatable-wrapper datatable-loading no-footer sortable searchable fixed-columns">
								<div class="datatable-top">  
									<div class="datatable-dropdown"></div>
									<div class="datatable-search">
										<input class="datatable-input" placeholder="Search..."
											type="search" title="Search within table">
									</div>
								</div>
								<div class="datatable-container">
									<table class="table datatable datatable-table">
										<thead>
											<tr>
												<th data-sortable="true" style="width: 5.584826132771338%;"><a
													href="#" class="datatable-sorter">StatusId</a></th>
												<th data-so"#" class="datatable-sorter">StatusName</a></th>
												
											</tr>
										</thead>
										<tbody>
									  <% for(StatusBean sb:list){ %>
	<tr>
		<td><%=sb.getStatusId() %></td>
		<td><%=sb.getStatusName() %></td>
	</tr>
	
											
										</tbody>
										<%} %>
									</table>
									<a href="status"><i class="bi bi-plus-circle-fill fs-2" style="size: 250px"></i>Add New Status</a>
									
								</div>
								<div class="datatable-bottom">
									<div class="datatable-info">Showing 1 to 5 of 5 entries</div>
									<nav class="datatable-pagination">
										<ul class="datatable-pagination-list"></ul>
									</nav>
								</div>
							</div>
							<!-- End Table with stripped rows -->

						</div>
					</div>

				</div>
			</div>
		</section>

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