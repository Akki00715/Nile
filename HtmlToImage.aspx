<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HtmlToImage.aspx.cs" Inherits="HtmlToImage" ValidateRequest="false" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Includes/css/Html2ImageConverter/Main.css" rel="stylesheet" />
    <script src="Includes/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="http://cdn.rawgit.com/niklasvh/html2canvas/master/dist/html2canvas.min.js"></script>
    <script type="text/javascript">
       
       
        function ConvertToImage(btn) {
            html2canvas($("#dvTable")[0]).then(function (canvas) {
                var base64 = canvas.toDataURL();
                $("[id*=hfImageData]").val(base64);

                html2canvas($("#dvTable1")[0]).then(function (canvas) {
                    var base64 = canvas.toDataURL();
                    $("[id*=hfImageData1]").val(base64);
                    });
               __doPostBack(btn.name, "");
            });
            //ConvertToImage1(btn1);
            return false;
        }
        function ConvertToImage1(btn1) {
            html2canvas($("#dvTable1")[0]).then(function (canvas) {
                var base64 = canvas.toDataURL();
                $("[id*=hfImageData1]").val(base64);
               __doPostBack(btn1.name, "");
            });
            return false;
        }
        
      
      
        //$(function (e) {
        //    $("[id*=Aubmit]").click(function () {
        //       // e.preventDefault();
        //        var checked_radio = $("[id*=rbListImages] input:checked");
        //        var value = checked_radio.val();
        //        var text = checked_radio.closest("td").find("label").html();
             
              

        //        if (value=='1') {
        //            $("#dvTable").addClass("red");
        //        }
        //        else if (value == '2') {
        //            $("#dvTable").addClass("blue");
        //        }
        //        else if (value == '3') {
        //            $("#dvTable").addClass("green");
        //        }
                
        //        return true;
        //    });
       // });
    </script>
</head>
<body>
    <form runat="server">
        <div>
         <FTB:FreeTextBox id="FreeTextBox1" runat="Server" Text="<b>Enter your text here</b>" Width="600px" EnableHtmlMode="false"
             toolbarlayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;InsertImage|Cut,Copy,Paste,Delete;Undo,Redo|SymbolsMenu,StylesMenu,InsertDate,InsertTime|EditStyle,SelectAll,WordClean,NetSpell" />


            <br />
            <asp:RadioButtonList ID="rbListImages" runat="server">
                <asp:ListItem Text="Red" Value="1"></asp:ListItem>
                <asp:ListItem Text="Blue" Value="2"></asp:ListItem>
                <asp:ListItem Text="Green" Value="3"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <asp:Literal ID="Literal1" runat="server" />
        <asp:Literal ID="Literal2" runat="server" />
        <asp:Literal ID="Literal3" runat="server" />
        <asp:Literal ID="Literal4" runat="server" />
        <br />

          <asp:Literal ID="Literal5" runat="server" />
        <asp:Literal ID="Literal6" runat="server" />
        <asp:Literal ID="Literal7" runat="server" />
        <asp:Literal ID="Literal8" runat="server" />
        <div>
            <asp:Button ID="Aubmit" runat="server" Text="submit" OnClick="submit_Click" /><br />
            <asp:HiddenField ID="hfImageData" runat="server" />
                 <asp:HiddenField ID="hfImageData1" runat="server" />
            <asp:Button ID="btn" runat="server" Text="download Image" UseSubmitBehavior="false"
                OnClick="ExportToImage" OnClientClick="return ConvertToImage(this)" />
              <asp:Button ID="Btn1" runat="server" Text="download Image" UseSubmitBehavior="false"
                OnClick="ExportToImage1" OnClientClick="return ConvertToImage1(this)" />
        </div>
    </form>
</body>
</html>
