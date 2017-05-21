using System;
using System.Web.UI.WebControls;
using BusinessLayer;
using System.Data;
using System.Web.Security;
using System.Configuration;
using System.IO;

public partial class UserProfileDetails : System.Web.UI.Page
{
    //BL_PostLogin objLogin = new BL_PostLogin();
    BL_ErrorLogs objError = new BL_ErrorLogs();
    BL_Registration objRegistration = new BL_Registration();
    BL_PostLogin objPostLogin = new BL_PostLogin();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                if (Session["UserDetails"] != null)
                {
                    getUserProfileDetails();
                }
            }
        }
        catch (Exception ex)
        {

            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }

    }

    public void getUserProfileDetails()
    {
        try
        {
            string UserId = Convert.ToString(Session["UserDetails"]);
            objPostLogin.Userid = new Guid(UserId);
            DataSet dtuserprofile = new DataSet();
            dtuserprofile = objPostLogin.GetUserDetails();
            MembershipUser mu = Membership.GetUser(new Guid(UserId));
            string email = mu.Email;
            if (dtuserprofile.Tables[0].Rows.Count >0)
            {
                txtArtistName.Text = dtuserprofile.Tables[0].Rows[0]["ArtistName"].ToString();
                txtFname.Text = dtuserprofile.Tables[0].Rows[0]["FirstName"].ToString();
                txtLname.Text = dtuserprofile.Tables[0].Rows[0]["LastName"].ToString();
                txtEmailID.Text = email;
                txtMobile.Text = dtuserprofile.Tables[0].Rows[0]["MobileNumber"].ToString();
                ddlGender.SelectedValue = dtuserprofile.Tables[0].Rows[0]["gender"].ToString().Trim();
                txtDate.Text = Convert.ToDateTime(dtuserprofile.Tables[0].Rows[0]["DateOfBirth"]).ToShortDateString();
                byte[] bytes = (byte[])objPostLogin.GetProfileImage().Rows[0]["ProfileImage"];
                string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                AreaImage1.ImageUrl = "data:image/png;base64," + base64String;
            }
            else
            {
                //txtArtistName.Text = dtuserprofile.Tables[0].Rows[0]["ArtistName"].ToString();
                //txtFname.Text = dtuserprofile.Tables[0].Rows[0]["FirstName"].ToString();
                //txtLname.Text = dtuserprofile.Tables[0].Rows[0]["LastName"].ToString();
                txtEmailID.Text = email;
                //txtMobile.Text = dtuserprofile.Tables[0].Rows[0]["MobileNumber"].ToString();
                //ddlGender.SelectedValue = dtuserprofile.Tables[0].Rows[0]["gender"].ToString().Trim();
                //txtDate.Text = Convert.ToDateTime(dtuserprofile.Tables[0].Rows[0]["DateOfBirth"]).ToShortDateString();
                //byte[] bytes = (byte[])objPostLogin.GetProfileImage().Rows[0]["ProfileImage"];
                //string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                AreaImage1.ImageUrl = "../Includes/images/UserProfile/Anonymous-Profile-Pic.jpg";
            }
        }
        catch (Exception ex)
        {

            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            //Get userid from session
            string UserId = Convert.ToString(Session["UserDetails"]);
            MembershipUser mu = Membership.GetUser(new Guid(UserId));
            string userId = mu.ProviderUserKey.ToString();
            objRegistration.userid = new Guid(userId);
            objPostLogin.Userid = new Guid(userId);

            objRegistration.ArtistName = txtArtistName.Text;
            objRegistration.FirstName = txtFname.Text;
            objRegistration.LastName = txtLname.Text;
            objRegistration.Gender = ddlGender.SelectedValue;
            //objRegistration.DateOfBirth = txtDate.Text;

            // Get date from hidden field or textbox
            if (string.IsNullOrEmpty(txtDate.Text))
            {
                objRegistration.DateOfBirth = GetFormatedDate(hdnDate.Value).ToString();
            }
            else
            {
                objRegistration.DateOfBirth = GetFormatedDate(txtDate.Text).ToString();
            }            
            objRegistration.InsertRegisterUserDetails();
            objRegistration.Mobile = txtMobile.Text;
            objRegistration.InsertUserMobile();
            txtDate.Text = hdnDate.Value;

            //for profile image
            if (fuProfileImage.HasFile)
                {
                    byte[] imageBytes = null;
                    int fileLength = fuProfileImage.PostedFile.ContentLength;
                    imageBytes = new byte[fileLength];
                    fuProfileImage.PostedFile.InputStream.Read(imageBytes, 0, fileLength);

                    if (checkValidation(fuProfileImage, ConfigurationManager.AppSettings["imgWidth"].ToString(),
                         ConfigurationManager.AppSettings["imgHeight"].ToString(), ConfigurationManager.AppSettings["imgSize"].ToString()))
                    {
                        int size = Convert.ToInt32(ConfigurationManager.AppSettings["imgSize"].ToString());
                        MessageBox.Show("Please upload image of dimension " + ConfigurationManager.AppSettings["imgWidth"].ToString() +
                            "x" + ConfigurationManager.AppSettings["imgHeight"].ToString() + " and size upto " + (size / 1024) + "kb");
                        //return;
                    }
                    else
                    {
                        objRegistration.ProfileImage = imageBytes;
                    }
                }
            else if(objPostLogin.GetProfileImage().Rows.Count>0)
            {
                byte[] bytes = (byte[])objPostLogin.GetProfileImage().Rows[0]["ProfileImage"];
                objRegistration.ProfileImage = bytes;
            }

            objRegistration.InsertUserProfileImage();

            Response.Redirect("/UserProfile.aspx", true);
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
    }

    public bool checkValidation(FileUpload imageUpload, string imagewidth, string imageheight, string imagesize)
    {
        bool flg = false;
        try
        {
            if (imageUpload.HasFile)
            {
                if (imageUpload.PostedFile.FileName != "")
                {
                    //Stream file = filename;
                    Stream file = imageUpload.PostedFile.InputStream;
                    int len = imageUpload.PostedFile.ContentLength;
                    //byte[] pic = new byte[len];
                    //file.Read(pic, 0, len);

                    System.Drawing.Image imagedata = System.Drawing.Image.FromStream(file);
                    int width = Convert.ToInt32(imagedata.PhysicalDimension.Width);
                    int height = Convert.ToInt32(imagedata.PhysicalDimension.Height);
                    int size = Convert.ToInt32(imageUpload.PostedFile.ContentLength);
                    int validWidth = Convert.ToInt32(imagewidth);
                    int validHeight = Convert.ToInt32(imageheight);
                    int validSize = Convert.ToInt32(imagesize);

                    if (width > validWidth)
                    {
                        flg = true;
                        return flg;
                    }
                    if (height > validHeight)
                    {
                        flg = true;
                        return flg;
                    }
                    if (size > validSize)
                    {
                        flg = true;
                        return flg;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), imageUpload.ToString());
        }
        return flg;
    }

    private DateTime GetFormatedDate(string currentformatdate)
    {
        string[] dateparts;
        if (currentformatdate.Contains("-") == true)
        {
            dateparts = currentformatdate.Split('-');
        }
        else
        {
            dateparts = currentformatdate.Split('/');
        }
        DateTime expextedDate = new DateTime(Convert.ToInt32(dateparts[2]), Convert.ToInt32(dateparts[0]), Convert.ToInt32(dateparts[1]));
        return expextedDate;

    }
}