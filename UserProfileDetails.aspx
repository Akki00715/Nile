<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserProfileDetails.aspx.cs" Inherits="UserProfileDetails" %>
  
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
    <title>Tabbed Profile Widget Flat Responsive Widget Template :: w3layouts</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Tabbed Profile Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="../Includes/css/UserProfile/style.css" rel="stylesheet" type="text/css" media="all" />
    <script type="text/javascript" src="../Includes/js/jquery-1.11.1.min.js"></script>
    <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300italic,300,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<%--Calender--%>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $('[id*=txtDate]').change(function () {
                $('[id*=hdnDate]').val($('[id*=txtDate]').val());
            });
        })

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
        <asp:HiddenField ID="hdnDate" runat="server" />
        <div class="main">
            <h1>Tabbed Profile Widget</h1>
            <div class="content">
                <div class="sap_tabs">
                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                        <script src="../Includes/js/UserProfile/easyResponsiveTabs.js" type="text/javascript"></script>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                $('#horizontalTab').easyResponsiveTabs({
                                    type: 'default', //Types: default, vertical, accordion           
                                    width: 'auto', //auto or any width like 600px
                                    fit: true,   // 100% fit in a container
                                    closed: 'accordion', // Start closed if in accordion view
                                    activate: function (event) { // Callback function if tab is switched
                                        var $tab = $(this);
                                        var $info = $('#tabInfo');
                                        var $name = $('span', $info);
                                        $name.text($tab.text());
                                        $info.show();
                                    }
                                });

                                $('#verticalTab').easyResponsiveTabs({
                                    type: 'vertical',
                                    width: 'auto',
                                    fit: true
                                });
                            });

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
                        <div class="portfolio-grid">
                            <div class="port-left">
                                <ul class="resp-tabs-list">
                                    <%--<img class="lady" src="../Includes/images/UserProfile/pic1.jpg" alt="" />--%>
                                    <asp:Image ID="AreaImage1" CssClass="imgpreview1" ClientIDMode="Static" runat="server"
                                    Style="height: 200px; width: 200px; margin-left: -60px" />

                                <asp:FileUpload ID="fuProfileImage" runat="server" onchange="PreviewImage(this,'AreaImage1')" />
                                    <%--<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Basic Details</span></li>
                                    <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Interests</span></li>
                                    <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Social Life</span></li>
                                    <li class="resp-tab-item" aria-controls="tab_item-3" role="tab"><span>Work & Play</span></li>
                                    <li class="resp-tab-item" aria-controls="tab_item-4" role="tab"><span>Settings</span></li>--%>
                                    <div class="clear"></div>
                                </ul>
                            </div>
                            <div class="port-right">

                                <div class="resp-tabs-container">
                                    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                        <div class="profile-content">
                                            <h3>Artist Name</h3>
                                            <div class="input-group">
                                                <span class="input-group-btn">
                                                    <%--<select class="btn btn-default button-one" name="ext">
                                                        <option selected="">Ms.</option>
                                                        <option>Mr.</option>
                                                        <option>Mrs.</option>
                                                    </select>--%>
                                                </span>
                                                <asp:TextBox ID="txtArtistName" runat="server" placeHolder="Artist Name" CssClass="txtClass form-control" TextMode="SingleLine"></asp:TextBox>
                                                <%--<input type="text" class="form-control" value="Rachel McAdams" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Rachel McAdams';}"></input>--%>
                                            </div>
                                            <h3>First Name</h3>
                                            <div class="email-group">
                                                <div class="email-icon"><span></span></div>
                                                <div class="email-form">
                                                    <%--<form>
																<input type="text" class="fb-ico" value="notebookchick@gmail.com" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'notebookchick@gmail.com';}">	
															</form>--%>
                                                    <asp:TextBox ID="txtFname" runat="server" placeHolder="First Name" CssClass="txtClass" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                            <h3>Last Name</h3>
                                            <div class="email-group">
                                                <div class="email-icon"><span></span></div>
                                                <div class="email-form">
                                                    <%--<form>
																<input type="text" class="fb-ico" value="notebookchick@gmail.com" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'notebookchick@gmail.com';}">	
															</form>--%>
                                                    <asp:TextBox ID="txtLname" runat="server" placeHolder="Last Name" CssClass="txtClass" TextMode="SingleLine"></asp:TextBox>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                            <h3>Email</h3>
                                            <div class="email-group">
                                                <div class="email-icon"><span></span></div>
                                                <div class="email-form">
                                                    <%--<form>
																<input type="text" class="fb-ico" value="notebookchick@gmail.com" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'notebookchick@gmail.com';}">	
															</form>--%>
                                                    <asp:TextBox ID="txtEmailID" runat="server" CssClass="txtClass form-control" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                            <h3>Mobile Number</h3>
                                            <div class="phone-group">
                                                <div class="cell-icon"><span></span></div>
                                                <div class="cell-form">
                                                    <%--<form>
																<input type="text" value="123-456-7890" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '123-456-7890';}">	
															</form>--%>
                                                    <asp:TextBox ID="txtMobile" runat="server" placeHolder="Mobile No" CssClass="txtClass form-control" TextMode="Phone" MaxLength="10"></asp:TextBox>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                             <h3>Gender</h3>
                                            <div class="radio-btns">
                                                <div class="swit">
                                                    <%--<div class="check_box"> <div class="radio"> <label><input type="radio" name="radio" checked=""><i></i><img src="../Includes/images/UserProfile/man.png" alt=" "/></label> </div></div>
															<div class="check_box"> <div class="radio2"> <label><input type="radio" name="radio"><i></i><img src="../Includes/images/UserProfile/woman.png" alt=" "/></label> </div></div>--%>
                                                    <asp:Label ID="lblGender" class="form-control" runat="server" Text=" " CssClass="txtClass"></asp:Label>
													<asp:DropDownList ID="ddlGender" runat="server" CssClass="txtClass form-control">
                                                        <asp:ListItem Selected="True" Value="0">Select Gender</asp:ListItem>
                                                        <asp:ListItem Value="M">Male</asp:ListItem>
                                                        <asp:ListItem Value="F">Female</asp:ListItem>
                                                        <asp:ListItem Value="NA">Donot Specify</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                           <h3>Date of Birth</h3>
                                            <div class="phone-btns">
                                               <asp:Label class="form-control" ID="lblDOB" runat="server" CssClass="txtClass" Text=""></asp:Label>
                                                <%--<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>--%>
                                               <asp:TextBox ID="txtDate" runat="server" ReadOnly = "true" CssClass="txtClass form-control"></asp:TextBox>
												
                                            </div>
                                        </div>
                                        <div class="update">
                                            <%--<asp:Button ID="btnSignIn" runat="server" Text="Update" CssClass="btnClass" OnClick="btnUpdate_Click" />--%>
                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </div>

                            </div>
                            <div class="clear"></div>
                        </div>

                    </div>
                </div>

            </div>
            <p class="footer">Copyright © 2016 Tabbed Profile Widget. All Rights Reserved | Template by <a href="https://w3layouts.com/" target="_blank">w3layouts</a></p>
        </div>
    </form>
</body>
</html>
