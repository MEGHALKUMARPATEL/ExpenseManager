<%@page import="com.bean.IncomeBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Income Manager | ListIncome</title>
<meta content="" name="description">
<meta content="" name="keywords">



<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Tables / Income Manager | ListIncome</title>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta content="" name="description">
<meta content="" name="keywords">

</head>

<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Income</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="userdashboard">Dashboard </a></li>
				<li class="breadcrumb-item">List</li>
				<li class="breadcrumb-item active">Income</li>
			</ol>
		</nav>
	</div>


	<%
		List<IncomeBean> incomelist = (List<IncomeBean>) request.getAttribute("incomelist");
	%>

	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">List Income</h5>


						<!-- Table with stripped rows -->
						 
							<div class="datatable-container">
								<table class="table datatable" id="listincome">
									<thead>
										<tr>
											<th class="formheadcss">Title</th>
											<th class="formheadcss">Amount</th>
											<th class="formheadcss">Date</th>
											<th class="formheadcss">View Detail</th>
											
										</tr>
									</thead>
									<tbody>
										<%
										 for(IncomeBean eb : incomelist){
										%>
										<tr>
											<td class="formcss" align="center" ><%=eb.getTitle()%></td>
											<td class="formcss" align="center"><%=eb.getAmount()%></td>
											<td class="formcss" align="center"><%=eb.getDate()%></td>
										
											<td  align="center"><a class="btn btn-link text-gradient px-3 mb-0"
												href="viewincome?incomeId=<%=eb.getIncomeId()%>"><i class="bi bi-eye"></i> View</td>
												
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