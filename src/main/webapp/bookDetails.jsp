<%
if(session.getAttribute("uId")==null || session.getAttribute("uName")==""){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<%
String scdlId=request.getParameter("scdlId");
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Now - Flight Booking</title>
    <%@ include file="include/links.jsp" %>
    <style>
        body {
            background-color: #f8f9fa;
            padding-bottom: 80px; /* Add some space at the bottom for the T&C row */
        }

        .card {
            margin: 20px auto;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .flight-preview {
            background: #f1f1f1;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .footer {
            background: #333;
            color: white;
            padding: 20px 0;
        }
        .footer a {
            color: #ffcc00;
            text-decoration: none;
        }

        .section-heading {
            font-size: 1.25rem;
            font-weight: 600;
        }

        .form-control:disabled {
            background-color: #e9ecef;
        }

        .flight-details-section {
            margin-top: 30px;
        }

        .price-highlight {
            font-size: 1.5rem;
            font-weight: bold;
            color: #28a745;
        }

        .important-info {
            background-color: #e9ecef;
            padding: 15px;
            border-radius: 5px;
            margin-top: 15px;
        }

        .important-info p {
            margin: 0;
        }

        .seat-category-option {
            display: flex;
            align-items: center;
        }

        .seat-category-option label {
            margin-right: 15px;
        }

        .terms-and-conditions {
            font-size: 0.9rem;
            color: #ffffff;
        }

        .terms-and-conditions a {
            color: #f1f1f1;
            text-decoration: underline;
        }

        /* Ensure the card header text is aligned left */
        .card-header {
            text-align: left;
        }

        /* Apply bg-info to the Booking Details */
        .booking-details-section {
            background-color:#e9ecef;
            color: white;
        }

        /* Payment Section Styles */
        .payment-details-section {
            background-color: #e9ecef;
            padding: 20px;
            border-radius: 5px;
        }

        .payment-details-section .form-control {
            margin-bottom: 15px;
        }

        /* Light background for Flight Details */
        .flight-details-section {
            background-color: #f1f1f1;
        }

        /* Dark background for Booking Details */
        .booking-details-section {
            background-color: #e9ecef;;
            color: white;
        }
    </style>
    
</head>

<body>
 <%@ include file="include/header.jsp" %>
     <div class="container">
        <!-- Flight Details Preview Section (Top of the page) -->
        <div class="row">
            <div class="col-12 flight-details-section">
                <div class="card">
                    <div class="card-header bg-info text-white">
                        <h3>Flight Booking - Flight Details</h3>
                    </div>
                    <div class="card-body flight-preview">
                        <div class="row" id="fpreview">
                           
                        </div>
                 <form action="BookingServlet" method="post"> 
                        <!-- Important Information Row -->
                        <div class="row important-info">
                            <div class="col-md-6">
                                <p ><strong>Price:</strong><b class="price-highlight">&#8377;</b><span class="price-highlight" id="ticketPrice"></span></p>
                              	<input type="hidden" id="unitprice" name="unitPrice">
                            </div>
                            <div class="col-md-6" id="fpreiview2">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Booking Form Section (Bottom of Flight Details) -->
        <div class="row">
            <div class="col-12 booking-details-section">
                <div class="card">
                    <div class="card-header text-dark">
                        <h3>Booking Details</h3>
                    </div>
                    <div class="card-body">
                        
                            <div class="row mb-3">
                                <div class="col-md-12">
                                    <label for="adults" class="form-label">Adults</label>
                                    <input type="number" class="form-control" id="adults" name="adults" min="1" max="5" value="1">
                                    <p class="text-danger"><strong >For Child Free *</strong></p>
                                	<input type="hidden" name="scldId" id="scldId" value="">
                                	<input type="hidden" name="fId" id="fId" value="">
                                	<input type="hidden" name="event" value="BookFlight">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label class="form-label">Seat Category</label>
                                    <div class="seat-category-option">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="seatCategory" id="economy" value="Economy" checked>
                                            <label class="form-check-label" for="economy">Economy</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="seatCategory" id="business" value="Business">
                                            <label class="form-check-label" for="business">Business</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="seatCategory" id="firstClass" value="First Class">
                                            <label class="form-check-label" for="firstClass">First Class</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Payment Details Section -->
        <div class="row">
            <div class="col-12">
                <div class="card payment-details-section">
                    <div class="card-header">
                        <h3>Payment Details</h3>
                    </div>
                    <div class="card-body">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="cardNumber" class="form-label">Card Number</label>
                                    <input type="text" class="form-control" name="cardNumber" placeholder="Enter Card Number" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="expiryDate" class="form-label">Expiry Date</label>
                                    <input type="month" class="form-control" name="expiryDate" required>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="cardHolderName" class="form-label">Cardholder Name</label>
                                    <input type="text" class="form-control" name="cardHolderName" placeholder="Cardholder Name" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="cvv" class="form-label">CVV</label>
                                    <input type="text" class="form-control" name="cvv" placeholder="CVV" required>
                                </div>
                            </div>

                           

                            <div class="text-center">
                                <input type="submit" class="btn btn-success" value="Pay Now">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
     <%@ include file="include/footer.jsp" %>
      <%@ include file="include/scripts.jsp" %>
       <script>
	  	$(document).ready(function(){  		  		
	  		$("#adults").change(function () {
	  			
	  			const price=$('#unitprice').val();  			
	  			$('#ticketPrice').html(($(this).val()*price)); 
	  		});
	  	});
	  </script>
<script>
$(document).ready(function(){
		const scdlId=<%= scdlId %>;
		$.ajax({ 
			type : "Post",
			url:"ScdlFlightServlet",
			data:{"scdlId":scdlId,"event":"getScdlFlightById"},
			dataType:"json",
			success:function(response){
				console.log(response.scdlId);
				let s="";
				let p="";
				if(response){
					s+="<div class='col-md-6' ><p ><strong>Flight Name:</strong>"+response.fName+"</p>";
					s+="<p ><strong>Flight Number:</strong>"+response.fNo+"</p>";
					s+="<p ><strong>Seats Available:</strong>"+response.seatAvl+" </p> ";
					s+="</div><div class='col-md-6'>";
					s+="<p ><strong>Source:</strong>"+response.source+"</p>";
					s+="<p ><strong>Destination:</strong>"+response.destination+" </p><p ><strong>Total Km:</strong>"+response.travelKm+" </p>  </div>";
				    p+="<p ><strong>Departure Time:</strong>"+response.departure+"</p>";
				    p+="<p ><strong>Arrival Time:</strong>"+response.arrival+" </p> <p><strong>Baggage Allowance:</strong> 30 kg</p>";
				    $("#ticketPrice").text(response.ticketPrice);
				    
				}
				$("#unitprice").val(response.ticketPrice);
				$("#scldId").val(response.scdlId);
				$("#fId").val(response.fId);
				$("#fpreview").html(s);
				$("#fpreiview2").html(p);
			},
			error:function(jqXHR,textStatus,errorThrown){
				alert('Something wrong on server !');
			   }
		});
	});	
	</script>

</body>

</html>
