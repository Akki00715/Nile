using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using BusinessLayer;

public partial class ChangePassword : System.Web.UI.Page
{
    BL_ErrorLogs objError = new BL_ErrorLogs();
    protected void Page_Load(object sender, EventArgs e)
    {       

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (Session["UserDetails"] != null)
            {
                string UserId = Session["UserDetails"].ToString();
                MembershipUser user = Membership.GetUser(new Guid(UserId));
                if (user.ChangePassword(txtCurrentPassword.Text, txtNewPassword.Text))
                {
                    MessageBox.Show("Password Updated. Please Login.");
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    MessageBox.Show("Incorrect Current Password.");
                }
            }
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
        
    }
}