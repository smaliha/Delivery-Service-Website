using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Net.Mail;
using System.Net;

public partial class Accounts3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gettoAccounts(object sender, EventArgs e)
    {
        Response.Redirect("Accounts.aspx");
    }

    protected void recoverPwd(object sender, EventArgs e)
    {
        // User aUser = (User)Session["currentuser"];
        List<User> allUsersList = Application["AllUsersList"] as List<User>;

        foreach (User user in allUsersList)
        {
            if (user.emailAddress == this.TextBox10.Text)
            {
                
                //Send the email to the email address . . 
                String msgTo = this.TextBox10.Text;
                String msgSubject = "We have recovered your Access Code!";
                String msgBody = "Valued Customer, \n Thank You for contacting us. Your access code is 999999 \n Thank You \n Texas Delivery Service - Security Team";
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
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "Emailpresent();", true);
            }
        }
        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "EmailNotpresent();", true);
    }
    //for (int i = 0; i < allUsersList.Count; i++)
    //{
    //    if (allUsersList[i].emailAddress == this.TextBox10.Text)
    //    {
    //        //Response.Write("<script>alert('This site says...\n Your Access Code has been sent to the email address in file');</script>");
    //        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "Emailpresent();", true);
    //    }
    //    else
    //    {
    //        //Response.Write("<script>alert('This site says...\n Sorry. Your Account email cannot be verified');</script>");
    //        System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "EmailNotpresent();", true);
    //    }
    //}

    protected void MyFunction(object sender, EventArgs e)
    {
        List<User> allUsersList = Application["AllUsersList"] as List<User>;

        foreach (User user in allUsersList)
        {
            if (user.emailAddress == this.TextBox10.Text)
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "Emailpresent();", true);
                //Send the email to the email address . . 
                String msgTo = this.TextBox10.Text;
                String msgSubject = "We have recovered your Access Code!";
                String msgBody = "Valued Customer, \n Thank You for contacting us. Your access code is 999999 \n Thank You \n Texas Delivery Service - Security Team";
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
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "EmailNotpresent();", true);
            }
        }


    }
}