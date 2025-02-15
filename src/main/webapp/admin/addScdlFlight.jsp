<%
if(session.getAttribute("uId")==null || session.getAttribute("uName")==""){
	response.sendRedirect("../login.jsp");
}
%>
<!DOCTYPE html>
<html  class="semi-dark">
<head>
<meta charset="UTF-8">
	<!-- link start -->
 	 <%@ include file="include/links.jsp" %>
 	<!-- link end -->
<title>Flight Scheduled</title>
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
					<div class="breadcrumb-title pe-3">Add Scheduled</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">Scheduled Form</li>
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
						<h6 class="mb-0 text-uppercase">Scheduled Inputs</h6>
						<hr/>
						
						 <div class="card">
							<div class="card-body">
							<form id="saveForm">
							    <div>
									<select name="fName" id="fId" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
									<!-- bind the flight name here -->
									</select>
								</div>
								<input type="date"  name="scdlDate" id="scdlDate"   class="form-control  form-control-lg mb-3" required> 
								
								<input type="hidden" name="event" value="addSchedule">
								
								<div>
									<select name="source" id="sourceId" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
									<!-- bind the source data here -->
									</select>
								</div>
								<div>
									<select name="destination"  id="destId" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
									</select>
								</div>
								
								<input type="number" name="seatAvl" id="seatAvl" value=""  class="form-control  form-control-lg mb-3" readonly>
								
								<input type="number"  name="ticketPrice" id="ticketPrice" placeholder="Enter ticket Price"  class="form-control  form-control-lg mb-3" required>
								
								<div>
								    <label for="departure" class="form-label">Departure</label>
								    <input type="datetime-local" name="departure" id="departure" placeholder="Enter Departure time" class="form-control form-control-lg mb-3" required>
								</div>
								
								<div>
								    <label for="arrival" class="form-label">Arrival</label>
								    <input type="datetime-local" name="arrival" id="arrival" placeholder="Enter arrival time" class="form-control form-control-lg mb-3" required>
								</div>
								
								
								<input type="number"  name="travelKm" id="travelKm" placeholder="Enter Travel Km"  class="form-control  form-control-lg mb-3" required>
								
								<input type="submit" value="Add Schedule" class="form-control form-control-lg mb-3 btn btn-info" >
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

<script>
$(document).ready(function() {
	$("#saveForm").on("submit", function(event) {
		event.preventDefault();
		const formdata = $(this).serialize();
		console.log("Seat Available:", $("#seatAvl").val());
		$.ajax({
			url : "../ScdlFlightServlet",
			type : "post",
			data : formdata,
			success : function(response) {
				if (response.trim() == "done") {
					 $('#saveForm')[0].reset();
					 $.toast({
						    text: "Flight Scheduled  Successfully !",
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
						    text: "Failed to scheduled!",
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
		})
	});
});
</script>
</body>
</html>