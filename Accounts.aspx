<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Accounts.aspx.cs" Inherits="Accounts" %>

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

       //Alert window for Recover Password Button
       function recoverPwd()
       {
           alert("This site says... \nYour Access Code has been sent to the email address in file. ");
       }


       //function for create account success
       function myFun()
       {
           alert('Thank you for registering. You can now log in');
           window.location.href = "Accounts.aspx";
       }

       //function for email address existing success
       function Userpresent() {
           alert('Your email Address is already registered in our database. Please login');
           window.location.href = "Accounts.aspx";
       }

       //function for email address not existing
       function UserNotpresent() {
           alert('Your email Address is not registered in our database. Please register');
           window.location.href = "Accounts.aspx";
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
        
        <!-- Window A area for Accounts page for an existing account --> 
       <div id="login_radio" visible="true" runat="server">
        <asp:RadioButton ID="RadioButton1" Checked="true" GroupName="RadioAccounts"  width="30%" Text="I have an existing account" AutoPostBack="true" OnCheckedChanged="RadioButton1_Checked" runat="server" />
        <asp:RadioButton ID="RadioButton2" Checked="false" GroupName="RadioAccounts" width="30%" Text="I do not have an existing account" AutoPostBack="true" OnCheckedChanged="RadioButton2_Checked" runat="server" />
        
                <br />

        <!-- Web controls --> 
            <asp:Table ID="Table1" Caption="Existing account" HorizontalAlign="Left" BorderStyle="Inset" BorderWidth="2" width="60%" height="20%" runat="server">
                <asp:TableRow>
                    <asp:TableCell> 
                        <asp:Label ID="Label1" runat="server" Text="Email Address:"></asp:Label>
                        <font color="red">*</font>
                        <asp:TextBox ID="TextBox1" width="50%" height="30px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="emailField" ForeColor="Red" ErrorMessage="Please enter Email Address" ControlToValidate="TextBox1"></asp:RequiredFieldValidator> 
                        <asp:RegularExpressionValidator ID="emailReg" runat="server" ErrorMessage="Please enter Email Address" ControlToValidate="TextBox1" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>

                        </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Label2" runat="server" Text="Access Code:"></asp:Label>
                        <font color="red">*</font>
                        <asp:TextBox ID="TextBox2" width="45%" height="30px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ForeColor="Red" ErrorMessage="Please enter 6-digit Access Code" ControlToValidate="TextBox2"></asp:RequiredFieldValidator> 
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter 6-digit Access Code" ControlToValidate="TextBox2" ValidationExpression="\d{6}"></asp:RegularExpressionValidator>

                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:LinkButton ID="LinkButton1" width="70%" height="30px" runat="server" OnClick="forgotPwd">Forgot My Access Code</asp:LinkButton>
                        <asp:Button ID="Button1" width="20%" height="25px" runat="server" Text="Log In" OnClick="logInButton"/>
               </asp:TableCell>
               </asp:TableRow>

            </asp:Table>

       </div> 

        
        <!-- Window A area for Accounts page for a new account -->

        <div id="createAcc_radio" visible="false" runat="server">
        
       <!-- Web controls --> 
             <asp:RadioButton ID="RadioButton3" Checked="false" GroupName="RadioAccounts"  width="30%" Text="I have an existing account" AutoPostBack="true" OnCheckedChanged="RadioButton1_Checked" runat="server" />
        <asp:RadioButton ID="RadioButton4" Checked="true" GroupName="RadioAccounts" width="30%" Text="I do not have an existing account" AutoPostBack="true" OnCheckedChanged="RadioButton2_Checked" runat="server" />
        
            <asp:Table ID="Table2" Caption="Create New Account" HorizontalAlign="Left" BorderStyle="Inset" BorderWidth="2" width="80%" height="70px" runat="server">
        
                        <asp:TableRow>
                    <asp:TableCell> 
                        <asp:Label ID="Label3" ForeColor="Violet" runat="server" Text="Apply online to open a new account with us. &nbsp;"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell> 
                        <asp:Label ID="Label4" runat="server" Text="To complete an online application, please fill out the following information and then hit the 'Create Account' button"></asp:Label>
                        </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label5" runat="server" Text="Full Name"></asp:Label>
                        <font color="red">*</font>

                        <asp:TextBox ID="TextBox3" width="30%" height="30px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ErrorMessage="Please enter Full Name" ControlToValidate="TextBox3"></asp:RequiredFieldValidator> 
                        </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label6" runat="server" Text="Company"></asp:Label>

                        <asp:TextBox ID="TextBox4" width="30%" height="30px" runat="server"></asp:TextBox>
                        </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label7" runat="server" Text="Mailing Address"></asp:Label>
                        <font color="red">*</font>

                        <asp:TextBox ID="TextBox5" width="30%" height="30px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ErrorMessage="Please enter Mailing Address" ControlToValidate="TextBox5"></asp:RequiredFieldValidator> 
                        </asp:TableCell>
                </asp:TableRow>

                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label8" runat="server" Text="Phone Number"></asp:Label>
                        <font color="red">*</font>

                        <asp:TextBox ID="TextBox6" width="30%" height="30px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ErrorMessage="Please enter Phone Number" ControlToValidate="TextBox6"></asp:RequiredFieldValidator> 
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Please enter Phone Number" ControlToValidate="TextBox6" ValidationExpression="^[0-9]{3}-[0-9]{3}-[0-9]{4}$"></asp:RegularExpressionValidator>

                       </asp:TableCell>
                </asp:TableRow>

                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label9" runat="server" Text="Email Address"></asp:Label>
                        <font color="red">*</font>

                        <asp:TextBox ID="TextBox7" width="30%" height="30px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ErrorMessage="Please enter Email Address" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter Email Address" ControlToValidate="TextBox7" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                        </asp:TableCell>
                </asp:TableRow>

                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label10" runat="server" Text="Access Code"></asp:Label>
                        <font color="red">*</font>

                        <asp:TextBox ID="TextBox8" BackColor="Black" ForeColor="White" OnInit="random_generate" Enabled="false" Font-Size="Large" width="8%" height="30px" runat="server"></asp:TextBox>
                        </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="Label11" runat="server" Text="Enter Access Code"></asp:Label>
                        <font color="red">*</font>

                        <asp:TextBox ID="TextBox9" width="30%" height="30px" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ErrorMessage="Please enter Access Code" ControlToValidate="TextBox9"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" ID="CompareValidator1" ErrorMessage="Access code must match" type="String" ControlToValidate="TextBox9" ControlToCompare="TextBox8" Operator="Equal" ></asp:CompareValidator>
                        </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                         <asp:Button ID="Button2" width="20%" height="40px" runat="server" Text="Create Account" OnClick="createAccount" />

                        <asp:Button ID="Button3" width="20%" height="40px" runat="server" Text="Back to Accounts" OnClick="goback" CausesValidation="false"/>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
             </div> 
      </form>
    </body>
 </html>