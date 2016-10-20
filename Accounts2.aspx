<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Accounts2.aspx.cs" Inherits="Accounts2" %>


<!DOCTYPE html>

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
       function submitAlert()
       {
           alert("This site says... \nThank you for submitting a delivery request. We are more than happy to server you. An invoice email has been sent to the email address in your file");
       }

       //New request submitted
       function newRequest()
       {
           alert('This site says...\n Request submitted');
           window.location.href = "Accounts2.aspx";
       }
</script>
</head>
<body onload="loadXMLDoc()">
    <form id="form1" runat="server">
    <div>
   <img src="Images\title.JPG" alt="Texas Speed Delivery" width="100%" height="250px"/>                     <!--website banner-->
    <table border="1" width="100%" height="60px" bgcolor="blue">    <!-- menu bar-->
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
          </div>
            <div class="accounts2">
                <asp:Label ID="Label1" runat="server" width="60%"></asp:Label>

                <asp:LinkButton ID="LinkButton2" runat="server" width="30%" OnClientClick="LogOutButton" PostBackUrl="~/Accounts.aspx" CausesValidation="false">Log Out</asp:LinkButton>
             
               
                <asp:RadioButton ID="RadioButton1" width="30%" Text="New Delivery Request" Checked="true"  GroupName="new account" runat="server" />
                <asp:RadioButton ID="RadioButton2" width="30%" Text="View My Account Details" GroupName="new account" runat="server" />
                <br />
                <asp:Table ID="Table1"  BorderWidth="2" width="80%" Height="100px" HorizontalAlign="Left" BorderStyle="Inset" Caption="New Delivery Details" runat="server">
                    
                    <asp:TableRow>
                        <asp:TableCell CssClass="align" >
                        <asp:Label ID="Label2" runat="server" ForeColor="Violet" Text="Please enter delivery details below &nbsp;"></asp:Label>
                            </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell >
                            <asp:Label ID="Label3" runat="server"  Text ="Pickup Address"></asp:Label>
                            <font color="red">*</font>
                                
                              <asp:TextBox runat="server" ID="align" Width="40%" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="emailField" ForeColor="Red" ErrorMessage="Please enter Pickup Address" ControlToValidate="align"></asp:RequiredFieldValidator> 
                            
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label4" runat="server" Text="Recipient Address"></asp:Label>
                            <font color="red">*</font>
                                                       
                              <asp:TextBox runat="server" ID="align1" Width="40%" Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ForeColor="Red" ErrorMessage="Please enter Recipient Address" ControlToValidate="align1"></asp:RequiredFieldValidator> 
                            
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label5" runat="server" Text="Recipient Phone"></asp:Label>
                            <font color="red">*</font>
                            
                              <asp:TextBox runat="server" ID="align2" Width="40%"  Height="30px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ForeColor="Red" ErrorMessage="Please enter Recipient Phone Number" ControlToValidate="align2"></asp:RequiredFieldValidator> 
                             <asp:RegularExpressionValidator runat="server" ID="RegularExpression1" ErrorMessage="Please enter Recipient Phone Number" ControlToValidate="align2" ValidationExpression="^[0-9]{3}-[0-9]{3}-[0-9]{4}$"></asp:RegularExpressionValidator> 
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="Label6" runat="server" Text="Provide a Description </br>(List Items to Deliver)"></asp:Label>
                            <font color="red">*</font>
                           
                            <asp:TextBox Rows="10" runat="server"  ID="align3" TextMode="MultiLine" Width="40%" Height="50px"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ForeColor="Red" ErrorMessage="Please enter Description" ControlToValidate="align3"></asp:RequiredFieldValidator> 
                               
                        </asp:TableCell>
                         </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center">
                            <asp:Button ID="Button2" runat="server" Text="Submit Request" width="30%" height="35px" OnClick="submitAlert"/>
                        </asp:TableCell>
                    </asp:TableRow>
                   
                </asp:Table>

            </div>
        
    </form>
</body>
</html>