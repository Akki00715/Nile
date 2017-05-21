using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using System.Web.Security;
using System.Data;

public partial class UserProfile : System.Web.UI.Page
{
    BL_PostLogin objLogin = new BL_PostLogin();
    BL_ErrorLogs objError = new BL_ErrorLogs();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                InsertUserLocation();
                GetProfileImage();
                GetUserProfile();
                GetFollowingFollowersCount();
            }
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }        
    }

    public void InsertUserLocation()
    {
        try
        {
            string UserId = Session["UserDetails"].ToString();
            objLogin.Userid = new Guid(UserId);
            objLogin.CallGeoLocationAPI();
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
    }

    public void GetProfileImage()
    {
        try
        {
            string UserId = Session["UserDetails"].ToString();
            objLogin.Userid = new Guid(UserId);
            if (string.IsNullOrEmpty(objLogin.GetProfileImage().Rows[0]["ProfileImage"].ToString()))
            {
                IprofileImage.ImageUrl= "../Includes/images/UserProfile/Anonymous-Profile-Pic.jpg";
            }
            else
            {
                byte[] bytes = (byte[])objLogin.GetProfileImage().Rows[0]["ProfileImage"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                IprofileImage.ImageUrl = "data:image/png;base64," + base64String;
            }
            
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
            IprofileImage.ImageUrl = "../Includes/images/UserProfile/Anonymous-Profile-Pic.jpg";
        }
    }

    public void GetUserProfile()
    {
        try
        {
            DataTable dtUserProfile = new DataTable();
            dtUserProfile = objLogin.GetUserProfile();
            lblArtistName.Text = dtUserProfile.Rows[0]["ArtistName"].ToString();
            lblName.Text = dtUserProfile.Rows[0]["FirstName"].ToString() + " " + dtUserProfile.Rows[0]["LastName"].ToString();
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }        
    }

    public void GetFollowingFollowersCount()
    {
        try
        {
            DataSet dtUserProfile = new DataSet();
            dtUserProfile = objLogin.GetFollowingFollowersCount();
            lblFollowing.Text = dtUserProfile.Tables[0].Rows[0]["FollowingCount"].ToString();
            lblFollowers.Text = dtUserProfile.Tables[1].Rows[0]["FollowersCount"].ToString();
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }        
    }
}