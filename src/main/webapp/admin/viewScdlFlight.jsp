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
<title>Admin|viewScheduled</title>
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
								<li class="breadcrumb-item active" aria-current="page">Scheduled</li>
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
                      <h5 class="mb-0">Scheduled Details</h5>
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
                          <th>FlightName</th>
                          <th>FlightNo</th>
                          <th>Date</th>
                          <th>Source</th>
                          <th>Departure</th>
                          <th>Destination</th>
                          <th>Arrival</th>
                          <th>Seats</th>
                          <th>Travel hour</th>
                          <th>Km</th>
                          <th>Price</th>
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
				   <h5 class="modal-title" id="exampleModalLabel">Edit ScdlFlight</h5>
				   <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				  <div class="modal-body">
				  	<form id="updateScdlFlight">
				  		 <div>
									<select name="fName" id="fId" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
									<!-- bind the flight name here -->
									</select>
								</div>
								<input type="date"  name="scdlDate" id="scdlDate"   class="form-control  form-control-lg mb-3" required> 
								<input type="hidden" name="event" value="updateFlightScdl">
									<input type="hidden" name="scdlId" id="scdlId">
								<div>
									<select name="source" id="sourceId" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
									<!-- bind the source data here -->
									</select>
								</div>
								<div>
									<select name="destination"  id="destId" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
									</select>
								</div>
								<input type="number" name="seatAvl" id="seatAvl" value=""  class="form-control  form-control-lg mb-3" required>
								<input type="number"  name="ticketPrice" id="ticketPrice" placeholder="Enter ticket Price"  class="form-control  form-control-lg mb-3" required>
								<input type="text"  name="travelTime" id="travelTime" placeholder="Enter Travel Time"  class="form-control  form-control-lg mb-3" required>
								<input type="number"  name="travelKm" id="travelKm" placeholder="Enter Travel Km"  class="form-control  form-control-lg mb-3" required>
						<div class="pb-3">
							<input type="radio" name="status" value="active">   Active &nbsp; &nbsp;
							<input type="radio" name="status"  value="inactive">&nbsp;  Inactive
						</div>
				        <input type="submit" value="Update ScdlFlight"  class="btn btn-info form-control  form-control-lg mb-3" >	
					</form>	
				  </div>	
					</div>
				</div>
			</div>
<!--  all Script start -->
  <%@include file="include/scripts.jsp" %>
  <!-- script end -->
   <script>
  document.addEventListener("DOMContentLoaded", function () {
	    const dateField = document.getElementById("scdlDate");
	    const today = new Date().toISOString().split("T")[0]; // Get today's date in yyyy-mm-dd format
	    dateField.setAttribute("min", today); // Set the min attribute to today's date
	});

  </script>
  <script>
