
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.connection.*"%>
<%@page import="user.model.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>TECH SHOP</title>
  <link rel="stylesheet" href="css/index/style.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
 
  <link href="https://fonts.googleapis.com/css2?family=Jost:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous"
    referrerpolicy="no-referrer" />
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	 <link rel="stylesheet" href="css/index/style.css">
</head>

<body>
 <%@include file="/includes/nv.jsp"%>

  <section class="main-home" style="margin-top:80px">
  
    <div class="main-text">
      <h5>The Future Is Here</h5>
      <h1>MEGA TECH SALE<br>OF 2023</h1>
      <p>Technology & Devices </p>
    
      <a href="#" class="main-btn">Shop Now <i class='bx bx-right-arrow-alt'></i></a>
    </div>


    <div class="down-arrow">
      <a href="#trending" class="down"><i class='bx bx-down-arrow-alt'></i></a>

    </div>
  </section>

    <!-- products section -->

  <section class="trending-product" id="trending" style="margin-left:40px">
    <div class="center-text">
      <h2>Our Trending <span>products</span></h2>
    </div>
    <div class="Products">
      <div class="row">
        <img src="indeximg/1.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Airpods</h4>
          <p>$200 - $300</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/2.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Joystick</h4>
          <p>$20 - $40</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/3.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Mouse</h4>
          <p>$9 - $25</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/4.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Earbuds</h4>
          <p>$70 - $90</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/5.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Speaker</h4>
          <p>$33 - $62</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/6.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Camera</h4>
          <p>$97 - $300</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/7.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Boat Stone</h4>
          <p>$23 - $45</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/8.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Mic</h4>
          <p>$60 - $130</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/9.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Iphone 12</h4>
          <p>$97 - $160</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/10.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Macbook Air</h4>
          <p>$1000 - $1500</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/11.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Keyboard</h4>
          <p>$17 - $30</p>
        </div>

      </div>


      <div class="row">
        <img src="indeximg/14.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Charger</h4>
          <p>$9 - $20</p>
        </div>

      </div>


      <div class="row">
        <img src="indeximg/15.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>VR Headset</h4>
          <p>$70 - $79</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/16.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>TV</h4>
          <p>$500 - $1000</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/17.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Printer</h4>
          <p>$400 - $600</p>
        </div>

      </div>


      <div class="row">
        <img src="indeximg/18.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Monitor</h4>
          <p>$900 - $1400</p>
        </div>

      </div>


      <div class="row">
        <img src="indeximg/19.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Ipad</h4>
          <p>$200 - $400</p>
        </div>

      </div>


      <div class="row">
        <img src="indeximg/20.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Ring Light</h4>
          <p>$60 - $100</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/12.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>SSD</h4>
          <p>$200 - $400</p>
        </div>

      </div>

      <div class="row">
        <img src="indeximg/13.png" alt="">
        <div class="product-text">
          <h5>Sale</h5>
        </div>

        <div class="ratting">
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star'></i>
          <i class='bx bxs-star-half'></i>
        </div>
        <div class="price">
          <h4>Power Bank</h4>
          <p>$60 - $80</p>
        </div>

      </div>



    </div>
  </section>



<!-- clients review section -->


  <section class="clients-review">
    <div class="cr">

        <h3>Client Reviews</h3>

    <div class="reviews">

            <p>Sony company’s WH-CH710N were excellent, but overpriced initially. Sony made them an incredible value at $150 after it cut the price shortly after their debut in 2020. Great sound quality, capable ANC, good battery life and a comfy fit made the WH-CH710N a compelling, affordable alternative to the premium WH-1000XM3, which was the company’s flagship model at the time. Earlier this year, the company debuted the follow-up to that three-year-old set: the WH-CH720N.</p>
            <i class='bx bx-user'></i>
            <h4>Mark Jevenue</h4>
    </div>

    <div class="reviews">


            <p>The Blade 18 is Razer's largest and most powerful laptop yet. It's got a big, gorgeous 240Hz display, a slick unibody frame and practically every port you might need. It can also be configured with the fastest silicon you can get on a laptop today, including an Intel Core i9 CPU and an NVIDIA RTX 4090 GPU. There's just one problem: a fully loaded config costs $5,000.</p>
            <i class='bx bx-user'></i>
            <h4>Sam Rutherford</h4>
    </div>

    <div class="reviews">

            <p>If sound quality is your primary concern, the Momentum True Wireless 3 is your best bet. You won’t get the truckload of features that Sony offers, but Sennheiser does the basics well at a lower price than the previous Momentum earbuds. A new Adaptive Noise Cancellation setup continuously monitors ambient sounds to suppress them in real time. Inside, the company’s True Response transducer is paired with 7mm dynamic drivers for top-notch audio.</p>
            <i class='bx bx-user'></i>
            <h4>Jhon Wick</h4>
    </div>

   </div>
  </section>

   <!-- Team section -->

