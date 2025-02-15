<%
if(session.getAttribute("uId")==null || session.getAttribute("uName")==""){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<%
String bookId=request.getParameter("bookId");
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight View</title>
     <%@ include file="include/links.jsp" %>
    <style>
        body {
  background-color: #f5fff9;
  margin: 0;
 
  text-align: end;
}

.container {
  display: grid;
  margin-top:50px;
}

.ticket {
  border-radius: 50px;
  display: grid;
  grid-template-columns: 28% 42% 30%;
  height: 300px;
  margin: auto;
  width: 750px;
  border:1px solid grey !important;
}

img {
  width: 60px;
  margin-top: 20px;
}

a {
  text-decoration: none;
  color: #d3b779;
}

.item {
  color: #a3a4a4;
  font-family: "Average Sans", sans-serif;
  font-size: 14px;
  margin: 20px auto 0 auto;
  text-transform: uppercase;
}

.lgdetail {
  color: #616161;
  font-family: "Average Sans", sans-serif;
  font-size: 32px;
  text-transform: uppercase;
}

.smdetail {
  color: #616161;
  font-family: "Average Sans", sans-serif;
  font-size: 20px;
  text-transform: capitalize;
}

/* start ticket-left*/
.ticket-left {
  background-color: white;
  border-radius: 50px 0 0 50px;
  display: grid;
  grid-template-columns: 50% 50%;
  grid-template-rows: 1fr 1fr 1fr;
  padding-right: 10px;
}

.corner-seat-container {
  background: #f7f7f7;
  border-radius: 50px 0 50px 0;
  height: 100%;
  padding-right: 25px;
}

.airplane {
  font-size: 70px;
  line-height: 100px;
}

.departure-time {
  grid-column: 1 / span 2;
  grid-row: 2;
}

.departing {
  grid-column: 1 / span 2;
  grid-row: 3;
}
/*end ticket-left*/

/*start ticket-middle*/
.ticket-middle {
  background-color: #ffe9b7;
  border-right: 1.7px dotted black;
  clip-path: polygon(30% 0, 100% 0, 100% 100%, 0 100%);
  display: grid;
  grid-template-columns: 20% 35% 45%;
  grid-template-rows: 97px 100px 67px 28px;
  padding-bottom: 5px;
  padding-right: 30px;
}

.passenger-name {
  grid-column: 1 / span 3;
}

.gate {
  grid-column: 2;
}

.destination {
  grid-column: 1 / span 2;
}

.serial {
  background-color: #fff;
  font-family: "Cutive Mono";
  grid-column: 1 / span 3;
  line-height: 21px;
  margin-left: 30px;
  margin-top: 7px;
  text-align: center;
  text-transform: uppercase;
}
/*end ticket-middle*/

/*start ticket-right*/
.ticket-right {
  display: grid;
  grid-template-columns: 65% 35%;
  grid-template-rows: 45px 1fr 1fr 1fr 1fr 28px;
}

.smitem {
  color: #a3a4a4;
  font-family: "Average Sans", sans-serif;
  text-transform: uppercase;
}

.exsmdetail {
  color: #616161;
  font-family: "Average Sans", sans-serif;
  font-size: 17px;

}

.stub-flight {
  grid-row: 2;
  text-transform: uppercase;
}

.stub-seat {
  grid-row: 3;
  text-transform: uppercase;
}

.stub-depart {
  grid-row: 4;
}

.stub-passenger {
  grid-row: 5;
}



.jl-logo {
  box-shadow: 0px 0px 9px -2px rgba(0, 0, 0, 0.35);
  border-radius: 50%;
  position: fixed;
  bottom: 20px;
  right: 20px;
}
/*end ticket-right*/
 /* .footer {
            background: #333;
            color: white;
            padding: 20px 0;
        }
        .footer a {
            color: #ffcc00;
            text-decoration: none;
        } */
.spanId{
font-size: 12px;
}
button{
margin:30px;

}
</style>
  
</head>
<body>
<%@ include file="include/header.jsp" %>

   <div class="container">
    <div class="ticket">
      <div class="ticket-left">
        <div class="corner-seat-container">
          <div class="item">seat</div>
          <div class="lgdetail">25a</div>
        </div>
        <div class="airplane-container">
          <img src="https://assets.codepen.io/1026437/blackAirplane.png" alt="airplane-img" />
        </div>
        <div class="departure-time">
          <div class="item">departure time</div>
          <div class="lgdetail" ><span class="spanId" id="departure"></span></div>
        </div>
        <div class="departing">
          <div class="item">Source</div>
          <div class="smdetail" ><span class="spanId" id="source"></span></div>
        </div>
      </div>
      <div class="ticket-middle">
        <div class="passenger-name">
          <div class="item">passenger</div>
          <div class="smdetail" ><span class="spanId" id="uName"></span></div>
        </div>
        <div class="gate">
          <div class="item">gate</div>
          <div class="lgdetail">l22</div>
        </div>
        <div class="flight">
          <div class="item">flight Name</div>
          <div class="lgdetail" ><span class="spanId" id="fName"></span></div>
        </div>
        <div class="destination">
          <div class="item">destination</div>
          <div class="smdetail" ><span class="spanId" id="destination"></span></div>
        </div>
        <div class="flight">
          <div class="item">flight no</div>
          <div class="lgdetail" ><span class="spanId" id="fNo"></span></div>
        </div>
        
      </div>
      <div class="ticket-right">
        <div class="stub-flight">
          <div class="smitem">flight</div>
          <div class="exsmdetail" ><span class="spanId" id="fNo1"></span></div>
        </div>
        <div class="stub-seat">
          <div class="smitem">seat</div>
          <div class="exsmdetail">25a</div>
        </div>
        <div class="stub-depart">
          <div class="smitem">depart</div>
          <div class="exsmdetail" ><span class="spanId" id="departure1"></span></div>
        </div>
        <div class="stub-passenger">
          <div class="smitem">passenger</div>
          <div class="exsmdetail" ><span class="spanId" id="uName1"></span></div>
        </div>
        <div class="barcode">||||||||||||||||||||||||||||</div>
      </div>
    </div>
  </div>             
    
  
 
    <button class="btn btn-danger downticket">Download  Ticket</button>

<%@ include file="include/footer.jsp" %>
<%@ include file="include/scripts.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>

<script>
$(document).ready(function(){
		const bookId=<%= bookId %>;
		$.ajax({ 
			type :"Post",
			url:"BookingServlet",
			data:{"bookId":bookId,"event":"getScdlFlightBybookId"},
			dataType:"json",
			success:function(response){
				console.log(response);
				$("#uName").text(response.uName);
				$("#departure").text(response.departure);
				$("#source").text(response.source);
				$("#fName").text(response.fName);
				$('#destination').text(response.destination);
				$('#fNo').text(response.fNo);
				$('#fNo1').text(response.fNo);
				$("#departure1").text(response.departure);
				$("#uName1").text(response.uName);
			},error:function(jqXHR,textStatus,errorThrown){
				alert('Something wrong on server !');
			   }
		});
	});	
	</script>
<script type="text/javascript">
$('button').on('click', function () {
    // Get the ticket element
    const ticketElement = document.querySelector('.ticket');

    // PDF options
    const options = {
        margin: 0.1,
        filename: 'FlightTicket.pdf',
        image: { type: 'jpeg', quality: 0.98 },
        html2canvas: { scale: 2 },
        jsPDF: { unit: 'in', format: 'A4', orientation: 'portrait' }
    };

    // Generate the PDF
    html2pdf().from(ticketElement).set(options).save();
});

</script>
</body>
</html>