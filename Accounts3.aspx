<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Accounts3.aspx.cs" Inherits="Accounts3" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" type="text/css" rel="stylesheet" />
  
    <title>Texas Speed Delivery-Services</title>                 <!--Title of page -->
   <script type="text/javascript">
       var xmlDoc;
       var xmlhttp;
       function loadXMLDoc() {
           xmlhttp = new XMLHttpRequest();
           xmlhttp.onreadystatechange = readData;
           xmlhttp.open("GET", "contactinfor.xml", true);
           xmlhttp.send();
       }
       function readData() {
           if (xmlhttp.readyState == 4) {
               xmlDoc = xmlhttp.responseXML;
               var items = xmlDoc.getElementsByTagName("info");
               //Houston
               var nextValue1 = items[0].getAttribute("toll-free-phone");
               var nextValue2 = items[0].getAttribute("city-one");
               var nextValue3 = items[0].getAttribute("houston-phone");

               document.getElementById("phone1").innerHTML = nextValue1;
               document.getElementById("city1").innerHTML = nextValue2;
               document.getElementById("houston1").innerHTML = nextValue3;
           }
       }

       //Alert window for Submit Button
       function submitAlert()
       {
           alert("This site says... \nThank you for submitting a delivery request. We are more than happy to server you. An invoice email has been sent to the email address in your file");
       }

       //Alert window for Create Account Button
      // function createAccountAlert()
      // {
      //     alert("This site says... \nThank you for creating an account with us. We have sent you an email with details");
      // }

       //Alert window for email existing in system
       function Emailpresent()
       {
           alert('This site says...\n Your Access Code has been sent to the email address in file');
           window.location.href = "Accounts3.aspx";
       }

       //Alert window for Email not existing in system
       function EmailNotpresent()
       {
           alert('This site says...\n Sorry. Your Account email cannot be verified');
           window.location.href = "Accounts3.aspx";
           
       }
</script>
</head>
<body onload="loadXMLDoc()">
    <form id="form1" runat="server">

  <!--website banner with links to pages -->
    <div>
   <img src="Images\title.JPG" alt="Texas Speed Delivery" width="100%" height="250px"/>                     
    <table border="1" width="100%" height="60px" bgcolor="blue">    
        <tr>
        <td><a href="Default.aspx"><font size="5px" color="white"><center><u>Home</u></center></font></a></td>
        <td><a href="aboutUs.aspx" target="_blank"><font size="5px" color="white"><center><u>About Us</u></center></font></a></td>
        <td><a href="Services.aspx"><font size="5px" color="white"><center><u>Services</u></center></font></a></td>
        <td><a href="Accounts.aspx"><font size="5px" color="white"><center><u>Accounts</u></center></font></a></td>
        <td><a href="ContactUs.aspx"><font size="5px" color="white"><center><u>Contact Us</u></center></font></a></td>
        <td><a href="Resources.aspx"><font size="5px" color="white"><center><u>Resources</u></center></font></a></td>
        <td><a href="ServiceAreas.aspx"><font size="5px" color="white"><center><u>Service Areas</u></center></font></a></td>
     </tr>
    </table>
      <hr />
        </div>

        <!--Left side contact Us and Credit card information imagess -->

      <div>
          <div class="service1">
            <h1 align="center"><font color="Blue">Contact Us</font></h1>
        <p align="center"><font font-style="Times New Roman" size="5px" color="white"> &nbsp; Professional deliverymen providing <br/> &nbsp; solutions for Texans 24 hours a day!   &nbsp;</font></p>
            <h2 align="center"><font color="Indigo" size="5px">Toll Free</font></h2>
            <h2 align="center" id="phone1"><font color="white" size="5px"></font></h2>
            <h2 align="center" id="city1"><font color="white" size="5px"></font></h2>
            <h2 align="center" id="houston1"><font color="white" size="5px"></font></h2>
            <h3 align="center"><font color="Indigo" size="5px">Email</font></h3>
            <p align="center"><font color="white" size="5px"><u>customer-service@tsd.com</u></font></p>
           </div>
            <img src='Images/Credit.jpg' alt="Ads Ads Ads" width="20%" height="450px"/>
      </div>
             <div id="forgotPwdPage" runat="server">
                <asp:Table ID="Table3" Caption="Recover Password" HorizontalAlign="Left" BorderStyle="Inset" BorderWidth="2" width="60%" height="100px" runat="server">
                <asp:TableRow>
                    <asp:TableCell> 
                        <asp:Label ID="Label12" runat="server" Text="Email Address"></asp:Label>
                        <font color="red">*</font>
                        <asp:TextBox ID="TextBox10" AutoPostBack="true" OnTextChanged="MyFunction" width="35%" height="30px" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator runat="server" ForeColor="Red" ID="RequiredFieldValidator2" ErrorMessage="Please enter Email Address" ControlToValidate="TextBox10"></asp:RequiredFieldValidator> 
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Please enter Email Address" ControlToValidate="TextBox10" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>

                        <asp:Button ID="Button4" runat="server" Text="Recover Password" OnClick="recoverPwd" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                    <asp:TableCell>
                        <asp:LinkButton ID="LinkButton2" onClick="gettoAccounts" runat="server">Go Back to Accounts Page</asp:LinkButton>
                    </asp:TableCell>
                    </asp:TableRow>
            </asp:Table>

        </div>
         </form>
    </body>
 </html>
