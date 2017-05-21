<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tabbed Profile Widget Flat Responsive Widget Template :: w3layouts</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Tabbed Profile Widget Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="Includes/css/UserProfile/style.css" rel="stylesheet"  media="all"  />
    <script src="Includes/js/jquery-1.11.1.min.js"></script>
    <link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300italic,300,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <h1>Tabbed Profile Widget</h1>
            <div class="content">
                <div class="sap_tabs">
                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                        <script src="Includes/js/UserProfile/easyResponsiveTabs.js"></script>
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
                        </script>
                        <div class="portfolio-grid">
                            <div class="port-right">
                                <div class="resp-tabs-container">
                                    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                        <div class="work-play">
                                            <h3>Update Password</h3>
                                            <h4>Current Password</h4>
                                            <form>
                                            <asp:TextBox ID="txtCurrentPassword" runat="server"></asp:TextBox></form>
                                            <h4>New Password</h4>
                                                <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
                                            <h4>Confirm Password</h4>
                                                <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="update">
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
