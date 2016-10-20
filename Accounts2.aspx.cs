using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Windows.Forms;
using System.Net.Mail;
using System.Net;
using System.Data.SqlClient;

public partial class Accounts2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if(Session["currentuser"] != null)
       { 
        User aUser = (User)Session["currentuser"];
        Label1.Text = "Welcome " + aUser.fullName;
       }
    }
    protected void btn_action(object sender, EventArgs e)
    {
        string message = "This site says...";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("alert('");
        sb.Append(message);
        sb.Append(" ');");
        ClientScript.RegisterOnSubmitStatement(this.GetType(), "alert", sb.ToString());
    }

    //Saving session and logging out 
    protected void LogOutButton(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Accounts.aspx");
    }


    //Submit button, create a new object for delivery details and attach to the user 
    protected void submitAlert(object sender, EventArgs e)
    {
        if (Session["currentuser"] != null)
      {
     
            User aUser = (User)Session["currentuser"];
            List<User> allUsersList = Application["AllUsersList"] as List<User>;
        
        for (int i = 0; i < allUsersList.Count; i++)
        {
            if (allUsersList[i].emailAddress == aUser.emailAddress)
            {                
                DeliveryDetails newdelivery = new DeliveryDetails();
                newdelivery.accessCode = aUser.accessCode;
                newdelivery.pickupAddress = this.align.Text;
                newdelivery.recipientAddress = this.align1.Text;
                newdelivery.recipientPhone = this.align2.Text;
                newdelivery.description = this.align3.Text;
                newdelivery.requestDate = DateTime.Now;
                //DateTime obj = new DateTime();
                //obj = DateTime.Now;

                SqlConnection conn = new SqlConnection("Data Source=dcm.uhcl.edu; Initial Catalog=c432016sp01syedam;User id= syedam; Password= 1409513; Asynchronous Processing=true");
                //String theStatement = "INSERT INTO syedam_WADsp16_deliverydetails VALUES('" +newdelivery.accessCode+" ',' "+ obj + " ',' "+ this.align.Text + " ',' " + this.align1.Text + " ',' " + this.align2.Text + " ',' " + this.align3.Text + " ')";
             
                String theStatement = "INSERT INTO syedam_WADsp16_deliverydetails VALUES('" + newdelivery.requestDate + " ',' " + newdelivery.pickupAddress + " ',' " + newdelivery.recipientAddress + " ',' " + newdelivery.recipientPhone + " ',' " + newdelivery.description + " ')";
                SqlCommand sqlcommand = new SqlCommand(theStatement, conn);
                try
                {
                    conn.Open();
                    sqlcommand.BeginExecuteNonQuery();
                }
                finally
                {
                    conn.Close();
                }


                aUser.deliveryDetailsList.Add(newdelivery);
                Application["AllUsersList"] = allUsersList;
          

                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "newRequest();", true);   
                //Send email after registering user. . 
                String msgTo = allUsersList[i].emailAddress;
                String msgSubject = "Texas Delivery Service - New Request Confirmation";
                String msgBody = "Valued Customer ,\n You have requested a new delivery. Details shown below: \n Pickup address: "+newdelivery.pickupAddress+"\n Recipient address: "+newdelivery.recipientAddress+"\n Description: "+newdelivery.description+"\n Please note that any modifications made after 2 hours of submission of the original request shall be rejected. \n Sincerely, \n Texas Delivery Service Team";
                MailMessage mailObj = new MailMessage();
                mailObj.Body = msgBody;
                mailObj.From = new MailAddress("smaliha.k@gmail.com", "Texas Delivery Service");
                mailObj.To.Add(new MailAddress(msgTo));
                mailObj.Subject = msgSubject;
                mailObj.IsBodyHtml = true;
                SmtpClient SMTPClient = new System.Net.Mail.SmtpClient();
                SMTPClient.Host = "smtp.gmail.com";
                SMTPClient.Port = 587;
                SMTPClient.Credentials = new NetworkCredential("smaliha.k@gmail.com", "Yataziroon786");
                SMTPClient.EnableSsl = true;
                try { SMTPClient.Send(mailObj); }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "newRequest();", true);    
            }
        }
     }
     
        this.align.Text = "";
        this.align1.Text = "";
        this.align2.Text = "";
        this.align3.Text = "";

        //Response.Write("<script>alert('Thank you for registering. You can now log in');</script>");

    }
}