$(document).ready(function() {
    // Handle source dropdown change
    $("#sourceId").on("change", function() {
        let selectedSource = $(this).val();
        // Enable all destination options
        $("#destId option").prop("disabled", false);
        // Disable the selected source in the destination dropdown
        if (selectedSource) {
            $("#destId option").each(function() {
                if ($(this).val() === selectedSource) {
                    $(this).prop("disabled", true);
                }
            });
        }
    });
    // Handle destination dropdown change
    $("#destId").on("change", function() {
        let selectedDestination = $(this).val();
        // Enable all source options
        $("#sourceId option").prop("disabled", false);
        // Disable the selected destination in the source dropdown
        if (selectedDestination) {
            $("#sourceId option").each(function() {
                if ($(this).val() === selectedDestination) {
                    $(this).prop("disabled", true);
                }
            });
        }
    });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url  : "../FlightServlet",
		type : "post",
		data :{"event":"viewFlight"},
		dataType:"json",
		success : function(response){
			//console.log(response);
			let s="  <option selected>-- Select Flight --</option>";
			const flightSeatsMap = {};
			for(var key in response){
                   if(response.hasOwnProperty(key)){
                	   var status=response[key].status;
                	  
						if(status=="active"){
						  s+="<option value='"+response[key].fId+"'>"+response[key].fName+"</option>";
						 /*  $("#seatAvl").val(response.totalSeats); */
							flightSeatsMap[response[key].fId] = response[key].totalSeats;
						}
                   }					
	    		}
					$("#fId").html(s);
					$("#fId").on("change", function() {
						const selectedFlightId = $(this).val();
						if (flightSeatsMap[selectedFlightId]) {
							$("#seatAvl").val(flightSeatsMap[selectedFlightId]);
						} else {
							$("#seatAvl").val(""); // Clear field if no flight is selected
						}
					});
    		 },
    		 error:function(){
    		 }
		})
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url  : "../StateServlet",
		type : "post",
		data :{"event":"viewState"},
		dataType:"json",
		success : function(response){
			//console.log(response);
			let s="  <option selected>-- Select Source --</option>";
			for(var key in response){
                   if(response.hasOwnProperty(key)){
						s+="<option value='"+response[key].sName+"'>"+response[key].sName+"</option>";
                   }					
	    		}
					$("#sourceId").html(s);
    		 },
    		 error:function(){
    		 }
		})
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url  : "../StateServlet",
		type : "post",
		data :{"event":"viewState"},
		dataType:"json",
		success : function(response){
			//console.log(response);
			let s="  <option selected>-- Select Destination --</option>";
			for(var key in response){
                   if(response.hasOwnProperty(key)){
						s+="<option value='"+response[key].sName+"'>"+response[key].sName+"</option>";
                   }					
	    		}
					$("#destId").html(s);
    		 },
    		 error:function(){
    		 }
		})
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url  : "../ScdlFlightServlet",
		type : "post",
		data :{"event":"viewScld"},
		dataType:"json",
		success : function(response){
			//console.log(response);
			let s="";
			for(var key in response){
                   if(response.hasOwnProperty(key)){
						var status=response[key].status;
						if(status=="active"){
							 s+="<tr>";
							   s+="<td>"+response[key].scdlId+"</td>";
		                	   s+="<td>"+response[key].fName+"</td>";
		                	   s+="<td>"+response[key].fNo+"</td>";
		                	   s+="<td>"+response[key].scdlDate+"</td>";
		                	   s+="<td>"+response[key].source+"</td>";
		                	   s+="<td>"+response[key].arrival+"</td>";
		                	   s+="<td>"+response[key].destination+"</td>";
		                	   s+="<td>"+response[key].departure+"</td>";
		                	   s+="<td>"+response[key].seatAvl+"</td>";
		                	   s+="<td>"+response[key].travelTime+"&nbsp;hrs</td>";
		                	   s+="<td>"+response[key].travelKm+"&nbsp;km</td>";
		                	   s+="<td><i class='bi bi-currency-rupee'></i>&nbsp;"+response[key].ticketPrice+"</td>"; 		                	   s+="<td>";
		                	   s+="<span class='badge bg-light-success text-success w-100'>"+response[key].status+"</span>";
		                	   s+="</td>";
		                	   s+="<td>";
		                	   s+="<div class='table-actions d-flex align-items-center gap-3 fs-6'>";
		                	   s+="<a  class='text-primary ScdlFlightEdit'  id='"+response[key].scdlId+"' data-bs-toggle='tooltip' data-bs-placement='bottom' title='Edit'><i class='bi bi-pencil-fill'></i></a>";
		                	   s+="<a  class='text-danger ScdlFlightDelete' id='"+response[key].scdlId+"' data-bs-toggle='tooltip' data-bs-placement='bottom' title='Delete'><i class='bi bi-trash-fill'></i></a>";
		                	   s+="</div>";
		                	   s+="</td>";
		                	   s+="</tr>";
						}else{
							 s+="<tr>";
							 s+="<td>"+response[key].scdlId+"</td>";
		                	   s+="<td>"+response[key].fName+"</td>";
		                	   s+="<td>"+response[key].fNo+"</td>";
		                	   s+="<td>"+response[key].scdlDate+"</td>";
		                	   s+="<td>"+response[key].source+"</td>";
		                	   s+="<td>"+response[key].arrival+"</td>";
		                	   s+="<td>"+response[key].destination+"</td>";
		                	   s+="<td>"+response[key].departure+"</td>";
		                	   s+="<td>"+response[key].seatAvl+"</td>";
		                	   s+="<td>"+response[key].travelTime+"&nbsp;hrs</td>";
		                	   s+="<td>"+response[key].travelKm+"&nbsp;km</td>";
		                	   s+="<td><i class='bi bi-currency-rupee'></i>&nbsp;"+response[key].ticketPrice+"</td>";
		                	   s+="<td>";
		                	   s+="<span class='badge bg-light-warning text-warning w-100'>"+response[key].status+"</span>";
		                	   s+="</td>";
		                	   s+="<td>";
		                	   s+="<div class='table-actions d-flex align-items-center gap-3 fs-6'>";
		                	   s+="<a class='text-primary ScdlFlightEdit' id='"+response[key].scdlId+"' data-bs-toggle='tooltip' data-bs-placement='bottom' title='Edit'><i class='bi bi-pencil-fill'></i></a>";
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
	$(document).on('click','.ScdlFlightDelete',function(){
		const scdlId=$(this).attr('id');
		if(confirm("Are you sure to deactivate this ?")){
			$.ajax({
		    url: "../ScdlFlightServlet",
		    type : "Post",
			data:{"scdlId":scdlId,"event":"deactiveScdlFlight"},
			success:function(response){
				if (response.trim() == "done") {
					window.location.href = 'viewScdlFlight.jsp'; 
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
	$(document).on('click','.ScdlFlightEdit',function(){
		const scdlId=$(this).attr('id');
		$('#editModal').modal('show');
		$.ajax({ 
			type : "Post",
			url:"../ScdlFlightServlet",
			data:{"scdlId":scdlId,"event":"getScdlFlightById"},
			dataType:"json",
			success:function(response){
				//console.log(response);
				$("#fId").val(response.fId);
				$("#scdlDate").val(response.scdlDate);
				$("#sourceId").val(response.source);
				$("#destId").val(response.destination);
				$('#seatAvl').val(response.seatAvl);
				$('#ticketPrice').val(response.ticketPrice);
				$("#travelKm").val(response.travelKm);
				$("#travelTime").val(response.travelTime
						);
				$('#scdlId').val(response.scdlId);
			},
			error:function(jqXHR,textStatus,errorThrown){
				alert('Something wrong on server !');
			   }
		});
	});	
	</script>
<script>
$(document).ready(function() {
	$("#updateScdlFlight").on("submit", function(event) {
		event.preventDefault();
		const formdata = $(this).serialize();
		$.ajax({
			url: "../ScdlFlightServlet",
			type : "post",
			data : formdata,
			success : function(response) {
				if (response.trim() == "done") {
					window.location.href = 'viewScdlFlight.jsp';
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