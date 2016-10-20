<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
   
<head runat="server">
    <link href="StyleSheet.css" type="text/css" rel="stylesheet" />
    <title>Texas Speed Delivery</title>                 <!--Title of page -->
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

                //Austin
                //var nextValue4 = items[0].getAttribute("toll-free-phone");
                var nextValue5 = items[0].getAttribute("city-two");
                var nextValue6 = items[0].getAttribute("austin-phone");

                //document.getElementById("phone2").innerHTML = nextValue4;
                document.getElementById("city2").innerHTML = nextValue5;
                document.getElementById("austin1").innerHTML = nextValue6;

                //Dallas
                //var nextValue7 = items[0].getAttribute("toll-free-phone");
                var nextValue8 = items[0].getAttribute("city-three");
                var nextValue9 = items[0].getAttribute("dallas-phone");

                //document.getElementById("phone3").innerHTML = nextValue7;
                document.getElementById("city3").innerHTML = nextValue8;
                document.getElementById("dallas1").innerHTML = nextValue9;

                //El Paso
                //var nextValue10 = items[0].getAttribute("toll-free-phone");
                var nextValue11 = items[0].getAttribute("city-four");
                var nextValue12 = items[0].getAttribute("elpaso-phone");

                //document.getElementById("phone4").innerHTML = nextValue10;
                document.getElementById("city4").innerHTML = nextValue11;
                document.getElementById("elpaso1").innerHTML = nextValue12;

                //San antonio
                //var nextValue13 = items[0].getAttribute("toll-free-phone");
                var nextValue14 = items[0].getAttribute("city-five");
                var nextValue15 = items[0].getAttribute("sanantonio-phone");

                //document.getElementById("phone5").innerHTML = nextValue13;
                document.getElementById("city5").innerHTML = nextValue14;
                document.getElementById("sanantonio1").innerHTML = nextValue15;

                //Rio Grande Valley
                //var nextValue16 = items[0].getAttribute("toll-free-phone");
                var nextValue17 = items[0].getAttribute("city-six");
                var nextValue18 = items[0].getAttribute("riogrande-phone");

                //document.getElementById("phone6").innerHTML = nextValue16;
                document.getElementById("city6").innerHTML = nextValue17;
                document.getElementById("riogrande1").innerHTML = nextValue18;

                //Corpus Christi
                //var nextValue19 = items[0].getAttribute("toll-free-phone");
                var nextValue20 = items[0].getAttribute("city-seven");
                var nextValue21 = items[0].getAttribute("corpus-phone");

                //document.getElementById("phone7").innerHTML = nextValue19;
                document.getElementById("city7").innerHTML = nextValue20;
                document.getElementById("corpus1").innerHTML = nextValue21;

                //East Texas
                //var nextValue22 = items[0].getAttribute("toll-free-phone");
                var nextValue23 = items[0].getAttribute("city-eight");
                var nextValue24 = items[0].getAttribute("easttx-phone");

                //document.getElementById("phone8").innerHTML = nextValue22;
                document.getElementById("city8").innerHTML = nextValue23;
                document.getElementById("easttx1").innerHTML = nextValue24;

                //West Texas
                //var nextValue25 = items[0].getAttribute("toll-free-phone");
                var nextValue26 = items[0].getAttribute("city-nine");
                var nextValue27 = items[0].getAttribute("westtx-phone");

                //document.getElementById("phone9").innerHTML = nextValue25;
                document.getElementById("city9").innerHTML = nextValue26;
                document.getElementById("westtx1").innerHTML = nextValue27;
            }
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
            <div class="ContactUs">
                <asp:Table ID="Table1" BackColor="SkyBlue" BorderWidth="2" width="100%" Height="150px" HorizontalAlign="Left" runat="server">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                <asp:Label ForeColor="Indigo" ID="Label1" runat="server" Font-Bold="true" Font-Size="XX-Large" Font-Italic="true" Text="Please Email Us All Your Concerns"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Left">
                <asp:Label ID="Label2" runat="server" Text="Enter your Email Address"></asp:Label>
                <font color="red">*</font>
                <asp:TextBox ID="TextBox1" width="60%" height="40px" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ForeColor="red" ErrorMessage="Please enter Email Address" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Please enter Email Address" ControlToValidate="TextBox1" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                     </asp:TableCell>
                        </asp:TableRow>
                   <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Left">     

                <asp:TextBox ID="TextBox2" TextMode="multiline" Width="80%" Rows="17" runat="server" Text="Type your message here."></asp:TextBox>
                             </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell HorizontalAlign="Center">
                <asp:Button ID="Button1" runat="server" Height ="40px" Text="Submit Message" CausesValidation="true" OnClick="sendMail"/>
                            </asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
            </div>
    </form>
    <!-- ads at the bottom of page-->
            <img src='Images/Credit.jpg' alt="Ads Ads Ads" width="20%"height="450px"/>     
            <img src='Images/courier1.jpg' alt="Ads Ads Ads" width="79%" height="450px"/>
      
</body>
</html>