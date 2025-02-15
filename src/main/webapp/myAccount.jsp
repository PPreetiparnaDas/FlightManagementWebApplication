<%
if(session.getAttribute("uId")==null || session.getAttribute("uName")==""){
	response.sendRedirect("login.jsp");
}
%>
<%
int uId=(int)session.getAttribute("uId");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <%@ include file="include/links.jsp" %>
</head>
<body>
	<%@ include file="include/header.jsp" %>
	   <div class="container-fluid mt-2 p-5">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3">
                <div class="card" >
                    <img src="images/44.png" class="card-img-top" alt=".." height="220px">
                    <div class="card-body">
                        <div class="card">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item btn btn-info">
                                    <a class="nav-link active" href="#order" data-bs-toggle="tab" style="text-decoration: none;">My Account</a>
                                </li>
                                <li class="list-group-item btn btn-info">
                                    <a class="nav-link " href="#history" data-bs-toggle="tab" style="text-decoration: none;">Change Password</a>
                                </li>
                                <li class="list-group-item btn btn-info">
                                    <a class="nav-link " href="#update" data-bs-toggle="tab" style="text-decoration: none;">History</a>
                                </li>
                                <li class="list-group-item btn btn-info">
                                    <a class="nav-link " href="#closeAccount" data-bs-toggle="tab" style="text-decoration: none;">Close Account</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Main Content -->
            <div class="col-md-9">
                <div class="tab-content">
                    <div id="order" class="tab-pane fade show active">
                        <div class="card">
                        <div class=" d-flex justify-content-center">
                          <h4 >Update Account</h4>
                        </div>
                            <div class="card-body">
                                <form id="myAccountId">
								  <div class="mb-3">
								  <div class="mb-3">
								    <label for="uName" class="form-label">Name</label>
								    <input type="text" class="form-control" id="uName" name="uName" required aria-describedby="emailHelp">
								    <input type="hidden" name="uId" id="uId">
								    <input type="hidden" name="event" value="updateCustomer">
								    <input type="hidden" name="status" value="active">
								  </div>
								    <label for="uEmail" class="form-label">Email address</label>
								    <input type="email" class="form-control" id="uEmail" name="uEmail" required aria-describedby="emailHelp">
								  </div>
								   <div class="mb-3">
								    <label for="uPhone" class="form-label">Phone </label>
								    <input type="text" class="form-control" id="uPhone" name="uPhone" required aria-describedby="emailHelp">
								  </div>
								   <div class="mb-3">
								    <label for="uPass" class="form-label">Password </label>
								    <input type="password" class="form-control" id="uPass" name="uPass" required aria-describedby="emailHelp">
								  </div>
								  <div class="mb-3">
								    <label for="uAdd" class="form-label">Address</label>
								    <input type="text" class="form-control" id="uAdd" name="uAdd" required aria-describedby="emailHelp">
								  </div>
								  <input type="submit" class="btn btn-primary" value="Update Account">
								</form>
                            </div>
                        </div>
                    </div>
                    <div id="history" class="tab-pane fade">
                        <div class="card">
                            <div class="card-body">
                            	<form id="ChangePassword">
								    <div class="mb-3">
								        <label for="oPass" class="form-label">Old Password</label>
								        <input type="password" class="form-control" id="oPass" name="oPass" required>
								        <input type="hidden" name="event" value="changePassword">
								        <div id="oPassError" class="text-danger"></div>
								    </div>
								    <div class="mb-3">
								        <label for="nPass" class="form-label">New Password</label>
								        <input type="password" class="form-control" id="nPass" name="nPass" required>
								        <div id="nPassError" class="text-danger"></div>
								    </div>
								    <div class="mb-3">
								        <label for="cPass" class="form-label">Confirm Password</label>
								        <input type="password" class="form-control" id="cPass" name="cPass" required>
								        <div id="cPassError" class="text-danger"></div>
								    </div>
								    <button type="submit" class="btn btn-primary">Change Password</button>
								</form>
                            </div>
                        </div>
                    </div>

                    <div id="update" class="tab-pane fade">
                        <div class="card">
                            <div class="card-body">
                              	<div id="viewFlight">
       								
       							</div>
                            </div>
                        </div>
                    </div>
                    <div id="closeAccount" class="tab-pane fade">
                        <div class="card">
                            <div class="card-body">
                              		 
							            <div class="card-header bg-warning text-dark">
							                <h4 class="text-center">Temporarily Close Account</h4>
							            </div>
							            <div class="card-body">
							                <p class="text-muted">
							                    Before you temporarily close your account, please review the following terms:
							                </p>
							                <ul>
							                    <li>Your account will be temporarily deactivated and can be reactivated anytime by logging in with your credentials.</li>
							                    <li>During the deactivation period, you will not receive any updates, notifications, or promotional emails.</li>
							                    <li>Any existing flight bookings will remain valid and unaffected by the temporary closure.</li>
							                    <li>Refunds or cancellations related to your bookings must be handled separately before closing the account.</li>
							                    <li>Ensure you remember your password to reactivate your account later.</li>
							                </ul>
							                <form id="tempCloseAccountForm">
							                    <div class="mb-3">
							                        <label for="password" class="form-label">Enter Password to Confirm</label>
							                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
							                        <input type="hidden" name="event" value="tempCloseAccount">
							                        <div id="passwordError" class="text-danger"></div>
							                    </div>
							                    <div class="form-check mb-3">
							                        <input class="form-check-input" type="checkbox" id="confirmClose" required>
							                        <label class="form-check-label" for="confirmClose">
							                            I agree to the terms and conditions mentioned above.
							                        </label>
							                    </div>
							                    <button type="submit" class="btn btn-warning w-100">Temporarily Close Account</button>
							                </form>
							            </div>
							        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 <%@ include file="include/footer.jsp" %>
