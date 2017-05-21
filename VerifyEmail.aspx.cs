using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;

public partial class VerifyEmail : System.Web.UI.Page
{
    BL_Registration objRegistration = new BL_Registration();
    BL_ErrorLogs objError = new BL_ErrorLogs();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                VerifyEmailId();
            }
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
    }

    public void VerifyEmailId()
    {
        try
        {
            string UserId = objRegistration.Decrypt(Request.QueryString["id"].ToString());
            objRegistration.userid = new Guid(UserId);
            objRegistration.VerifyEmail();
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
    }
}