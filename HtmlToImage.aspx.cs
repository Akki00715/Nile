using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FreeTextBoxControls;
using System.Data;
using BusinessLayer;

public partial class HtmlToImage : System.Web.UI.Page
{
    BusinessLayer.HtmlToImage objHtml2Image = new BusinessLayer.HtmlToImage();
    BL_ErrorLogs objError = new BL_ErrorLogs();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {

            DataSet ds = objHtml2Image.GetImageTemplate();


            Literal1.Mode = LiteralMode.Encode;
            Literal1.Mode = LiteralMode.PassThrough;
            Literal1.Mode = LiteralMode.Transform;

            if (rbListImages.SelectedItem.Text == "Red")
            {
                Literal1.Text = ds.Tables[0].Rows[0][1].ToString();

            }
            else if (rbListImages.SelectedItem.Text == "Blue")
            {
                Literal1.Text = ds.Tables[0].Rows[1][1].ToString();
            }
            else if (rbListImages.SelectedItem.Text == "Green")
            {
                Literal1.Text = ds.Tables[0].Rows[2][1].ToString(); ;
            }

            Literal2.Text = ds.Tables[0].Rows[3][1].ToString(); ;
            Literal3.Text = FreeTextBox1.Text;

            Literal4.Text = ds.Tables[0].Rows[4][1].ToString(); ;



            string text = FreeTextBox1.Text;
            if (text.Length > 10)
            {
                string sub1 = text.Substring(0, 10);
                string sub2 = " ...for more click here";
                string sub = sub1 + sub2;

                if (rbListImages.SelectedItem.Text == "Red")
                {
                    Literal5.Text = ds.Tables[0].Rows[5][1].ToString();

                }
                else if (rbListImages.SelectedItem.Text == "Blue")
                {
                    Literal5.Text = ds.Tables[0].Rows[6][1].ToString();
                }
                else if (rbListImages.SelectedItem.Text == "Green")
                {
                    Literal5.Text = ds.Tables[0].Rows[7][1].ToString(); ;
                }

                Literal6.Text = ds.Tables[0].Rows[3][1].ToString(); ;
                Literal7.Text = sub;

                Literal8.Text = ds.Tables[0].Rows[4][1].ToString(); ;

            }
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }

    }

    protected void ExportToImage1(object sender, EventArgs e)
    {
        abc();
        def();
    }

    protected void ExportToImage(object sender, EventArgs e)
    {
        try
        {
            string base64 = Request.Form[hfImageData1.UniqueID].Split(',')[1];
            byte[] bytes = Convert.FromBase64String(base64);
            Response.Clear();
            Response.ContentType = "image/png";
            Response.AddHeader("Content-Disposition", "attachment; filename=half.png");
            Response.Buffer = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.End();
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
    }

    //public int InsertImage(byte[] Byte)
    //{
    //    int Result = 0;
    //    try
    //    {
    //        con.Open();
    //        SqlDataAdapter adp = new SqlDataAdapter();
    //        SqlCommand cmd = new SqlCommand("usp_Image", con);
    //        adp.SelectCommand = cmd;
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add("@image1", SqlDbType.VarBinary).Value = Byte;
    //        cmd.Parameters.Add("@StatementType", 1);
    //        //cmd.Parameters.Add("@image2", SqlDbType.VarBinary).Value = Byte2;
    //        Result = cmd.ExecuteNonQuery();
    //    }
    //    catch (Exception ex)
    //    {

    //        throw ex;
    //    }
    //    return Result;


    //}

    public void abc()
    {
        try
        {
            string base64 = Request.Form[hfImageData1.UniqueID].Split(',')[1];
            byte[] bytes = Convert.FromBase64String(base64);
            Response.Clear();
            Response.ContentType = "image/png";
            Response.AddHeader("Content-Disposition", "attachment; filename=Full.png");
            Response.Buffer = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.End();
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
    }

    public void def()
    {
        try
        {
            string base64 = Request.Form[hfImageData1.UniqueID].Split(',')[1];
            byte[] bytes = Convert.FromBase64String(base64);

            Response.Clear();
            Response.ContentType = "image/png";
            Response.AddHeader("Content-Disposition", "attachment; filename=Half.png");
            Response.Buffer = true;
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(bytes);
            Response.End();
        }
        catch (Exception ex)
        {
            objError.ErrorLog(ex.Message, ex.StackTrace, ex.Source, ex.TargetSite.ToString(), "-");
        }
    }
}