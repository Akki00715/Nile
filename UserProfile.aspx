<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Profile Flat Responsive Widget Template :: w3layouts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Smart Profile template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <link href="../Includes/css/Profile/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //Custom Theme files -->
    <!-- js -->
    <script src="Includes/js/jquery-1.11.1.min.js"></script>
    <%--<script src="js/jquery-2.2.3.min.js"></script>--%>
    <!-- //js -->
    <!-- web font -->
    <link href="//fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Kurale" rel="stylesheet">
    <!-- //web font -->
    <!-- pop-up-box -->
    <script src="../Includes/js/Profile/jquery.magnific-popup.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $('.popup-top-anim').magnificPopup({
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });
        });
    </script>
    <!-- //pop-up-box -->
</head>
<body>
    <form runat="server">
        <div class="main-agileits">
            <h1>Smart Profile</h1>
            <div class="wthree-row">
                <div class="profile-w3lstop">

                    <div class="menu w3-agile">
                        <span class="menu-icon"><a href="#">
                            <img src="../Includes/images/Profile/menu-icon.png" alt="" /></a></span>
                        <ul class="nav1">
                            <li><a href="#">History</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Messages</a></li>
                            <li><a href="/UserProfileDetails.aspx">Edit</a></li>
                        </ul>
                        <!-- script-for-menu -->
                        <script>
                            $("span.menu-icon").click(function () {
                                $("ul.nav1").slideToggle(300, function () {
                                    // Animation complete.
                                });
                            });
                        </script>
                        <!-- /script-for-menu -->
                    </div>
                    <div class="agile-name">
                        <asp:Image ID="IprofileImage" runat="server" />
                        <%--<asp:Image ID="Image1" runat="server" Visible="false" />--%>
                        <h2>
                            <asp:Label ID="lblArtistName" runat="server" Text="Label"></asp:Label>
                            </h2>
                        <h6>
                            <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                            </h6>
                        <asp:Button ID="BtnFollow" runat="server" CssClass="btnFollow" Text="+ Follow" />
                        <asp:Button ID="BtnUnFollow" runat="server" CssClass="btnUnFollow" Text="- UnFollow" />
                        <a href="#">+ Follow</a>
                    </div>
                </div>
                <div class="profile-w3lsmdl">
                    <div class="profile-text-left">
                        <h3>
                            <asp:Label ID="lblFollowers" runat="server" Text="Label"></asp:Label></h3>
                        <p>Followers</p>
                    </div>
                    <div class="profile-text-right">
                        <h3>
                            <asp:Label ID="lblFollowing" runat="server" Text="Label"></asp:Label></h3>
                        <p>Following</p>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="agileinfo-text">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor luctus pellentesque.</p>
                </div>
                <div class="agileits-row">
                    <div class="agileits-left">
                        <a href="#">
                            <img src="../Includes/images/Profile/img1.jpg" class="img-responsive zoom-img" alt="" /></a>
                        <a href="#">
                            <img src="../Includes/images/Profile/img2.jpg" class="img-responsive zoom-img" alt="" /></a>
                        <a href="#">
                            <img src="../Includes/images/Profile/img3.jpg" class="img-responsive zoom-img" alt="" /></a>
                        <a href="#small-dialog" class="w3phts popup-top-anim">
                            <h4><span>+10</span><br>
                                Photos</h4>
                        </a>
                        <!-- modal -->
                        <%--<div id="small-dialog" class="mfp-hide">
						<h5 class="w3ls-title">My Photos</h5>
						<div class="w3-agileits-albam"> 
							<a href="#"><img src="images/img1.jpg" class="img-responsive zoom-img" alt=""/></a>  
							<a href="#"><img src="images/img2.jpg" class="img-responsive zoom-img" alt=""/></a>  
							<a href="#"><img src="images/img3.jpg" class="img-responsive zoom-img" alt=""/></a>    
							<a href="#"><img src="images/img4.jpg" class="img-responsive zoom-img" alt=""/></a>
							<a href="#"><img src="images/img1.jpg" class="img-responsive zoom-img" alt=""/></a>  
							<a href="#"><img src="images/img3.jpg" class="img-responsive zoom-img" alt=""/></a>  
							<a href="#"><img src="images/img4.jpg" class="img-responsive zoom-img" alt=""/></a>    
							<a href="#"><img src="images/img1.jpg" class="img-responsive zoom-img" alt=""/></a>
							<a href="#"><img src="images/img2.jpg" class="img-responsive zoom-img" alt=""/></a>  
							<a href="#"><img src="images/img3.jpg" class="img-responsive zoom-img" alt=""/></a>  
							<div class="clear"> </div>
						</div> 
					</div>
					<!-- //modal -->
					<div class="clear"> </div>--%>
                    </div>
                    <%--<div class="agileits-right">
					<iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d96672.92430471104!2d-104.93320385317813!3d50.45279044052167!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x531c025787544721%3A0xde6d071afac45a64!2sGrand+Coulee%2C+SK%2C+Canada!5e0!3m2!1sen!2sus!4v1472282495750"></iframe> 
				</div>
				<div class="clear"> </div>	--%>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
