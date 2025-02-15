<%
if(session.getAttribute("uId")==null || session.getAttribute("uName")==""){
	response.sendRedirect("../login.jsp");
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html  class="semi-dark">
<head>
<meta charset="UTF-8">
	<!-- link start -->
 	 <%@ include file="include/links.jsp" %>
 	<!-- link end -->
<title>Admin|addFlight</title>
</head>
<body>
<div class="wrapper">
	   <!--start top header-->
        <%@ include file="include/header.jsp" %>
       <!--end top header-->

        <!--start sidebar -->
        <%@ include file="include/sidebar.jsp" %>
        <!--end sidebar -->
        
        <!-- main start -->
        <!--start content-->
       <main class="page-content">
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3">Add Flight</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Form Flight</li>
							</ol>
						</nav>
					</div>
					<div class="ms-auto">
						<div class="btn-group">
							<button type="button" class="btn btn-primary">Settings</button>
							<button type="button" class="btn btn-primary split-bg-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown">	<span class="visually-hidden">Toggle Dropdown</span>
							</button>
							<div class="dropdown-menu dropdown-menu-right dropdown-menu-lg-end">	<a class="dropdown-item" href="javascript:;">Action</a>
								<a class="dropdown-item" href="javascript:;">Another action</a>
								<a class="dropdown-item" href="javascript:;">Something else here</a>
								<div class="dropdown-divider"></div>	<a class="dropdown-item" href="javascript:;">Separated link</a>
							</div>
						</div>
					</div>
				</div>
				<!--end breadcrumb-->
        		<div class="row">
					<div class="col-xl-9 mx-auto">
						<h6 class="mb-0 text-uppercase">Text Inputs</h6>
						<hr/>
						
						 <div class="card">
							<div class="card-body">
							<form id="saveForm">
								<input type="text"  name="fName" id="name" placeholder="Enter Flight Name"   class="form-control  form-control-lg mb-3" required> 
								
								<input type="hidden" name="event" value="addFlight">
								
								<input type="text"  name="fNo" id="fNo" placeholder="Enter Flight Number"   class="form-control  form-control-lg mb-3" required>
								
								
								<input type="number" name="totalSeats" id="seats" placeholder="Enter Total Seat"  class="form-control  form-control-lg mb-3" required>
								
								
								<input type="submit" value="Add Flight" class="form-control form-control-lg mb-3 btn btn-info" >
							</form>
							</div>
						</div>
					  
					</div>
				</div>
        </main>
        
        <!-- main end -->
        
         <!--start design -->
        <%@ include file="include/design.jsp" %>
        <!--end design -->

</div>
<!--  all Script start -->
  <%@include file="include/scripts.jsp" %>
  <!-- script end -->
<script>
$(document).ready(function() {
	$("#saveForm").on("submit", function(event) {
		event.preventDefault();
		const formdata = $(this).serialize();
		$.ajax({
			url : "../FlightServlet",
			type : "post",
			data : formdata,
			success : function(response) {
				if (response.trim() == "done") {
					 $('#saveForm')[0].reset();
					 $.toast({
						    text: "Flight Added Successfully",
						    heading: 'Success', 
						    icon: 'success', 
						    showHideTransition: 'plain',
						    allowToastClose: true, 
						    hideAfter: 5000, 
						    stack: 5, 
						    position: 'top-center', 
						    textAlign: 'left',
						    loader: true,  
						});
				 
				} else {
					$('#saveForm')[0].reset();
					 $.toast({
						    text: "Something went to wrong on server!",
						    heading: 'error', 
						    icon: 'error', 
						    showHideTransition: 'plain',
						    allowToastClose: true, 
						    hideAfter: 5000, 
						    stack: 5, 
						    position: 'top-center', 
						    textAlign: 'left',
						    loader: true,  
						});
					
				}
			},
			error : function() {
			}
		})
	});
});
</script>
</body>
</html>