<%@ include file="include/scripts.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$.ajax({
		url  : "BookingServlet",
		type : "post",
		data :{"event":"bookinghistory"},
		dataType:"json",
		success : function(response){
			console.log(response);
			let s="";
			
			for(var key in response){
                   if(response.hasOwnProperty(key)){
							 s+=" <div class='row flight-row'> <div class='col-3 flight-details'><div>";
							 s+=" <strong> Flight Name :&nbsp;"+response[key].fName+"</strong><br>";
							 s+="<strong>Source:&nbsp;</strong> "+response[key].source+"<br>";
							 s+="<strong>Departure:</strong>"+response[key].departure+"<br>";
							 s+="</div></div><div class='col-3 price-duration'> <div>";
							 s+="<strong>Flight NO:&nbsp;</strong>"+response[key].fNo+"<br>";
							 s+="<strong>Destination:&nbsp;</strong>"+ response[key].destination+"<br>";
							 s+="<strong>Arrival:&nbsp;</strong> "+response[key].arrival+"<br>";
							 s+="</div> </div><div class='col-3 departure-arrival'><div>";
							 s+="<strong>Paid Ammount:&nbsp;</strong>"+response[key].totalPrice+"<br>";
							 s+="<strong>Members:&nbsp;</strong>"+response[key].members+"<br>";
							 s+="<strong>Class:&nbsp;</strong>"+response[key].bClass;
							 s+="</div></div><div class='col-3 book-now'>";
							 s+="<strong>BookedDate:&nbsp;</strong>"+response[key].date+"<br>";
							 s+="<a class='btn btn-success btn-sm' >success</a> </div></div>";
                   	  		 s+="<br><hr><br>"
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
	$("#tempCloseAccountForm").on("submit", function(event) {
		event.preventDefault();
		const formdata = $(this).serialize();
		$.ajax({
			url : "userServlet",
			type : "post",
			data : formdata,
			success : function(response) {
				if (response.trim() == "done") {
					 $('#tempCloseAccountForm')[0].reset();
					 window.location.href='registation.jsp';
				} else {
					 $('#tempCloseAccountForm')[0].reset();
					 $.toast({
						    text: " Wrong Password!",
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
<script>
$(document).ready(function() {
    $("#ChangePassword").on("submit", function(event) {
        event.preventDefault(); 
       
        let isValid = true;
        const oldPassword = $("#oPass").val().trim();
        const newPassword = $("#nPass").val().trim();
        const confirmPassword = $("#cPass").val().trim();

        $("#oPassError, #nPassError, #cPassError").text("");
        if (oldPassword === newPassword) {
            $("#nPassError").text("New password cannot be the same as the old password.");
            isValid = false;
        }

        if (newPassword !== confirmPassword) {
            $("#cPassError").text("Confirm password must match the new password.");
            isValid = false;
        }
        if (isValid) {
            const formData = $(this).serialize(); 
            $.ajax({
                type: "POST",
                url:"userServlet",
                data: formData,
                success: function(response) {
                    if(response.trim() === "updatedSuccessfully") {
                    	$('#ChangePassword')[0].reset();
                    	$.toast({
    					    text: "Updated Successfully",
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
                    }else if(response.trim() ==="NPandCPnotMatch") {
                    	$('#ChangePassword')[0].reset();
                    	$.toast({
    					    text: "new Pass and confirm pass  not matched!",
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
                    }else{
                    	$('#ChangePassword')[0].reset();
                    	$.toast({
    					    text: "Wrong old password!",
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
                error: function() {
                	$('#ChangePassword')[0].reset();
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
					});                }
            });
        }
    });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	const uId=<%=uId %>;
	$.ajax({ 
		type : "Post",
		url:"userServlet",
		data:{"uId":uId,"event":"getCustomerById"},
		dataType:"json",
		success:function(response){
			$("#uName").val(response.uName);
			$("#uEmail").val(response.uEmail);
			$("#uPass").val(response.uPass);
			$("#uPhone").val(response.uPhone);
			$('#uAdd').val(response.uAdd);
			$('#uId').val(response.uId);
		},
		error:function(jqXHR,textStatus,errorThrown){
			alert('Something wrong on server !');
		   }
	});
});	
</script>
<script>
$(document).ready(function() {
	$("#myAccountId").on("submit", function(event) {
		event.preventDefault();
		const formdata = $(this).serialize();
		$.ajax({
			url: "userServlet",
			type : "post",
			data : formdata,
			success : function(response) {
				if (response.trim() == "done") {
					$.toast({
					    text: "Updated Successfully",
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
					$.toast({
					    text: "Failed to Update!",
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
		});
	});
});
</script>
</body>
</html>