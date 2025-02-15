<!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">FlightBooking</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                 <%
                   	if(session.getAttribute("uName")==null || session.getAttribute("uName")==" "){
                 %>
                	<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
                    <li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
                    <li class="nav-item"><a class="nav-link" href="search.jsp">Search</a></li>
                    <li class="nav-item"><a class="nav-link" href="#reviews">Reviews</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
	                <li class="nav-item"><a class="nav-link" href="registration.jsp">Reg</a> </li>
                     <%
                       }else{
                     %> 
                     <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                     <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
                     <li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
                     <li class="nav-item"><a class="nav-link" href="search.jsp">Search</a></li>
                     <li class="nav-item"><a class="nav-link" href="myAccount.jsp">MyAccount</a></li>
                     <li class="nav-item"><a class="nav-link" href="#reviews">Reviews</a></li>
                     <li class="nav-item"><span class="nav-link" style="color:green">Welcome <b><%out.print(session.getAttribute("uName"));%></b></span></li>
					 <li class="nav-item"><a class="nav-link" href="logout.jsp" class="">Logout</a></li>
                    <% 
                      }
                     %> 
                </ul>
            	
                           
            </div>
        </div>
    </nav>