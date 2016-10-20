using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Windows.Forms;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //Sending email code. . 
    protected void sendMail(object sender, EventArgs e)
    {
        String msgTo = this.TextBox1.Text;
        String msgSubject = "We have received your Message!";
        String msgBody = "Valued Customer,\n Thank you for Contacting us. One of our customer service representatives will be contacting you within the next 24 hours.\n Thank You \n Texas Delivery Service - Customer Service Team";
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
        try
        {
            SMTPClient.Send(mailObj);
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.ToString());
        }
        this.TextBox1.Text = "";
        this.TextBox2.Text = "Enter your text here. ";

    }
}