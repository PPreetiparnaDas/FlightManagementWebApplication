<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight View</title>
     <%@ include file="include/links.jsp" %>
     <style>
     .bg-info {
    background-color: #17a2b8;
    padding: 10px;
    border-radius: 5px;
    color: white;
    text-align: center;
}
     body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .search-form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .flight-card {
            background-color: #f4f4f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            padding: 20px;
        }

        .flight-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .flight-info {
            margin-top: 15px;
        }

        .btn-search {
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            width: 100%;
        }

        .btn-search:hover {
            background-color: #0056b3;
        }

        .btn-book-now {
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 1rem;
        }

        .btn-book-now:hover {
            background-color: #218838;
        }

        /* Media Queries for responsiveness */
        @media (max-width: 768px) {
            .flight-details {
                flex-direction: column;
                text-align: center;
            }
        }

        @media (max-width: 576px) {
            .search-form {
                padding: 20px;
            }
        }
        .flight-row {
            background-color: #f4f4f9; /* Traditional look */
            border: 1px solid #e0a96d;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 10px;
        }
        .flight-details,
        .price-duration,
        .departure-arrival,
        .book-now {
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .book-now button {
        background-color: #28a745;
            color: white;
            border-radius: 5px;
            padding: 10px 20px;
            
        }
       /*   .footer {
            background: #333;
            color: white;
            padding: 20px 0;
        }
        .footer a {
            color: #ffcc00;
            text-decoration: none;
        } */
    </style>
</head>
<body>
 <%@ include file="include/header.jsp" %>
    <div class="container my-4">
    <div class="row justify-content-center mb-5">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <div class="search-form">
                    <h3 class="text-center mb-4">Search Flights</h3>
                    <form id="searchFlight">
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="source" class="form-label">Source</label>
                               <select name="source" id="sourceId" class="form-select form-select-sm mb-4" aria-label=".form-select-lg example">
									<!-- bind the source data here -->
								</select>
								<input type="hidden"  name="event"  value="searchFlight"> 
                            </div>
                            <div class="col-md-4">
                                <label for="destination" class="form-label">Destination</label>
                               <select name="destination"  id="destId" class="form-select form-select-sm mb-4" aria-label=".form-select-lg example">
									</select>
                            </div>
                            <div class="col-md-4">
                                <label for="date" class="form-label">Date</label>
								<input type="date"  name="scdlDate" id="scdlDate"   class="form-control  form-control-sm mb-4" required> 
                            </div>
                        </div>
                        <button type="submit" class="btn btn-search">Search Flight</button>
                    </form>
                </div>
            </div>
        </div>
    
        <h2 class="text-center mb-4">Available Flights</h2>
        <hr>
		
		   <div id="alertMessage" class="" >
		   		
		   </div>
        <!-- Flight Row -->
       <div id="viewFlight">
       		
       </div>
        
    </div>
     <%@ include file="include/footer.jsp" %>
      <%@ include file="include/scripts.jsp" %>
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
		url  : "StateServlet",
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
		url  : "StateServlet",
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
		url  : "ScdlFlightServlet",
		type : "post",
		data :{"event":"viewScldCust"},
		dataType:"json",
		success : function(response){
			//console.log(response);
			let s="";
			
			for(var key in response){
                   if(response.hasOwnProperty(key)){
						var status=response[key].status;
						if(status=="active"){
							 s+=" <div class='row flight-row'> <div class='col-3 flight-details'><div>";
							 s+=" <strong> Flight Name :"+response[key].fName+"</strong><br>";
							 s+="<strong>Source:</strong> "+response[key].source+"<br>";
							 s+="<strong>Destination:</strong>"+ response[key].destination;
							 s+="</div></div><div class='col-3 price-duration'> <div>";
							 s+="<strong>Price:</strong>"+response[key].ticketPrice+"<br>";
							 s+="<strong>Duration:</strong>:"+response[key].travelTime;
							 s+="</div> </div><div class='col-3 departure-arrival'><div>";
							 s+="<strong>Departure:</strong>"+response[key].departure+"<br>";
							 s+="<strong>Arrival:</strong> "+response[key].arrival;
							 s+="</div></div><div class='col-3 book-now'>";
							 s+="<a href='bookDetails.jsp?scdlId="+response[key].scdlId+"' class='btn btn-primary' >Book Now</a> </div></div>";
						}
                   }					
	    		}
					$("#viewFlight").html(s);
			  
    		 },
    		 error:function(){
    		 }
		})
});
</script>
<script>
$(document).ready(function() {
	$("#searchFlight").on("submit", function(event) {
		event.preventDefault();
		const formdata = $(this).serialize();
		$.ajax({
			url: "ScdlFlightServlet",
			type : "post",
			data : formdata,
			dataType:"json",
			success : function(response) {
				console.log(response);
				//alert (response);
				let s="";
				
				for(var key in response){
	                   if(response.hasOwnProperty(key)){
							var status=response[key].status;
							if(status=="active"){
								 s+=" <div class='row flight-row'> <div class='col-3 flight-details'><div>";
								 s+=" <strong> Flight Name :"+response[key].fName+"</strong><br>";
								 s+="<strong>Source:</strong> "+response[key].source+"<br>";
								 s+="<strong>Destination:</strong>"+ response[key].destination;
								 s+="</div></div><div class='col-3 price-duration'> <div>";
								 s+="<strong>Price:</strong>"+response[key].ticketPrice+"<br>";
								 s+="<strong>Duration:</strong>:"+response[key].travelTime;
								 s+="</div> </div><div class='col-3 departure-arrival'><div>";
								 s+="<strong>Departure:</strong>"+response[key].departure+"<br>";
								 s+="<strong>Arrival:</strong> "+response[key].arrival;
								 s+="</div></div><div class='col-3 book-now'>";
								 s+="<a href='bookDetails.jsp?scdlId="+response[key].scdlId+"' class='btn btn-primary' >Book Now</a> </div></div>";
							} 
	                   }					
		    		}
						$("#viewFlight").html(s);
				
	    		 },
			error : function() {
			}
		});
	});
});
</script>
</body>
</html>
