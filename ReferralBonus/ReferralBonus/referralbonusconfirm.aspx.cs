using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;


namespace ReferralBonus
{
    public partial class referralbonusconfirm : System.Web.UI.Page
    {
        public string encryptedval, email, u_id, Emp_Firstname, Emp_Lastname, Emp_Email, Emp_Phone, Ref_Firstname, Ref_Lastname, Ref_Email, Ref_Phone, Ref_Notes, Resume_filename;
        public int retvalue;
        protected void Page_Load(object sender, EventArgs e)
        {
            encryptedval = Request.QueryString["ref"];
            
            //Check if encrypted text is in multiples of 4                   
            int mod4 = encryptedval.Length % 4;            
            if (mod4 > 0)
            {
                retvalue = 1;  //Invalid Link     
            }
            else
            {
                //Decrypt the encrypted text
                string key = "madhura";
                email = this.Decrypt(encryptedval, key);                          
                if (email == "Invalid Link")
                {
                    retvalue = 1; //Invalid Link
                }
                else
                {
                    // if decrypted text is valid and link is clicked within 48 hours, update flag and send email to recruiter 
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = ConfigurationManager.ConnectionStrings["dataconnection"].ToString();

                    SqlParameter uid, retval;// emailsenddt, emailsendflag; 
                    SqlCommand cmd = new SqlCommand("Verificationcomplete", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    con.Open();
              
                    uid = new SqlParameter("@uid", email);
                    retval = new SqlParameter("@retval", "");

                    uid.Direction = ParameterDirection.Input;
                    retval.Direction = ParameterDirection.ReturnValue;

                    uid.DbType = DbType.String;
                    retval.DbType = DbType.String;

                    cmd.Parameters.Add(uid);
                    cmd.Parameters.Add(retval);


                    cmd.ExecuteNonQuery();
                    retvalue = (int)cmd.Parameters["@retval"].Value;
                 
                }
            }
        }

        private string Decrypt(string cipherText, string EncryptionKey)
        {
            try {
                byte[] cipherBytes = Convert.FromBase64String(cipherText);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                        {
                            cs.Write(cipherBytes, 0, cipherBytes.Length);
                            cs.Close();
                        }
                        cipherText = Encoding.Unicode.GetString(ms.ToArray());
                    }
                }
            }
            catch (Exception e)
            {               
                return "Invalid Link";
            }
            return cipherText;
        }


        protected void mail(string email)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["dataconnection"].ToString();

            SqlParameter u_id;
            SqlCommand cmd = new SqlCommand("getdetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();

            u_id = new SqlParameter("@uid", email);         
            u_id.Direction = ParameterDirection.Input;
            u_id.DbType = DbType.String;      
            cmd.Parameters.Add(u_id);

            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    Emp_Firstname = dr[0].ToString();
                    Emp_Lastname = dr[1].ToString();
                    Emp_Email = dr[2].ToString();
                    Emp_Phone = dr[3].ToString();
                    Ref_Firstname = dr[4].ToString();
                    Ref_Lastname = dr[5].ToString();
                    Ref_Email = dr[6].ToString();
                    Ref_Phone = dr[7].ToString();
                    Ref_Notes = dr[8].ToString();
                    Resume_filename = dr[9].ToString();
                }
            }

            Response.Write("A referral candidate has been submitted on Acrocorp.com");
            Response.Write("<br />");
            Response.Write("<br />");
            Response.Write("Referred Candidate:");
            Response.Write("<br />");
            Response.Write("Name:" +Ref_Lastname+","+Ref_Firstname);
            Response.Write("<br />");
            Response.Write("Email:" + Ref_Email);
            Response.Write("<br />");
            Response.Write("Phone:" + Ref_Phone);
            Response.Write("<br />");
            Response.Write("<br />");
            Response.Write("Referred By:");
            Response.Write("<br />");
            Response.Write("Name:" + Emp_Lastname + "," + Emp_Firstname);
            Response.Write("<br />");
            Response.Write("Email:" + Emp_Email);
            Response.Write("<br />");
            Response.Write("Phone:" + Emp_Phone);
            Response.Write("<br />");
            Response.Write("Notes:" + Ref_Notes);


            //send recruiter email
            /*
            try
            {
                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add("recruitingmgmt@acrocorp.com");
                mailMessage.From = new MailAddress("no-reply@inhouse.acrocorp.com");
                mailMessage.Subject = "Referral Submission (Acrocorp.com)";
                mailMessage.Body = "A referral candidate has been submitted on Acrocorp.com \n\n Referred Candidate:\n Name:"+Ref_Lastname+","+Ref_Firstname +"\n Email:"+Ref_Email+"\n Phone:"+Ref_Phone+ " \n\n Referred By:\n Name:" + Emp_Lastname + "," + Emp_Firstname + "\n Email:" + Emp_Email + "\n Phone:" + Emp_Phone + "\n Notes:" +Ref_Notes;
                mailMessage.Attachments.Add(new Attachment(Server.MapPath("c:/Resume/"+ Resume_filename)));
                SmtpClient smtpClient = new SmtpClient("smtp.your-isp.com");
                smtpClient.Send(mailMessage);
                Response.Write("E-mail sent!");
            }
            catch (Exception ex)
            {
                Response.Write("Could not send the e-mail - error: " + ex.Message);
               
            }*/
        }





    
    }
}