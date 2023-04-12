<%@page import="com.bean.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Expense Manager | ListUsers</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / Expense Manager | ListUsers</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Users</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
				<li class="breadcrumb-item">Users</li>
				<li class="breadcrumb-item active">List</li>
			</ol>
		</nav>
	</div>


	<%
		List<UserBean> list = (List<UserBean>) request.getAttribute("list");
	%>

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">List Users</h5>


						<!-- Table with stripped rows -->
						 
							<div class="datatable-container">
								<table class="table datatable" id="listcategory">
									<thead>
										<tr>
											<th>FirstName</th>
											<th>LastName</th>
											<th>Email</th>
											<th>MobileNo</th>
											<th>Gender</th>
											<th>BirthDate</th>
											<th>Designation</th>
											<th>CreatedAt</th>
										</tr>
									</thead>
									<tbody>
										<%
											for (UserBean cb : list) {
										%>
										<tr>
											<td><%=cb.getFirstname()%></td>
											<td><%=cb.getLastname()%></td>
											<td><%=cb.getEmail()%></td>
											<td><%=cb.getMobileno()%></td>
											<td><%=cb.getGender()%></td>
											<td><%=cb.getDateofbirth()%></td>
											<td><%=cb.getDesignation()%></td>
											<td><%=cb.getCreatedAt()%></td>
											
											<%-- <td><a href="deletecategory/<%=cb.getUserid()%>">Delete</a>
												| <a href="../viewuser?userId=<%=cb.getUserid()%>">View</a></td> --%>
										</tr>

										<%
											}
										%>
									</tbody>
								</table>
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