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
<title>View Flight</title>
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
					<div class="breadcrumb-title pe-3">Forms</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Form Of Admin</li>
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
        		 <div class="card">
                 <div class="card-body">
                   <div class="d-flex align-items-center">
                      <h5 class="mb-0">Flight Details</h5>
                       <form class="ms-auto position-relative">
                         <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-search"></i></div>
                         <input class="form-control ps-5" type="text" placeholder="search">
                       </form>
                   </div>
                   <div class="table-responsive mt-3">
                     <table class="table align-middle">
                       <thead class="table-secondary">
                         <tr>
                          <th>#</th>
                          <th>Name</th>
                          <th>Flight No</th>
                          <th>Total seats</th>
                          <th>Redg Date</th>
                          <th>Status</th>
                          <th>Action</th>
                         </tr>
                       </thead>
                       <tbody id="viewAdd">
                       
                       </tbody>
                     </table>
                   </div>
                 </div>
               </div>
        </main>
        
    
         <!--start design -->
        <%@ include file="include/design.jsp" %>
        <!--end design -->

</div>
<!-- Modal -->
		<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
				<div class="modal-content">
				<div class="modal-header">
				   <h5 class="modal-title" id="exampleModalLabel">Edit Flight</h5>
				   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				  <div class="modal-body">
				  	<form id="updateFlight">
				  		<input type="text"  name="fName" id="fName"    class="form-control  form-control-lg mb-3" required> 
						<input type="hidden" name="fId" id="fId">
						<input type="hidden" name="event" value="updateFlight">
						
						<input type="text"  name="fNo" id="fNo"    class="form-control  form-control-lg mb-3" required>
						<input type="number"  name="totalSeats" id="totalSeats"   class="form-control  form-control-lg mb-3" required>
						<input type="text" name="fredgdate" id="fredgdate"  class="form-control  form-control-lg mb-3" required>
						<div class="pb-3">
							<input type="radio" name="status" value="active">   Active &nbsp; &nbsp;
							<input type="radio" name="status"  value="inactive">&nbsp;  Inactive
						</div>
				        <input type="submit" value="Update Flight"  class="btn btn-info form-control  form-control-lg mb-3" >	
					</form>	
				  </div>	
					</div>
				</div>
			</div>
<!--  all Script start -->
  <%@include file="include/scripts.jsp" %>
  <!-- script end -->
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url  : "../FlightServlet",
		type : "post",
		data :{"event":"viewFlight"},
		dataType:"json",
		success : function(response){
			//console.log(response);
			let s="";
			for(var key in response){
                   if(response.hasOwnProperty(key)){
						var status=response[key].status;
						if(status=="active"){
							 s+="<tr>";
		                	   s+="<td>"+response[key].fId+"</td>";
		                	   s+="<td>"+response[key].fName+"</td>";
		                	   s+="<td>"+response[key].fNo+"</td>";
		                	   s+="<td>"+response[key].totalSeats+"</td>";
		                	   s+="<td>"+response[key].fredgdate+"</td>";
		                	   s+="<td>";
		                	   s+="<span class='badge bg-light-success text-success w-100'>"+response[key].status+"</span>";
		                	   s+="</td>";
		                	   s+="<td>";
		                	   s+="<div class='table-actions d-flex align-items-center gap-3 fs-6'>";
		                	   s+="<a  class='text-primary FlightEdit'  id='"+response[key].fId+"' data-bs-toggle='tooltip' data-bs-placement='bottom' title='Edit'><i class='bi bi-pencil-fill'></i></a>";
		                	   s+="<a  class='text-danger FlightDelete' id='"+response[key].fId+"' data-bs-toggle='tooltip' data-bs-placement='bottom' title='Delete'><i class='bi bi-trash-fill'></i></a>";
		                	   s+="</div>";
		                	   s+="</td>";
		                	   s+="</tr>";
						}else{
							   s+="<tr>";
							   s+="<td>"+response[key].fId+"</td>";
		                	   s+="<td>"+response[key].fName+"</td>";
		                	   s+="<td>"+response[key].fNo+"</td>";
		                	   s+="<td>"+response[key].totalSeats+"</td>";
		                	   s+="<td>"+response[key].fredgdate+"</td>";
		                	   s+="<td>";
		                	   s+="<span class='badge bg-light-warning text-warning w-100'>"+response[key].status+"</span>";
		                	   s+="</td>";
		                	   s+="<td>";
		                	   s+="<div class='table-actions d-flex align-items-center gap-3 fs-6'>";
		                	   s+="<a class='text-primary FlightEdit' id='"+response[key].fId+"' data-bs-toggle='tooltip' data-bs-placement='bottom' title='Edit'><i class='bi bi-pencil-fill'></i></a>";
		                	   s+="<a class='text-secondary'   dissable data-bs-toggle='tooltip' data-bs-placement='bottom' title='Delete'><i class='bi bi-trash-fill'></i></a>";
		                	   s+="</div>";
		                	   s+="</td>";
		                	   s+="</tr>";
						}
                   }					
	    		}
					$("#viewAdd").html(s);
    		 },
    		 error:function(){
    		 }
		})
});
</script>
<script>
	$(document).on('click','.FlightDelete',function(){
		const fId=$(this).attr('id');
		if(confirm("Are you sure to deactivate this ?")){
			$.ajax({
		    url: "../FlightServlet",
		    type : "Post",
			data:{"fId":fId,"event":"deactiveFlight"},
			success:function(response){
				if (response.trim() == "done") {
					window.location.href = 'viewAdmin.jsp'; 
		         }else{
			      alert("Delete Failed");
		         }
			 },
			error:function(jqXHR,textStatus,errorThrown){
				alert('Something wrong on server !');
			   }
	 		});
	     } 
	});
	</script>
<script>
	$(document).on('click','.FlightEdit',function(){
		const fId=$(this).attr('id');
		$('#editModal').modal('show');
		$.ajax({ 
			type : "Post",
			url:"../FlightServlet",
			data:{"fId":fId,"event":"getFlightById"},
			dataType:"json",
			success:function(response){
				console.log(response);
				$("#fName").val(response.fName);
				$("#fNo").val(response.fNo);
				$("#totalSeats").val(response.totalSeats);
				$("#fredgdate").val(response.fredgdate);
				$('#fId').val(response.fId);
			},
			error:function(jqXHR,textStatus,errorThrown){
				alert('Something wrong on server !');
			   }
		});
	});	
	</script>
<script>
$(document).ready(function() {
	$("#updateFlight").on("submit", function(event) {
		event.preventDefault();
		const formdata = $(this).serialize();
		$.ajax({
			url: "../FlightServlet",
			type : "post",
			data : formdata,
			success : function(response) {
				if (response.trim() == "done") {
					window.location.href = 'viewFlight.jsp';
				} else {
					alert("failed");
				}
			},
			error : function() {
			}
		});
	});
});
</script>
</body>
</html>