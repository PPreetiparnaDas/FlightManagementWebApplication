<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking Landing Page</title>
    <%@ include file="include/links.jsp" %>
    <style>
     body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }

        .faq-section {
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 40px;
        }

        .faq-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .faq-header h2 {
            font-size: 2rem;
            color: #343a40;
        }

        .faq-header p {
            color: #6c757d;
            font-size: 1rem;
        }

        .accordion-button {
            background-color: #00e5ff;
            color: #ffffff;
            font-weight: bold;
            border: none;
            border-radius: 4px;
            transition: all 0.3s;
        }

        .accordion-button:hover,
        .accordion-button:focus {
            background-color: #b5d3f3;
            color: #ffffff;
        }

        .accordion-button:not(.collapsed) {
            background-color: #b5d3f3;
            color: #ffffff;
            box-shadow: none;
        }

        .accordion-body {
            background-color: #f8f9fa;
            color: #495057;
            border-radius: 4px;
            padding: 20px;
        }

        .accordion-item {
            border: none;
            margin-bottom: 15px;
        }
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .video-bg {
            position: relative;
            height: 100vh;
            overflow: hidden;
        }
        .video-bg video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .video-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .features .card img {
            height: 200px;
            object-fit: cover;
        }
        .flights-section {
            background-color: #f8f9fa;
            padding: 40px 0;
        }
        /* .footer {
            background: #333;
            color: white;
            padding: 20px 0;
        }
        .footer a {
            color: #ffcc00;
            text-decoration: none;
        } */
        .testimonials .carousel-inner img {
            height: 100px;
            width: 100px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    
<%@ include file="include/header.jsp" %>
    <!-- Video Hero Section -->
    <div class="video-bg">
        <video autoplay loop muted>
            <source src="images/bg.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <div class="video-overlay">
            <h1 class="display-4 fw-bold">Explore the Skies</h1>
            <p class="lead">Book your next adventure now</p>
            <form class="d-flex justify-content-center mt-3">
                <input type="text" class="form-control w-50 me-2" placeholder="Enter Destination">
                <button class="btn btn-info">Search Flight</button>
            </form>
        </div>
    </div>

    <!-- About Us -->
    <section id="about" class="py-5">
        <div class="container">
            <h2 class="text-center mb-4">About Us</h2>
            <p class="text-center">
                At FlightBooking, we are committed to connecting the world through seamless and affordable air travel. 
                With years of experience and a customer-first approach, we make flying a joyful experience for everyone.
            </p>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="features py-5">
        <div class="container">
            <h2 class="text-center mb-4">Why Choose Us?</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <img src="images/1.png" class="card-img-top" alt="Affordable Prices">
                        <div class="card-body text-center">
                            <h5 class="card-title">Affordable Prices</h5>
                            <p class="card-text">Get the best deals on all flights.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <img src="images/2.png" class="card-img-top" alt="Global Destinations">
                        <div class="card-body text-center">
                            <h5 class="card-title">Global Destinations</h5>
                            <p class="card-text">Over 200 destinations to explore.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <img src="images/3.png" class="card-img-top" alt="24/7 Support">
                        <div class="card-body text-center">
                            <h5 class="card-title">24/7 Support</h5>
                            <p class="card-text">We're here for you, anytime.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Scheduled Flights -->
    <section id="flights" class="flights-section">
        <div class="container">
            <h2 class="text-center mb-4">Scheduled Flights</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Flight to New York</h5>
                            <p class="card-text">Departure: 12:00 PM | Arrival: 3:00 PM</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Flight to Paris</h5>
                            <p class="card-text">Departure: 8:00 AM | Arrival: 12:00 PM</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title">Flight to Tokyo</h5>
                            <p class="card-text">Departure: 9:00 PM | Arrival: 6:00 AM</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Reviews Section -->
    <section id="reviews" class="testimonials py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-4">Customer Reviews</h2>
            <div id="testimonialCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active text-center">
                        <img src="images/11.png" class="rounded-circle mb-3" alt="Customer 1">
                        <p class="lead">"Amazing service! Booking was easy and smooth."</p>
                        <p>- John Doe</p>
                    </div>
                    <div class="carousel-item text-center">
                        <img src="images/22.png" class="rounded-circle mb-3" alt="Customer 2">
                        <p class="lead">"Affordable flights and great support team."</p>
                        <p>- Jane Smith</p>
                    </div>
                    <div class="carousel-item text-center">
                        <img src="images/33.png" class="rounded-circle mb-3" alt="Customer 2">
                        <p class="lead">"Affordable flights and great support team."</p>
                        <p>- Jane Smith</p>
                    </div>
                    <div class="carousel-item text-center">
                        <img src="images/44.png" class="rounded-circle mb-3" alt="Customer 2">
                        <p class="lead">"Affordable flights and great support team."</p>
                        <p>- Jane Smith</p>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#testimonialCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
    </section>

    <!-- Newsletter Section -->
   <div class="container my-5">
        <div class="faq-section">
            <div class="faq-header">
                <h2>Frequently Asked Questions</h2>
                <p>Your questions answered, for a seamless booking experience.</p>
            </div>
            <div class="accordion" id="faqAccordion">

                <!-- Question 1 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="faqHeading1">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse1" aria-expanded="true" aria-controls="faqCollapse1">
                            <i class="bi bi-airplane"></i> How do I book a flight?
                        </button>
                    </h2>
                    <div id="faqCollapse1" class="accordion-collapse collapse show" aria-labelledby="faqHeading1" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            To book a flight, use our search tool to enter your departure and destination cities, select dates, and choose the number of passengers. Then follow the steps to confirm and pay.
                        </div>
                    </div>
                </div>

                <!-- Question 2 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="faqHeading2">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse2" aria-expanded="false" aria-controls="faqCollapse2">
                            <i class="bi bi-pencil-square"></i> Can I cancel or modify my booking?
                        </button>
                    </h2>
                    <div id="faqCollapse2" class="accordion-collapse collapse" aria-labelledby="faqHeading2" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Yes, you can cancel or modify your booking through your account dashboard. Cancellation and modification policies depend on the airline's terms.
                        </div>
                    </div>
                </div>

                <!-- Question 3 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="faqHeading3">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse3" aria-expanded="false" aria-controls="faqCollapse3">
                            <i class="bi bi-wallet"></i> What payment methods are accepted?
                        </button>
                    </h2>
                    <div id="faqCollapse3" class="accordion-collapse collapse" aria-labelledby="faqHeading3" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            We accept various payment methods, including credit/debit cards, net banking, UPI, and popular digital wallets.
                        </div>
                    </div>
                </div>

                <!-- Question 4 -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="faqHeading4">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faqCollapse4" aria-expanded="false" aria-controls="faqCollapse4">
                            <i class="bi bi-check-square"></i> How do I check-in online for my flight?
                        </button>
                    </h2>
                    <div id="faqCollapse4" class="accordion-collapse collapse" aria-labelledby="faqHeading4" data-bs-parent="#faqAccordion">
                        <div class="accordion-body">
                            Online check-in can be done through the airline's website or app. Enter your booking reference number and follow the instructions to receive your boarding pass.
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Footer -->
   <%@ include file="include/footer.jsp" %>
   <%@ include file="include/scripts.jsp" %>
   
</body>
</html>
