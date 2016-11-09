using System;
using System.Text;

using System.Web.UI.WebControls;

namespace ReferralBonus
{
    public partial class referralbonus : System.Web.UI.Page
    {

        public Boolean isSubmit;
        public int retcode;
        protected void Page_Load(object sender, EventArgs e)
        {
            isSubmit = true;


           if (!IsPostBack && isSubmit)
            {

                Response.Write("hello");

                FillCapctha();
                DataBind();
                Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
            }
           

        }

        protected void ValidateFileSize(object sender, ServerValidateEventArgs e)
        {

            decimal size = Math.Round(((decimal)FileUpLoad1.PostedFile.ContentLength / (decimal)1024), 2);
            Response.Write(size);
        
            if (size >= 2000)
            {
                CustomValidator3.ErrorMessage = "File size must not exceed 2MB.";
                e.IsValid = false;
            }
            else
            {
                e.IsValid = true;
            }

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            FillCapctha();
            DataBind();
        }
         public void FillCapctha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                    captcha.Append(combination[random.Next(combination.Length)]);
                Session["captcha"] = captcha.ToString();
                Response.Write(Session["captcha"]);
                imgCaptcha.ImageUrl = "Generatecaptcha.aspx?" + DateTime.Now.Ticks.ToString();
            }
            catch
            {

                throw;
            }
        }

        protected void Page_PreRender(object sender, EventArgs e)

    {

        ViewState["CheckRefresh"] = Session["CheckRefresh"];

    }

    protected void Button1_Click(object sender, EventArgs e)
        {
            
                                          
            if (!Page.IsValid)
            {
                return;
            }
            else
            {
                if (FileUpLoad1.HasFile)
                {
                    //save file with row_id prefix
                    Session["Filename"] = FileUpLoad1.FileName;
                    FileUpLoad1.SaveAs("c:\\Resume\\" + FileUpLoad1.FileName);
                }
                if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())

                {
                    Session["CheckRefresh"] = Server.UrlDecode(System.DateTime.Now.ToString());
                    isSubmit = true;
                    Server.Transfer("ReferralbonusSubmit.aspx?submit=no", true);
                }


                else

                {
                    isSubmit = false;
                    Server.Transfer("ReferralbonusSubmit.aspx?submit=yes", true);

                }
            }
            /*
            if (!Page.IsValid)
            {
                return;
            }
            else
            {
                if (FileUpLoad1.HasFile)
                {
                    //save file with row_id prefix
                    Session["Filename"] = FileUpLoad1.FileName;
                    FileUpLoad1.SaveAs("c:\\Resume\\" + FileUpLoad1.FileName);
                }
                Session["RequestValue"] = Guid.NewGuid();
                Server.Transfer("ReferralbonusSubmit.aspx?Request=" + Session["RequestValue"], true);
            }*/
        }
    
    }
}