<%@page import="com.bean.VendorBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expense Manager | List Vendor</title>
</head>
<body>
	<h3>List Vendor</h3>
	
	<%
		List<VendorBean> list = (List<VendorBean>)request.getAttribute("list");
	%>


<table border="1">

	<tr>
		<th>VendorId</th>
		<th>VendorName</th>
		<th>Deleted</th>
		<th>Action</th>
	</tr>

<% for(VendorBean vb:list){ %>
	<tr>
		<td><%=vb.getVendorId() %></td>
		<td><%=vb.getVendorName() %></td>
		<td><%=vb.getDeleted() %></td>
		<td><a href="deletevendor/<%=vb.getVendorId() %>">Delete</a></td>
	</tr>
	
	<%} %>
	
</table>
<br><br>
<a href="subcategories">Sub Category</a> 

</body>
</html> --%>


<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Expense Manager | ListVendor</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / Expense Manager | ListVendor</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Category</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
				<li class="breadcrumb-item">Vendor</li>
				<li class="breadcrumb-item active">List</li>
			</ol>
		</nav>
	</div>


	<%
		List<VendorBean> list = (List<VendorBean>) request.getAttribute("list");
	%>

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">List Vendor</h5>


						<!-- Table with stripped rows -->
						 
							<div class="datatable-container">
								<table class="table datatable" id="listvendor">
									<thead>
										<tr>
											<th>VendorId</th>
											<th>VendorName</th>
											<th>Deleted?</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (VendorBean cb : list) {
										%>
										<tr>
											<td><%=cb.getVendorId()%></td>
											<td><%=cb.getVendorName()%></td>
											<td><%=cb.getDeleted()%></td>
											<td><a href="deletevendor/<%=cb.getVendorId()%>">Delete</a>
												|</td>
										</tr>

										<%
											}
										%>
									</tbody>
								</table>
								<a href="vendor"><i class="bi bi-plus-circle-fill fs-2" style="size: 250px"></i>Add New Vendor</a>
							</div>
						 

					</div>
				</div>

			</div>
		</div>
	</section>
	</main>

<jsp:include page="AllJS.jsp"></jsp:include>
</body>

</html>