<section class="team">
  <div class="responsive-container-block container">
  <p class="text-blk team-head-text">
    Our Team
  </p>
  <div class="responsive-container-block">
    <div class="responsive-cell-block wk-desk-3 wk-ipadp-3 wk-tab-6 wk-mobile-12 card-container">
      <div class="card">
        <div class="team-image-wrapper">
          <img class="team-member-image" src="indeximg/team8.png">
        </div>
        <p class="text-blk name">
        Vivek Ranjan Sahoo
        </p>
        <p class="text-blk position">
          CEO
        </p>
        <p class="text-blk feature-text">
        Creating, communicating, and implementing the organization's vision, mission, and overall direction.
        </p>
        <div class="social-icons">
          <a href="https://www.twitter.com" target="_blank">
            <img class="twitter-icon" src="indeximg/lk.svg">
          </a>
          <a href="https://www.facebook.com" target="_blank">
            <img class="facebook-icon" src="indeximg/gt.svg">
          </a>
        </div>
      </div>
    </div>
    <div class="responsive-cell-block wk-desk-3 wk-ipadp-3 wk-tab-6 wk-mobile-12 card-container">
      <div class="card">
        <div class="team-image-wrapper">
          <img class="team-member-image" src="indeximg/team7.png">
        </div>
        <p class="text-blk name">
           Jay Jagadish Behera
        </p>
        <p class="text-blk position">
          CTO
        </p>
        <p class="text-blk feature-text">
        IT professional responsible for all technology systems,software design and development within the company. .
        </p>
        <div class="social-icons">
          <a href="https://www.linkedin.com/in/jay-jagadish-behera-b18aab210/" target="_blank">
            <img class="twitter-icon" src="indeximg/lk.svg">
          </a>
          <a href="https://github.com/jayjagadishb" target="_blank">
            <img class="facebook-icon" src="indeximg/gt.svg">
          </a>
        </div>
      </div>
    </div>
    <div class="responsive-cell-block wk-desk-3 wk-ipadp-3 wk-tab-6 wk-mobile-12 card-container">
      <div class="card">
        <div class="team-image-wrapper">
          <img class="team-member-image" src="indeximg/team11.png">
        </div>
        <p class="text-blk name">
          Satya Priya Mishra
        </p>
        <p class="text-blk position">
          CMO
        </p>
        <p class="text-blk feature-text">
          Listening to the trends of the market and directing the market research efforts of the company for overall growth of company.
        </p>
        <div class="social-icons">
          <a href="https://www.linkedin.com/in/jay-jagadish-behera-b18aab210/" target="_blank">
            <img class="twitter-icon" src="indeximg/lk.svg">
          </a>
          <a href="https://www.facebook.com" target="_blank">
            <img class="facebook-icon" src="indeximg/gt.svg">
          </a>
        </div>
      </div>
    </div>




</section>

<!-- Footer seection -->

<section class="f">
  <footer class="new_footer_area bg_color">
        <div class="new_footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-6">
                        <div class="f_widget company_widget wow fadeInLeft" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInLeft;">
                            <h3 class="f-title f_600 t_color f_size_18">Get in Touch</h3>
                            <p>Donot miss any updates of our new templates and extensions.!</p>
                            <form action="#" class="f_subscribe_two mailchimp" method="post" novalidate="true" _lpchecked="1">
                                <input type="text" name="EMAIL" class="form-control memail" placeholder="Email">
                                <button class="btn btn_get btn_get_two" type="submit" style="background-color:yellow;color:red;">Subscribe</button>
                                <p class="mchimp-errmessage" style="display: none;"></p>
                                <p class="mchimp-sucmessage" style="display: none;"></p>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="f_widget about-widget pl_70 wow fadeInLeft" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInLeft;">
                            <h3 class="f-title f_600 t_color f_size_18">Usefull Links</h3>
                            <ul class="list-unstyled f_list">
                                <li><a href="#">Home</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Privacy policy</a></li>
                                <li><a href="#">Terms of service</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="f_widget about-widget pl_70 wow fadeInLeft" data-wow-delay="0.6s" style="visibility: visible; animation-delay: 0.6s; animation-name: fadeInLeft;">
                            <h3 class="f-title f_600 t_color f_size_18">Our Services</h3>
                            <ul class="list-unstyled f_list">
                                <li><a href="#">FAQ</a></li>
                                <li><a href="#">Term &amp; conditions</a></li>
                                <li><a href="#">Computer</a></li>
                                <li><a href="#">Gaming Laptop</a></li>
                                <li><a href="#">Mobile Phone</a></li>
                                <li><a href="#">Gaming Gadget</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="f_widget social-widget pl_70 wow fadeInLeft" data-wow-delay="0.8s" style="visibility: visible; animation-delay: 0.8s; animation-name: fadeInLeft;">
                            <h3 class="f-title f_600 t_color f_size_18">Our Social Networks</h3>
                            <div class="f_social_icon">
                                <a href="#" class="fab fa-facebook"></a>
                                <a href="#" class="fab fa-twitter"></a>
                                <a href="#" class="fab fa-linkedin"></a>
                                <a href="#" class="fab fa-pinterest"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer_bg">
                <div class="footer_bg_one"></div>
                <div class="footer_bg_two"></div>
            </div>
        </div>
        <div class="footer_bottom">
            <div class="container" >
                <div class="row align-items-center">
                    <div class="col-lg-6 col-sm-7" align="center" style="margin-left:300px;margin-top:30px'">
                        <h5 class="mb-0 f_400" > <b> @Tech Shop 2023 All rights reserved.</b></h5>
                    </div>

                </div>
            </div>
        </div>
    </footer>
</section>
  <script src="js/java.js"> </script>

</body>

</html>
