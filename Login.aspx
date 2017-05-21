<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">

    <title>Prominent Multi Forms Widget Flat Responsive Widget Template :: w3layouts</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Prominent Multi Forms Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <!-- font-awesome icons -->
    <link rel="stylesheet" href="../Includes/css/Login/font-awesome.min.css" />
    <!-- //font-awesome icons -->
    <link href="../Includes/css/Login/style.css" rel="stylesheet" type="text/css" media="all" />
    <link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i&subset=latin-ext" rel="stylesheet">
<%--Calender--%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(function () {
            $("[id$=txtDate]").datepicker({
                showOn: 'button',
                buttonImageOnly: true,
                buttonImage: '../Includes/images/UserProfile/calendar.png'
            });
        });
    </script>
<%--Calender--%>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div class="main">
            <h1>Prominent Multi Forms Widget</h1>
            <div class="agile_main_grid">
                <div class="w3_agile_main_left">
                    <div class="w3l_main_grid1_w3ls_grid">
                        <h3>Sign In</h3>

                        <div class="w3_agile_main_left_grid_w3_agileits">
                            <%--<form action="#" method="post">--%>
                            <div class="agileits_w3layouts_user">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <asp:TextBox ID="txtLUsername" runat="server" placeHolder="User Name" CssClass="txtClass" TextMode="SingleLine" ></asp:TextBox>
                            </div>
                            <div class="agileits_w3layouts_user">
                                <i class="fa fa-key" aria-hidden="true"></i>
                                <asp:TextBox ID="txtLPassword" runat="server" placeHolder="Password" CssClass="txtClass" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="agile_remember">
                                <div class="agile_remember_left">
                                    <div class="check">
                                        <label class="checkbox">
                                            <input type="checkbox" name="checkbox"><i> </i>remember me</label>
                                    </div>
                                </div>
                                <div class="agile_remember_right">
                                    <a href="/ForgotPassword.aspx">Forgot Password?</a>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <%--<input type="submit" value="Sign In">--%>
                            <asp:Button ID="btnSignIn" runat="server" Text="Sign In" CssClass="btnClass" OnClick="btnSignIn_Click" />

                            <h4>Continue With</h4>
                            <div class="wthree_social_icons">
                                <ul>
                                    <li><a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <h5>Don't have an account? <a href="#">Sign Up</a></h5>
                            <%--</form>--%>
                        </div>
                    </div>
                    <%--<div class="w3l_main_grid1_w3ls_grid agileinfo_account_reset" style="display: none">
                        <h3>Account Reset</h3>
                        <div class="w3_agile_main_left_grid_w3_agileits">
                            <form action="#" method="post">
                                <div class="agileits_w3layouts_user">
                                    <i class="fa fa-key" aria-hidden="true"></i>
                                    <input type="password" name="Password" placeholder="New Password" required="">
                                </div>
                                <div class="agileits_w3layouts_user">
                                    <i class="fa fa-key" aria-hidden="true"></i>
                                    <input type="password" name="Password" placeholder="Confirm Password" required="">
                                </div>
                                <p class="asd">
                                    <a href="#">Great passwords</a> use upper and lower case
								characters, numbers and symbols like "!@#$*.
                                </p>
                                <input type="reset" value="Reset Password">
                                <input type="submit" value="Send">
                                <h5>Already a member? <a href="#">Sign In</a></h5>
                            </form>
                        </div>
                    </div>
                    <div class="w3l_main_grid1_w3ls_grid" style="display: none">
                        <h3>Mask / unmask Password</h3>
                        <div class="w3_agile_main_left_grid_w3_agileits">
                            <form action="#" method="post">
                                <div class="agileits_w3layouts_user">
                                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                    <input type="email" name="Email" placeholder="Enter your email" required="">
                                </div>
                                <div class="agileits_w3layouts_user agileits_w3layouts_user1">
                                    <i class="fa fa-key" aria-hidden="true"></i>
                                    <input type="password" class="w3_pass" name="Password" placeholder="Password" required="">
                                    <button class="unmask" type="button" title="Mask/Unmask password to check content">Unmask</button>
                                </div>
                                <input type="submit" value="Send">
                            </form>
                        </div>
                    </div>--%>
                    <script src="Includes/js/jquery-1.11.1.min.js"></script>
                    <script>
                        /* 
                          Switch actions
                        */
                        $('.unmask').on('click', function () {

                            if ($(this).prev('input').attr('type') == 'password')
                                changeType($(this).prev('input'), 'text');

                            else
                                changeType($(this).prev('input'), 'password');

                            return false;
                        });


                        /* 
                          function from : https://gist.github.com/3559343
                          Thank you bminer!
                        */

                        function changeType(x, type) {
                            if (x.prop('type') == type)
                                return x; //That was easy.
                            try {
                                return x.prop('type', type); //Stupid IE security will not allow this
                            } catch (e) {
                                //Try re-creating the element (yep... this sucks)
                                //jQuery has no html() method for the element, so we have to put into a div first
                                var html = $("<div>").append(x.clone()).html();
                                var regex = /type=(\")?([^\"\s]+)(\")?/; //matches type=text or type="text"
                                //If no match, we add the type attribute to the end; otherwise, we replace
                                var tmp = $(html.match(regex) == null ?
                                    html.replace(">", ' type="' + type + '">') :
                                    html.replace(regex, 'type="' + type + '"'));
                                //Copy data from old element
                                tmp.data('type', x.data('type'));
                                var events = x.data('events');
                                var cb = function (events) {
                                    return function () {
                                        //Bind all prior events
                                        for (i in events) {
                                            var y = events[i];
                                            for (j in y)
                                                tmp.bind(i, y[j].handler);
                                        }
                                    }
                                }(events);
                                x.replaceWith(tmp);
                                setTimeout(cb, 10); //Wait a bit to call function
                                return tmp;
                            }
                        }

                        //added by akshay
                        function PreviewImage(currentobj, ID) {
                            var isIE = (navigator.appName == "Microsoft Internet Explorer");
                            var path = $(currentobj).val();
                            var filesid = $(currentobj).attr('id'); //id of current fileupload control
                            var currentelement = $(currentobj);
                            var imageFiles = document.getElementById('' + filesid + '').files;
                            var ext = path.substring(path.lastIndexOf('.') + 1).toLowerCase();
                            var img = $('#' + ID + '');
                            if (isIE) {
                                img.attr('src', path);
                            }
                            else {
                                if (imageFiles) {
                                    var reader = new FileReader();
                                    file = imageFiles[0];
                                    reader.onload = function (e) {
                                        img.attr('src', e.target.result);
                                    }
                                    reader.readAsDataURL(file);
                                }
                            }

                        }
                    </script>
                </div>
                <div class="w3_agile_main_right">
                    <div class="w3l_main_grid1_w3ls_grid">
                        <h3>Sign Up</h3>
                        <div class="w3_agile_main_left_grid_w3_agileits">
                            <%--<form method="post">--%>
                            <%--<div class="agileits_w3layouts_user">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <asp:TextBox ID="txtArtistName" runat="server" placeHolder="Artist Name" CssClass="txtClass" TextMode="SingleLine" ></asp:TextBox>
                            </div>
                            <div class="agileits_w3layouts_user">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <asp:TextBox ID="txtFname" runat="server" placeHolder="First Name" CssClass="txtClass" TextMode="SingleLine"></asp:TextBox>
                            </div>
                            <div class="agileits_w3layouts_user">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <asp:TextBox ID="txtLname" runat="server" placeHolder="Last Name" CssClass="txtClass" TextMode="SingleLine" ></asp:TextBox>
                            </div>--%>
                            <%--<div class="agileits_w3layouts_user">
                                <i class="fa fa-key" aria-hidden="true"></i>
                                <asp:TextBox ID="txtPassword" runat="server" placeHolder="Password" CssClass="txtClass" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="agileits_w3layouts_user">
                                <i class="fa fa-key" aria-hidden="true"></i>
                                <asp:TextBox ID="txtCPassword" runat="server" placeHolder="Confirm Password" CssClass="txtClass" TextMode="Password"></asp:TextBox>
                            </div>--%>
                            <div class="agileits_w3layouts_user">
                                <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                <asp:TextBox ID="txtEmail" runat="server" placeHolder="Email" CssClass="txtClass" TextMode="Email" ></asp:TextBox>
                            </div>

                            <%--<div class="agileits_w3layouts_user">
                                <asp:Label ID="lblDOB" runat="server" Text="Date Of Birth"></asp:Label>
                                <asp:TextBox ID="txtDate" runat="server" ReadOnly = "true" CssClass="txtClass form-control"></asp:TextBox>
                            </div>

                            <div class="agileits_w3layouts_user">
                                <asp:Label ID="lblGender" runat="server" Text="Gender"></asp:Label>
                                <asp:DropDownList ID="ddlGender" runat="server">
                                    <asp:ListItem Selected="True" Value="0">Select Gender</asp:ListItem>
                                    <asp:ListItem Value="M">Male</asp:ListItem>
                                    <asp:ListItem Value="F">Female</asp:ListItem>
                                    <asp:ListItem Value="NA">Donot Specify</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="agileits_w3layouts_user">
                                <asp:Image ID="AreaImage1" CssClass="imgpreview1" ClientIDMode="Static" runat="server"
                                    Style="height: 200px; width: 200px; margin-left: -60px" />

                                <asp:FileUpload ID="fuProfileImage" runat="server" onchange="PreviewImage(this,'AreaImage1')" />
                            </div>

                            <div class="agileits_w3layouts_user">
                                <i class="fa fa-mobile" aria-hidden="true"></i>
                                <asp:TextBox ID="txtMobile" runat="server" placeHolder="Mobile No" CssClass="txtClass" TextMode="Phone" MaxLength="10"></asp:TextBox>
                            </div>--%>

                            <div class="check">
                                <label class="checkbox">
                                    <input type="checkbox" name="checkbox" checked=""><i> </i>i agree to the <span>terms of services</span></label>
                            </div>
                            <%--<input type="submit" value="Sign Up">--%>
                            <asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btnClass" OnClick="btnSignUp_Click" />
                            <%--<asp:Button ID="btnSignUpNew" runat="server" Text="btnSignUp" OnClick="btnSignUpNew_Click" />--%>

                            <h4>Continue With</h4>
                            <div class="wthree_social_icons">
                                <ul>
                                    <li>

                                        <asp:ImageButton ID="ImgBtnGmailLogin" runat="server" class="w3_agile_facebook fa fa-facebook" OnClick="ImgBtnGmailLogin_Click" /><%--<i class="fa fa-facebook" aria-hidden="true"></i>--%>
                                        <%--<a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a>--%></li>
                                    <li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                                    <li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <h5>Already a member? <a href="#">Sign In</a></h5>
                            <%--</form>--%>
                        </div>
                    </div>
                    <%--<div class="w3l_main_grid1_w3ls_grid" style="display: none">
                        <h3>Forgot Password</h3>
                        <div class="w3_agile_main_left_grid_w3_agileits">
                            <form action="#" method="post">
                                <div class="agileits_w3layouts_user">
                                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                    <input type="email" name="Email" placeholder="Enter your email" required="">
                                </div>
                                <input type="submit" value="Send">
                                <h4>Continue With</h4>
                                <div class="wthree_social_icons">
                                    <ul>
                                        <li><a href="#" class="w3_agile_facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="agile_twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="w3_agile_dribble"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                                        <li><a href="#" class="w3_agile_vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></li>
                                    </ul>
                                </div>
                                <h5>Already a member? <a href="#">Sign In</a></h5>
                            </form>
                        </div>
                    </div>
                    <div class="w3l_main_grid1_w3ls_grid" style="display: none">
                        <h3>Subscribe Form</h3>
                        <div class="w3_agile_main_left_grid_w3_agileits">
                            <form action="#" method="post">
                                <div class="agileits_w3layouts_user">
                                    <i class="fa fa-envelope-o" aria-hidden="true"></i>
                                    <input type="email" name="Email" placeholder="Enter your email" required="">
                                </div>
                                <input type="submit" value="Subscribe Now">
                            </form>
                        </div>
                    </div>--%>
                </div>
                <div class="clear"></div>
            </div>
            <div class="agileits_copyright">
                <p>© 2017 Prominent Multi Forms Widget. All rights reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
            </div>
        </div>
    </form>
</body>
</html>
