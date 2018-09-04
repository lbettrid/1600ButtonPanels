using System;
using System.Web;
using System.Web.UI;
using System.Xml;
using System.IO;
using System.Drawing;

namespace HelvarButtonPanels
{
	public partial class AddLabelOrIcon : Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
			}
		}

		protected void Upload(object sender, EventArgs e)
		{
			System.Diagnostics.Debug.WriteLine("Upload : ");
			if (IconUpload.HasFile)
			{
				ErrorLabel.Text = "";

				try
				{
					string fileName = Path.GetFileName(IconUpload.PostedFile.FileName);

					Image img = Image.FromStream(IconUpload.PostedFile.InputStream);

					if (img.Width == 22 && img.Height == 20)
					{
						IconImage.ImageUrl = "/Images/icons/" + fileName;
						img.Save(Server.MapPath("~/Images/icons/") + fileName);
						iconImageName.Value = fileName.Substring(0, fileName.LastIndexOf("."));
						//save file to icons folder and reload page
						//FileUpload1.PostedFile.SaveAs();
						//Response.Redirect(Request.Url.AbsoluteUri, false);
					}
					else
					{
						ErrorLabel.Text = "The .png image must be 22 wide by 20 high!";
					}
				}
				catch (Exception ex)
				{
					System.Diagnostics.Debug.WriteLine("Upload : " + ex.Message);
					System.Diagnostics.Debug.WriteLine(ex.Message);
				}
			}
		}

		protected void AddItem(object sender, EventArgs e)
		{
			string code = ItemCode.Text, txt;
			bool icon = false;

			if (string.IsNullOrEmpty(iconImageName.Value) == false)
			{
				txt = iconImageName.Value;
				icon = true;
			}
			else if (string.IsNullOrEmpty(LabelText.Text) == false)
			{
				txt = LabelText.Text;
			}
			else
			{
				ErrorLabel.Text = "You must supply an Icon image or text for the Label";
				return;
			}

			try
			{
				XmlDocument xmlDocument = new XmlDocument();
				XmlNode node;
				xmlDocument.Load(HttpContext.Current.Server.MapPath("~/labels.xml"));

				node = (icon) ? xmlDocument.SelectNodes("/buttonLabels/icons/icon")[0] : xmlDocument.SelectNodes("/buttonLabels/labels/label")[0];

				XmlNode newnode = node.CloneNode(true);
				newnode.InnerText = txt;
				newnode.Attributes[0].Value = code;

				node = (icon) ? xmlDocument.SelectNodes("/buttonLabels/icons")[0] : xmlDocument.SelectNodes("/buttonLabels/labels")[0];

				node.AppendChild(newnode);

				xmlDocument.Save(HttpContext.Current.Server.MapPath("~/labels.xml"));

				IconImage.ImageUrl = null;
				ItemCode.Text = "";
				LabelText.Text = "";
			}
			catch (Exception ex)
			{
				ErrorLabel.Text = ex.Message;
				System.Diagnostics.Debug.WriteLine("AddIcon : " + ex.Message);
			}
		}
	}
}