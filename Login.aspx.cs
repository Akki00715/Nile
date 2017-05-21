using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessLayer;
using System.IO;
using System.Configuration;
using System.Text;
using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;

public partial class Login : System.Web.UI.Page
{
    BL_ErrorLogs objError = new BL_ErrorLogs();
    BL_Registration objRegistration = new BL_Registration();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtEmail.Text.Trim() != null)
            {
                //if (txtPassword.Text.Trim() == txtCPassword.Text.Trim())
                //{
                MembershipCreateStatus status;
                string Password = Membership.GeneratePassword(8,0);
                MembershipUser newuser = Membership.CreateUser(txtEmail.Text.Trim(), Password, txtEmail.Text.Trim(), null, null, true, out status);

                switch (status)
                {
                    case MembershipCreateStatus.Success:
                        //int Result = RegisterUser(txtEmail.Text.Trim(), txtArtistName.Text.Trim(), txtFname.Text.Trim(), txtLname.Text.Trim(), ddlGender.SelectedValue.ToString(), txtDate.Text.Trim(), txtMobile.Text.Trim());
                        int Result = RegisterUser(txtEmail.Text.Trim(), "", "", "", "", "", "",Password);
                        if (Result > 0)
                        {
                            MessageBox.Show("Registered successfully. Please check you mail for password");
                        }
                        else
                        {
                            Membership.DeleteUser(txtEmail.Text.Trim(), true);
                            MessageBox.Show("Opps something went wrong.");
                        }
                        break;
                    case MembershipCreateStatus.InvalidUserName:
                        break;
                    case MembershipCreateStatus.InvalidPassword:
                        break;
                    case MembershipCreateStatus.InvalidQuestion:
                        break;
                    case MembershipCreateStatus.InvalidAnswer:
                        break;
                    case MembershipCreateStatus.InvalidEmail:
                        break;
                    case MembershipCreateStatus.DuplicateUserName:
                        MessageBox.Show("UserName already exists");
                        break;
                    case MembershipCreateStatus.DuplicateEmail:
                        break;
                    case MembershipCreateStatus.UserRejected:
                        break;
                    case MembershipCreateStatus.InvalidProviderUserKey:
                        break;
                    case MembershipCreateStatus.DuplicateProviderUserKey:
                        break;
                    case MembershipCreateStatus.ProviderError:
                        break;
                    default:
                        break;
                }
                //}
                //else
                //{
                //    MessageBox.Show("Password fields are not matching");
                //}
            }
            else
            {
                MessageBox.Show("Password field cannot be blank");
            }
        }
        catch (Exception ex)
        {

            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
    }


    public string CreatePassword(int length)
    {
        const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder res = new StringBuilder();
        try
        {
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
            return "#@!QPEYTRSW";
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

    protected void btnSignIn_Click(object sender, EventArgs e)
    {
        try
        {
            if (Membership.ValidateUser(txtLUsername.Text.Trim(), txtLPassword.Text.Trim()))
            {
                MembershipUser mu = Membership.GetUser(txtLUsername.Text.Trim());
                string userId = mu.ProviderUserKey.ToString();
                Session["UserDetails"] = userId;
                objRegistration.userid = new Guid(userId);
                int Result = objRegistration.CheckRegisteredUsers();
                if (Result==1)
                {
                    Response.Redirect("/UserProfile.aspx", true);
                }
                else
                {
                    Response.Redirect("/UserProfileDetails.aspx", true);
                    
                }

                
            }
            else {
                MessageBox.Show("Invalid Username/Password");
            }
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }

    }

    public int RegisterUser(string Email, string ArtistName, string FirstName, string LastName, string Gender, string DOB, string Mobile , string Password)
    {
        int Result = 0;
        try
        {
            MembershipUser mu = Membership.GetUser(Email);
            string userId = mu.ProviderUserKey.ToString();
            objRegistration.userid = new Guid(userId);
            //string Password = CreatePassword(8);
            objRegistration.ArtistName = ArtistName;
            objRegistration.FirstName = FirstName;
            objRegistration.LastName = LastName;
            objRegistration.Gender = Gender;
            objRegistration.DateOfBirth = DOB;
            objRegistration.InsertRegisterUserDetails();

            //for mobile number
            objRegistration.Mobile = Mobile;
            objRegistration.InsertUserMobile();

            //for profile image
            //if (fuProfileImage.HasFile)
            //{
            //    byte[] imageBytes = null;
            //    int fileLength = fuProfileImage.PostedFile.ContentLength;
            //    imageBytes = new byte[fileLength];
            //    fuProfileImage.PostedFile.InputStream.Read(imageBytes, 0, fileLength);

            //    if (checkValidation(fuProfileImage, ConfigurationManager.AppSettings["imgWidth"].ToString(),
            //         ConfigurationManager.AppSettings["imgHeight"].ToString(), ConfigurationManager.AppSettings["imgSize"].ToString()))
            //    {
            //        int size = Convert.ToInt32(ConfigurationManager.AppSettings["imgSize"].ToString());
            //        MessageBox.Show("Please upload image of dimension " + ConfigurationManager.AppSettings["imgWidth"].ToString() +
            //            "x" + ConfigurationManager.AppSettings["imgHeight"].ToString() + " and size upto " + (size / 1024) + "kb");
            //        //return;
            //    }
            //    else
            //    {
            //        objRegistration.ProfileImage = imageBytes;
            //    }
            //}
            objRegistration.InsertUserProfileImage();

            //for verification mail
            objRegistration.Email = Email;
            objRegistration.UserPassword = Password;
            int ResultMail = objRegistration.SendEmail();
            if (ResultMail > 0)
            {
                MessageBox.Show("Email sent");
            }
            Result = 1;
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
        return Result;
    }

    protected void ImgBtnGmailLogin_Click(object sender, ImageClickEventArgs e)
    {
        int Result = GetGPlusData();

        if (Result > 0)
        {
            MessageBox.Show("Registered successfully. Please check you mail for password");
        }
        else if (Result != 0)
        {
            Membership.DeleteUser(txtEmail.Text.Trim(), true);
            MessageBox.Show("Opps something went wrong.");
        }
        else
        {
            
            MessageBox.Show("Opps something went wrong.");
        }
    }

    public int GetGPlusData()
    {
        int Result = 0;
        try
        {
            GoogleConnect.ClientId = "683374167125-bkbvf3vm3vo7jbbhkecfft7jeigigqbc.apps.googleusercontent.com";
            GoogleConnect.ClientSecret = "K4fRYkOwf4Nhp6MZ25x5S8r-";
            GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];
            if (!string.IsNullOrEmpty(Request.QueryString["code"]))
            {
                string code = Request.QueryString["code"];
                string json = GoogleConnect.Fetch("me", code);
                GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
                string FirstName = profile.Name.FirstName;
                string LastName = profile.Name.LastName;
                string Email = profile.Emails.Find(email => email.Type == "account").EmailId;
                string Gender = profile.Gender[0].ToString();

                MembershipCreateStatus status;
                string Password = CreatePassword(8);
                MembershipUser newuser = Membership.CreateUser(Email, "Password", Email, null, null, true, out status);

                Result = RegisterUser(Email, "", FirstName, LastName, Gender, "", "",Password);
            }
            if (Request.QueryString["error"] == "access_denied")
            {
                MessageBox.Show("Access denied by Google");
            }
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
        return Result;
    }

    public class GoogleProfile
    {
        public Name Name { get; set; }
        public Image Image { get; set; }
        public List<Email> Emails { get; set; }
        public string Gender { get; set; }
    }

    public class Email
    {
        public string EmailId { get; set; }
        public string Type { get; set; }
    }
    public class Name
    {
        public string LastName { get; set; }
        public string FirstName { get; set; }
    }
}