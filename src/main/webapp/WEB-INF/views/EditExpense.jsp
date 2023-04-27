<%@page import="com.bean.ExpenseBean"%>
<%@page import="com.bean.ExpenseBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Expense Manager | Edit Expense</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Sub Expense</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
				<li class="breadcrumb-item">Expense</li>
				<li class="breadcrumb-item active">Edit</li>
			</ol>
		</nav>
	</div>



	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Edit Expense</h5>

						<%
							
							ExpenseBean expense = (ExpenseBean) request.getAttribute("expenseBean");
						%>

						<form action="updateexpense" method="post">
							<input type="hidden" name="expenseId" value="<%=expense.getExpenseId() %>"/>
						
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">ExpenseName
								</label>
								<div class="col-sm-6">
									<input type="text" name="expenseName"
										value="<%=expense.getTitle()%>"
										class="form-control">
								</div>
							</div>

	<div class="col-2">
						<a href="addexpenseimg?expenseId=${expenseBean.expenseId }"><button type="button"
												class="btn btn-primary w-100">Add Photo for This Expense</button></a>
							</div>			

							<div class="row mb-3">
								<div class="col-2"></div>
								<div class="col-2">
									<button class="btn btn-primary w-100" type="submit">Update
									</button>

								</div>
								<div class="col-2">
									<a class="btn btn-danger w-100" href="listexpense"
										type="button">Cancel</a>

								</div>

							</div>



						</form>



						<!-- Table with stripped rows -->

						<br> <a href="listexpense"> <i
							class="bi bi-arrow-left"></i> BACK
						</a>

					</div>
				</div>

			</div>
		</div>
	</section>
	</main>

	
	<jsp:include page="AllJS.jsp"></jsp:include>
	<script>
		function validateExpense() {
			expenseId = document.getElementById("expenseId");
			isError = false;
			if (expenseId.value == "-1") {
				isError = true;
			}
		}
	</script>

</body>
</html>