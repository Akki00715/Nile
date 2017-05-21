using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BusinessLayer;

public partial class ForgotPassword : System.Web.UI.Page
{
    BL_Registration objRegistration = new BL_Registration();
    BL_ErrorLogs objError = new BL_ErrorLogs();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnConfirmEmail_Click(object sender, EventArgs e)
    {
        try
        {
            MembershipUser user = Membership.GetUser(txtEmail.Text.Trim());
            if (user.UserName == txtEmail.Text.Trim())
            {
                string Userid = user.ProviderUserKey.ToString();
                objRegistration.Email = user.UserName;
                objRegistration.UserPassword = user.ResetPassword();
                int Result = objRegistration.SendForgotPasswordEmail();
                if (Result > 0)
                {
                    MessageBox.Show("Email with New passsword send to the Email ID registered");
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    MessageBox.Show("Something went wrong.Please Try again");
                }
            }
            else
            {
                MessageBox.Show("Email Id doesnt exist with us");
            }
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }

    }
}