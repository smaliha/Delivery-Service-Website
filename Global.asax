<%@ Application Language="C#" %>
<%@Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        //Building a list of user objects

        Application["allUsersList"] = new List<User>();
        List<User> allUsersList = new List<User>();
        Application["AllDeliveryDetails"] = new List<DeliveryDetails>();
        List<DeliveryDetails> allDeliveryDetails = new List<DeliveryDetails>();

        SqlConnection conn = new SqlConnection("Data Source=dcm.uhcl.edu; Initial Catalog=c432016sp01syedam;User id= syedam; Password= 1409513; Asynchronous Processing=true");
        String theStatement = "SELECT * FROM syedam_WADsp16_User";
        SqlCommand sqlcommand = new SqlCommand(theStatement, conn);
        

        try
        {
            conn.Open();
            SqlDataReader sqlReader = sqlcommand.ExecuteReader();
            sqlcommand.BeginExecuteNonQuery();

            while (sqlReader.Read())
            {
                User aUser = new User();
                aUser.accessCode = (int)sqlReader["access_code"];
                aUser.fullName = (string)sqlReader["full_name"];
                
                aUser.company = (string)sqlReader["company"];
                aUser.mailingAddress = (string)sqlReader["mailing_address"];
                aUser.emailAddress = (string)sqlReader["email_address"];
                aUser.phoneNumber = (string)sqlReader["phone_number"];

                allUsersList.Add(aUser);
                Application["AllUsersList"] = allUsersList;
               
            }
        }
        catch
        {
            
        }

        theStatement = "SELECT * FROM syedam_WADsp16_deliverydetails d, syedam_WADsp16_User u where d.access_code = u.access_code;";
        sqlcommand = new SqlCommand(theStatement, conn);

        try
        {
            conn.Open();
            SqlDataReader sqlReader = sqlcommand.ExecuteReader();
            sqlcommand.BeginExecuteNonQuery();

            while (sqlReader.Read())
            {
                User aUser = new global::User();
                DeliveryDetails delivery = new DeliveryDetails();
                DateTime obj = new DateTime();
                obj = DateTime.Now;
                delivery.accessCode = (int)sqlReader["access_code"];
                delivery.requestDate = obj;

                delivery.pickupAddress = (string)sqlReader["pick_up_address"];
                delivery.recipientAddress = (string)sqlReader["recipient_address"];
                delivery.recipientPhone = (string)sqlReader["recipient_phone"];
                delivery.description = (string)sqlReader["description"];

                aUser.deliveryDetailsList.Add(delivery);
                Application["AllUsersList"] = allUsersList;

            }
        }
        catch
        {

        }
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
