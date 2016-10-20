using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;

public partial class Accounts : System.Web.UI.Page
{
    //User aUser = new User();
    int found = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //I have an account radio checked . .
    public void RadioButton1_Checked(object sender, EventArgs e)
    {
        login_radio.Visible = true;
        createAcc_radio.Visible = false;
    }

    // I dont have an account radio checked . . 
    protected void RadioButton2_Checked(object sender, EventArgs e)
    {
        login_radio.Visible = false;
        createAcc_radio.Visible = true;
    }

    //Log in Button functionality . . 
    protected void logInButton(object sender, EventArgs e)
    {
        List<User> allUsersList = Application["AllUsersList"] as List<User>;
        //User aUser = new User();
        foreach (User user in allUsersList)
        {
            if (user.emailAddress == this.TextBox1.Text)
            {
                //foreach(var aUser in allUsersList)
                //{ 
                Session["currentuser"] = user;
                //} 
                Response.Redirect("Accounts2.aspx");
            }
            else
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "UserNotpresent();", true);

            }
        }
    }

    //Password restore link to Accounts 3 page
    protected void forgotPwd(object sender, EventArgs e)
    {
        Response.Redirect("Accounts3.aspx");
    }



    //Access code random number generation . . 
    public void random_generate(object sender, EventArgs e)
    {
        Random generator = new Random();
        int r = generator.Next(111111, 999999);
        String x = r.ToString();
        this.TextBox8.Text = x;
    }

    //Go back to Accounts page .. 
    protected void goback(object sender, EventArgs e)
    {
        //this.RadioButton1.Checked = true;
        //this.login_radio.Visible = true;
        //this.createAcc_radio.Visible = false;
        Response.Redirect("Accounts.aspx");
    }

    //Create Account functionality
    protected void createAccount(object sender, EventArgs e)
    {

        List<User> allUsersList = Application["AllUsersList"] as List<User>;
        if ((allUsersList == null))
        {
            //allUsersList = new List<global::User>();
            //User aUser = new User();
            //aUser.fullName = this.TextBox3.Text;
            //aUser.company = this.TextBox4.Text;
            //aUser.mailingAddress = this.TextBox5.Text;
            //aUser.phoneNumber = this.TextBox6.Text;
            //aUser.emailAddress = this.TextBox7.Text;
            //aUser.accessCode = Convert.ToInt32(this.TextBox9.Text);

            //allUsersList.Add(aUser);
            //Application["AllUsersList"] = allUsersList;
            //System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "myFun();", true);

        }

        foreach (User user in allUsersList)
        {
            if (user.emailAddress == this.TextBox7.Text)
            {

                System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "Userpresent();", true);
                //MessageBox.Show("Your email Address is already registered in our database. Please login");
                //Response.Redirect("Accounts.aspx");
            }
            else
            {
                found = 2;
            }
        }
        if (found == 2)
        {
            User aUser = new User();
            aUser.fullName = this.TextBox3.Text;
            aUser.company = this.TextBox4.Text;
            aUser.mailingAddress = this.TextBox5.Text;
            aUser.phoneNumber = this.TextBox6.Text;
            aUser.emailAddress = this.TextBox7.Text;
            aUser.accessCode = Convert.ToInt32(this.TextBox9.Text);

            SqlConnection conn = new SqlConnection("Data Source=dcm.uhcl.edu; Initial Catalog=c432016sp01syedam;User id= syedam; Password= 1409513; Asynchronous Processing=true");
            String theStatement = "INSERT INTO syedam_WADsp16_User VALUES ('" + this.TextBox9.Text + " ',' " + this.TextBox3.Text + " ',' " + this.TextBox4.Text + " ',' " + this.TextBox5.Text + " ',' " + this.TextBox6.Text + " ',' " + this.TextBox7.Text + " ')";
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

            allUsersList.Add(aUser);
            Application["AllUsersList"] = allUsersList;
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "myFun();", true);

            String msgTo = this.TextBox7.Text;
            String msgSubject = "Texas Delivery Service - Registration Confirmation";
            String msgBody = "Valued Customer " + this.TextBox3.Text +Environment.NewLine + ",\n Thank you for registering with Texas Delivery Service. You can now start using your account to request us to deliver your goods." +Environment.NewLine+ " Looking forward to doing business with you."+Environment.NewLine+"\n Thank You again for keeping trust on us. "+Environment.NewLine+"\n Sincerely,"+Environment.NewLine+"\n Texas Delivery Service-Security Team";
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
            allUsersList = new List<global::User>();
            User aUser = new User();
            aUser.fullName = this.TextBox3.Text;
            aUser.company = this.TextBox4.Text;
            aUser.mailingAddress = this.TextBox5.Text;
            aUser.phoneNumber = this.TextBox6.Text;
            aUser.emailAddress = this.TextBox7.Text;
            aUser.accessCode = Convert.ToInt32(this.TextBox9.Text);

            
            SqlConnection conn = new SqlConnection("Data Source=dcm.uhcl.edu; Initial Catalog=c432016sp01syedam;User id= syedam; Password= 1409513; Asynchronous Processing=true");
            String theStatement = "INSERT INTO syedam_WADsp16_User VALUES('" + this.TextBox9.Text + " ',' " + this.TextBox3.Text + " ',' " + this.TextBox4.Text + " ',' " + this.TextBox5.Text + " ',' " + this.TextBox6.Text + " ',' " + this.TextBox7.Text + " ')";
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

            allUsersList.Add(aUser);
            Application["AllUsersList"] = allUsersList;
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "myFun();", true);


            //Send email after registering user. . 
            String msgTo = this.TextBox7.Text;
            String msgSubject = "Texas Delivery Service - Registration Confirmation";
            String msgBody = "Valued Customer " + this.TextBox3.Text + Environment.NewLine + ",\n Thank you for registering with Texas Delivery Service. You can now start using your account to request us to deliver your goods." + Environment.NewLine + " Looking forward to doing business with you." + Environment.NewLine + "\n Thank You again for keeping trust on us. " + Environment.NewLine + "\n Sincerely," + Environment.NewLine + "\n Texas Delivery Service-Security Team";
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
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(System.Web.UI.Page), "Script", "myFun();", true);
        }
    }

}
       