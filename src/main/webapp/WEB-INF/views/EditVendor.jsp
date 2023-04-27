<%@page import="com.bean.VendorBean"%>
<%@page import="com.bean.VendorBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Expense Manager | Edit Vendor</title>
<jsp:include page="AllCss.jsp"></jsp:include>
</head>
<body>

	<jsp:include page="AdminHeader.jsp"></jsp:include>
	<jsp:include page="AdminSideBar.jsp"></jsp:include>


	<main id="main" class="main">
	<div class="pagetitle">
		<h1>Sub Vendor</h1>
		<nav>
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="admindashboard">Home</a></li>
				<li class="breadcrumb-item">Vendor</li>
				<li class="breadcrumb-item active">Edit</li>
			</ol>
		</nav>
	</div>



	<section class="section">
		<div class="row">
			<div class="col-lg-12">

				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Edit Vendor</h5>

						<%
							
							VendorBean vendor = (VendorBean) request.getAttribute("vendorBean");
						%>

						<form action="updatevendor" method="post">
							<input type="hidden" name="vendorId" value="<%=vendor.getVendorId() %>"/>
						
							<div class="row mb-3">
								<label for="inputText" class="col-sm-2 col-form-label">VendorName
								</label>
								<div class="col-sm-6">
									<input type="text" name="vendorName"
										value="<%=vendor.getVendorName()%>"
										class="form-control">
								</div>
							</div>

							

							<div class="row mb-3">
								<div class="col-2"></div>
								<div class="col-2">
									<button class="btn btn-primary w-100" type="submit">Update
									</button>

								</div>
								<div class="col-2">
									<a class="btn btn-danger w-100" href="listvendor"
										type="button">Cancel</a>

								</div>

							</div>



						</form>



						<!-- Table with stripped rows -->

						<br> <a href="listvendor"> <i
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
		function validateVendor() {
			vendorId = document.getElementById("vendorId");
			isError = false;
			if (vendorId.value == "-1") {
				isError = true;
			}
		}
	</script>

</body>
</html>