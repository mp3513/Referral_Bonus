using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReferralBonus
{
    public partial class ReferralbonusSubmit : System.Web.UI.Page
    {
        public string Emp_Firstname, Emp_Lastname, Emp_Email, Emp_Phone, Ref_Firstname, Ref_Lastname, Ref_Email, Ref_Phone, Ref_Notes, uid, UserIP, resume,request;
        public int row_id;
        public Boolean isSubmit;

        protected void Page_Load(object sender, EventArgs e)
        {
            request = Request.QueryString["submit"];
            Response.Write(request+ "--");
           // Response.Write(Session["RequestValue"]);
           // if (Session["RequestValue"].ToString() == request)
           // {
           //     isSubmit = true;
           // }
           // else
          ////  {
         //       isSubmit = false;
         //   }

            if (!IsPostBack && request == "no")
            {
                //get user's IP Address
                if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
                {
                    UserIP = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();
                }
                else if (HttpContext.Current.Request.UserHostAddress.Length != 0)
                {
                    UserIP = HttpContext.Current.Request.UserHostAddress;
                }

                Ref_Firstname = Request.Form["TextBox1"];
                Ref_Lastname = Request.Form["TextBox2"];
                Ref_Email = Request.Form["TextBox3"];
                Ref_Phone = Request.Form["TextBox4"];
                Emp_Firstname = Request.Form["TextBox7"];
                Emp_Lastname = Request.Form["TextBox8"];
                Emp_Email = Request.Form["TextBox9"];
                Emp_Phone = Request.Form["TextBox10"];
                resume = Session["Filename"].ToString();
                //Response.Write("hello");
                //Response.Write(resume);

                Ref_Notes = Request.Form["TextArea1"];

                //insert new referral and employee details       
                Insert(Emp_Firstname, Emp_Lastname, Emp_Email, Emp_Phone, Ref_Firstname, Ref_Lastname, Ref_Email, Ref_Phone, Ref_Notes, UserIP);

            }
        }

        private void Insert(string Emp_Firstname, string Emp_Lastname, string Emp_Email, string Emp_Phone, string Ref_Firstname, string Ref_Lastname, string Ref_Email, string Ref_Phone, string Ref_Notes , string UserIP)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dataconnection"].ToString();

            SqlParameter efname, elname, eemail, ephone, rfname, rlname, remail, rphone, rnotes, verificationflag, filename, uIP;
            SqlCommand cmd = new SqlCommand("InsertRefferedEmp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();

            efname = new SqlParameter("@efname", Emp_Firstname);
            elname = new SqlParameter("@elname", Emp_Lastname);
            eemail = new SqlParameter("@eemail", Emp_Email);
            ephone = new SqlParameter("@ephone", Emp_Phone); 
            rfname = new SqlParameter("@rfname", Ref_Firstname);
            rlname = new SqlParameter("@rlname", Ref_Lastname);
            remail = new SqlParameter("@remail", Ref_Email);
            rphone = new SqlParameter("@rphone", Ref_Phone);
            rnotes = new SqlParameter("@rnotes", Ref_Notes);
            verificationflag = new SqlParameter("@verificationflag",false);
            filename = new SqlParameter("@filename",resume);
            uIP = new SqlParameter("@userIP", UserIP);

            efname.Direction = ParameterDirection.Input;
            elname.Direction = ParameterDirection.Input;
            eemail.Direction = ParameterDirection.Input;
            ephone.Direction = ParameterDirection.Input;
            rfname.Direction = ParameterDirection.Input;
            rlname.Direction = ParameterDirection.Input;
            remail.Direction = ParameterDirection.Input;
            rphone.Direction = ParameterDirection.Input;
            rnotes.Direction = ParameterDirection.Input;
            verificationflag.Direction = ParameterDirection.Input;
            filename.Direction = ParameterDirection.Input;
            uIP.Direction = ParameterDirection.Input;

            efname.DbType = DbType.String;
            elname.DbType = DbType.String;
            eemail.DbType = DbType.String;
            ephone.DbType = DbType.String;
            rfname.DbType = DbType.String;
            rlname.DbType = DbType.String;
            remail.DbType = DbType.String;
            rphone.DbType = DbType.String;
            rnotes.DbType = DbType.String;
            verificationflag.DbType = DbType.Boolean;
            filename.DbType = DbType.String;
            uIP.DbType = DbType.String;

            cmd.Parameters.Add(efname);
            cmd.Parameters.Add(elname);
            cmd.Parameters.Add(eemail);
            cmd.Parameters.Add(ephone);
            cmd.Parameters.Add(rfname);
            cmd.Parameters.Add(rlname);
            cmd.Parameters.Add(remail);
            cmd.Parameters.Add(rphone);            
            cmd.Parameters.Add(rnotes);        
            cmd.Parameters.Add(verificationflag);
            cmd.Parameters.Add(filename);
            cmd.Parameters.Add(uIP);

            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    uid = dr[0].ToString();            
                }
            }
            
            //encrypt unique id of this record       
            string key = "madhura";                                             
            string encryptedemail = Encrypt(uid, key);

            //send encrypted uid confirmation link to employee email address.
           // mail(encryptedemail);             
        }

        private void mail(string encryptedemail)
        {
            Response.Write("Thank you for sending the referral.");
            Response.Write("<br />");
            Response.Write("Click on the following link to complete the process:");
           
            Response.Write("<br />");
            Response.Write("http://localhost:62956/referralbonusconfirm.aspx?ref=" + Server.UrlEncode(encryptedemail));

            
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add(Emp_Email);
                mailMessage.From = new MailAddress("noreply@acro.com");
                mailMessage.Subject = "Referral Submission (Acrocorp.com)";
                mailMessage.Body = "Thank you for sending the referral.Click on the following link to complete the process: \n\n http://localhost:62956/referralbonusconfirm.aspx?ref=" + Server.UrlEncode(encryptedemail);           
                SmtpClient smtpClient = new SmtpClient("smtp.your-isp.com");
                smtpClient.Send(mailMessage);
                Response.Write("E-mail sent!");
            }
            catch (Exception ex)
            {
                Response.Write("Could not send the e-mail - error: " + ex.Message);

            }
        }

        private string Encrypt(string clearText, string EncryptionKey)
        {

            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

    }
}