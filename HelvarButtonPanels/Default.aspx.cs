using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.Script.Serialization;

//using System.Web.UI.HtmlControls;
//using System.Web.Script.Services;
//using System.Web.Services;
//using System.Web.UI.WebControls;
//using System.Net;
//using System.Net.Mail;
//using System.Configuration;
//using System.Collections;

using PdfSharp;
using PdfSharp.Drawing;
using PdfSharp.Drawing.Layout;
using PdfSharp.Pdf;
//using PdfSharp.Pdf.IO;
//using PdfSharp.Pdf.Printing;

namespace HelvarButtonPanels
{
	public class ButtonPanel
	{
		public string style { get; set; }
		public string SAP { get; set; }
		public string notes;
		public string quantity;
		public List<Button> buttons { get; set; }
	}

	public class Button
	{
		public string location { get; set; }
		public string label { get; set; }
		public string icon { get; set; }
        public string code { get; set; }
	}

    public partial class _Default : Page
    {
        public PdfDocument orderForm;
        public PdfPage page;
        public XGraphics gfx;
        public XTextFormatter tf;
        public XFont Arial20Bold;
        public XFont Arial12Regular;
        public XFont Arial10Regular;
		public XFont Arial10RegularU;
		public XFont Arial8Regular;
        public XPen pen;
        public double LineHeight12;
        public double LineHeight10;
        public double BorderWidth;
        public XRect rect;
		public XRect iconRect;
        public XRect column1;
        public XRect column2;

        public const double BUTTON_WIDTH = 39.129;
        public const double BUTTUN_RECT_WIDTH = 14.5;
        public const double BUTTON_RECT_HEIGHT = 4;

		public double STARTING_TOP_POS = 0.0;
		public double STARTING_LEFT_POS = 0.0;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void exportPDF_Click(object sender, EventArgs e)
        {
			//grab the json panel data from the hidden field
			List<ButtonPanel> buttonPanels = new JavaScriptSerializer().Deserialize<List<ButtonPanel>>(panelData.Value);

			//make a new pdf sharp doc and related drawing tools
			orderForm = new PdfDocument();
			orderForm.Info.Title = "Helvar Button Panels";

			XPdfFontOptions options = new XPdfFontOptions(PdfFontEncoding.Unicode, PdfFontEmbedding.Always);

			Arial20Bold = new XFont("Arial", 20, XFontStyle.Bold, options);
			Arial12Regular = new XFont("Arial", 12, XFontStyle.Regular, options);
            Arial10Regular = new XFont("Arial", 10, XFontStyle.Regular, options);
			Arial10RegularU = new XFont("Arial", 10, XFontStyle.Underline, options);
			Arial8Regular = new XFont("Arial", 8, XFontStyle.Regular, options);

			pen = new XPen(new XColor());
			BorderWidth = XUnit.FromMillimeter(10);

			//get button images
			string buttonImagePath = null;
			XImage buttonLeftImage = null;
			XImage buttonRightImage = null;

			try
			{
				buttonImagePath = HttpContext.Current.Server.MapPath("~/images/button_left.png");
				buttonLeftImage = XImage.FromFile(buttonImagePath);
				buttonImagePath = HttpContext.Current.Server.MapPath("~/images/button_right.png");
				buttonRightImage = XImage.FromFile(buttonImagePath);
			}
			catch (Exception exception)
			{
				Console.Write(exception.ToString());
				Response.Clear();
				Response.ContentType = "text/html";
				Response.Write(exception.ToString());
				Response.End();
				return;
			}

            //set a few page variables
			int numberOfPanels = buttonPanels.Count();
			int numberOfPages = (int)Math.Ceiling((double)numberOfPanels / 2);
			int currentPage = 1;
			int currentPanel = 0;
			int panelsOnPage = 0;

            //start drawing the actual pages
			while (currentPage <= numberOfPages)
			{
				page = orderForm.AddPage();
				page.Orientation = PageOrientation.Portrait;
				page.Width = XUnit.FromMillimeter(210);
				page.Height = XUnit.FromMillimeter(297);

				LineHeight12 = page.Height / 50;
				LineHeight10 = page.Height / 60;

				gfx = XGraphics.FromPdfPage(page);

				tf = new XTextFormatter(gfx);

				//make a rectangle at the top of the page and draw the helvar logo and customer details
				rect = new XRect(BorderWidth, BorderWidth, XUnit.FromMillimeter(180), LineHeight12);

				string imagePath = HttpContext.Current.Server.MapPath("~/images/helvarPrint.png");
				XImage image = XImage.FromFile(imagePath);
				gfx.DrawImage(image, rect.Left, rect.Top);

				tf.Alignment = XParagraphAlignment.Center;
				tf.DrawString("Button Panel Specification", Arial20Bold, XBrushes.Black, rect, XStringFormats.TopLeft);

				rect.Offset(0, XUnit.FromMillimeter(15));

				bool customLabelFound = false;
				foreach (ButtonPanel panel in buttonPanels)
				{
					foreach (Button button in panel.buttons)
					{
						if (button != null && button.code.ToUpper() == "CUSTOM")
						{
							tf.DrawString("NB custom panel requiring new artwork!", new XFont("Arial", 14, XFontStyle.Bold, options), XBrushes.Red, rect, XStringFormats.TopLeft);
							customLabelFound = true;
							break;
						}
					}

					if (customLabelFound == true)
					{
						break;
					}
				}
				
				rect.Offset(0, XUnit.FromMillimeter(15));
				tf.Alignment = XParagraphAlignment.Left;
				XRect footer = new XRect(BorderWidth * 2, page.Height - (BorderWidth * 2) - LineHeight12, page.Width, LineHeight12);
				tf.DrawString("Page " + currentPage + " of " + numberOfPages, Arial12Regular, XBrushes.Black, footer, XStringFormats.TopLeft);

				column1 = new XRect(rect.Left, rect.Top, rect.Width / 2, LineHeight12);
				column2 = new XRect(rect.Left + (rect.Width / 2), rect.Top, rect.Width / 2, LineHeight12);

				XRect column1a = new XRect(column1.Left, column1.Top, column1.Width / 2, LineHeight12);
				XRect column1b = new XRect(column1.Left + (column1.Width / 2), column1.Top, column1.Width / 2, LineHeight12);

				XRect column2a = new XRect(column2.Left, column2.Top, column2.Width / 2, LineHeight12);
				XRect column2b = new XRect(column2.Left + (column2.Width / 2), column2.Top, column2.Width / 2, LineHeight12);

				tf.Alignment = XParagraphAlignment.Right;
				tf.DrawString("Customer Name:  ", Arial12Regular, XBrushes.Black, column1a, XStringFormats.TopLeft);
				column1a.Offset(0, LineHeight12);
				tf.DrawString("Company Name:  ", Arial12Regular, XBrushes.Black, column1a, XStringFormats.TopLeft);
				column1a.Offset(0, LineHeight12);
				tf.DrawString("Contact Number:  ", Arial12Regular, XBrushes.Black, column1a, XStringFormats.TopLeft);
				column1a.Offset(0, LineHeight12);
				tf.DrawString("Email Address:  ", Arial12Regular, XBrushes.Black, column1a, XStringFormats.TopLeft);
				column1a.Offset(0, LineHeight12);
				tf.DrawString("Project Name:  ", Arial12Regular, XBrushes.Black, column2a, XStringFormats.TopLeft);
				column2a.Offset(0, LineHeight12);
				tf.DrawString("Customer Order Num:  ", Arial12Regular, XBrushes.Black, column2a, XStringFormats.TopLeft);
				column2a.Offset(0, LineHeight12);
				tf.DrawString("Helvar Order Num:  ", Arial12Regular, XBrushes.Black, column2a, XStringFormats.TopLeft);

				tf.Alignment = XParagraphAlignment.Left;
				tf.DrawString(custNameInp.Text, Arial12Regular, XBrushes.Blue, column1b, XStringFormats.TopLeft);
				column1b.Offset(0, LineHeight12);
				tf.DrawString(compNameInp.Text, Arial12Regular, XBrushes.Blue, column1b, XStringFormats.TopLeft);
				column1b.Offset(0, LineHeight12);
				tf.DrawString(contNumInp.Text, Arial12Regular, XBrushes.Blue, column1b, XStringFormats.TopLeft);
				column1b.Offset(0, LineHeight12);
				tf.DrawString(emailAddInp.Text, Arial12Regular, XBrushes.Blue, column1b, XStringFormats.TopLeft);
				column1b.Offset(0, LineHeight12);
				tf.DrawString(projNameInp.Text, Arial12Regular, XBrushes.Blue, column2b, XStringFormats.TopLeft);
				column2b.Offset(0, LineHeight12);
				tf.DrawString(ordNumInp.Text, Arial12Regular, XBrushes.Blue, column2b, XStringFormats.TopLeft);
				column2b.Offset(0, LineHeight12);
				tf.DrawString(helvarOrdNumInp.Text, Arial12Regular, XBrushes.Blue, column2b, XStringFormats.TopLeft);

				panelsOnPage = 0;

				// now loop through the panels drawing each one in turn
				while (currentPanel < numberOfPanels && panelsOnPage < 2)
				{
					ButtonPanel bp = buttonPanels[currentPanel];
					//draw the background panel
					try
					{
						string panelImagePath = HttpContext.Current.Server.MapPath("~/images/" + bp.style + "_1to1.png");
						XImage panelImage = XImage.FromFile(panelImagePath);

						//STARTING_LEFT_POS = (page.Width / 2) - (panelImage.PointWidth / 2);
                        STARTING_LEFT_POS = BorderWidth * 2;
						STARTING_TOP_POS = (panelsOnPage == 0) ? 70.0 : 160.0;
						gfx.DrawImage(panelImage, STARTING_LEFT_POS, XUnit.FromMillimeter(STARTING_TOP_POS));
					}
					catch (Exception exception)
					{
						Console.Write(exception.ToString());
						Response.Clear();
						Response.ContentType = "text/html";
						Response.Write(exception.ToString());
						Response.End();
						return;
					}

                    //use the second column to write the part numbers and product code etc
                    //column2a.Offset(0, LineHeight12 * 3);
                    //column2b.Offset(0, LineHeight12 * 3);
                    column2a.Y = XUnit.FromMillimeter(STARTING_TOP_POS);
                    column2b.Y = XUnit.FromMillimeter(STARTING_TOP_POS);
                    tf.Alignment = XParagraphAlignment.Right;
                    tf.DrawString("Part No:  ", Arial10Regular, XBrushes.Black, column2a, XStringFormats.TopLeft);
                    tf.Alignment = XParagraphAlignment.Left;
                    tf.DrawString(bp.SAP.ToUpper(), Arial10Regular, XBrushes.Blue, column2b, XStringFormats.TopLeft);
                    column2a.Offset(0, LineHeight12);
                    column2b.Offset(0, LineHeight12);
					tf.Alignment = XParagraphAlignment.Right;
					tf.DrawString("Quantity:  ", Arial10Regular, XBrushes.Black, column2a, XStringFormats.TopLeft);
					tf.Alignment = XParagraphAlignment.Left;
					tf.DrawString(bp.quantity.ToUpper(), Arial10Regular, XBrushes.Blue, column2b, XStringFormats.TopLeft);
					column2a.Offset(0, LineHeight12);
					column2b.Offset(0, LineHeight12);
					tf.Alignment = XParagraphAlignment.Right;
					tf.DrawString("Notes:  ", Arial10Regular, XBrushes.Black, column2a, XStringFormats.TopLeft);
					tf.Alignment = XParagraphAlignment.Left;
					column2b = new XRect(column2b.Left, column2b.Top, column2b.Width, LineHeight12 * 4);
					tf.DrawString(bp.notes, Arial10Regular, XBrushes.Blue, column2b, XStringFormats.TopLeft);

                    //draw the buttons
					double buttonTop = column2b.Top + (LineHeight12 * 4);
					XRect buttonColumn1 = new XRect(column2.Left, buttonTop, column2.Width / 3, LineHeight12);
					XRect buttonColumn2 = new XRect(buttonColumn1.Left + buttonColumn1.Width, buttonTop, buttonColumn1.Width, LineHeight12);
					XRect buttonColumn3 = new XRect(buttonColumn2.Left + buttonColumn1.Width, buttonTop, buttonColumn1.Width, LineHeight12);

					tf.Alignment = XParagraphAlignment.Center;
					tf.DrawString("BUTTONS", Arial10RegularU, XBrushes.Black, buttonColumn2, XStringFormats.TopLeft);

					buttonTop = buttonTop + LineHeight12;
					buttonColumn1.Offset(0, buttonTop);
					buttonColumn2.Offset(0, buttonTop);
					buttonColumn3.Offset(0, buttonTop);

					foreach (Button btn in bp.buttons)
					{
						if (btn != null)
						{
							//line a rectangle up with the panel image, then offest the buttons/labels from that point
							rect = new XRect(STARTING_LEFT_POS, XUnit.FromMillimeter(STARTING_TOP_POS), XUnit.FromMillimeter(BUTTUN_RECT_WIDTH), XUnit.FromMillimeter(BUTTON_RECT_HEIGHT));
							iconRect = new XRect(STARTING_LEFT_POS, XUnit.FromMillimeter(STARTING_TOP_POS), XUnit.FromMillimeter(10), XUnit.FromMillimeter(10));

							XBrush textColour = (btn.code.ToUpper() == "CUSTOM") ? XBrushes.Red : XBrushes.Black;

							switch (btn.location)
							{
								case "LEFT_1":
									tf.Alignment = XParagraphAlignment.Right;
									buttonColumn1.Y = buttonTop;
									tf.DrawString("Left 1: " + btn.code, Arial10Regular, textColour, buttonColumn1, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(20.5), XUnit.FromMillimeter(20.5));
									gfx.DrawImage(buttonLeftImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(27), XUnit.FromMillimeter(21.25));
									rect.Offset(XUnit.FromMillimeter(3.5), XUnit.FromMillimeter(2));
									break;

								case "LEFT_2":
									tf.Alignment = XParagraphAlignment.Right;
									buttonColumn1.Y = buttonTop + LineHeight12;
									tf.DrawString("Left 2: " + btn.code, Arial10Regular, textColour, buttonColumn1, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(20.5), XUnit.FromMillimeter(29.5));
									gfx.DrawImage(buttonLeftImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(27), XUnit.FromMillimeter(30.25));
									rect.Offset(XUnit.FromMillimeter(3.5), XUnit.FromMillimeter(2));
									break;

								case "LEFT_3":
									tf.Alignment = XParagraphAlignment.Right;
									buttonColumn1.Y = buttonTop + (LineHeight12 * 2);
									tf.DrawString("Left 3: " + btn.code, Arial10Regular, textColour, buttonColumn1, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(20.5), XUnit.FromMillimeter(38.5));
									gfx.DrawImage(buttonLeftImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(27), XUnit.FromMillimeter(39.25));
									rect.Offset(XUnit.FromMillimeter(3.5), XUnit.FromMillimeter(2));
									break;

								case "LEFT_4":
									tf.Alignment = XParagraphAlignment.Right;
									buttonColumn1.Y = buttonTop + (LineHeight12 * 3);
									tf.DrawString("Left 4: " + btn.code, Arial10Regular, textColour, buttonColumn1, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(20.5), XUnit.FromMillimeter(48));
									gfx.DrawImage(buttonLeftImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(27), XUnit.FromMillimeter(48.75));
									rect.Offset(XUnit.FromMillimeter(3.5), XUnit.FromMillimeter(2));
									break;

								case "LEFT_5":
									tf.Alignment = XParagraphAlignment.Right;
									buttonColumn1.Y = buttonTop + (LineHeight12 * 4);
									tf.DrawString("Left 5: " + btn.code, Arial10Regular, textColour, buttonColumn1, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(20.5), XUnit.FromMillimeter(57));
									gfx.DrawImage(buttonLeftImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(27), XUnit.FromMillimeter(57.75));
									rect.Offset(XUnit.FromMillimeter(3.5), XUnit.FromMillimeter(2));
									break;

								case "CENTER_1":
									tf.Alignment = XParagraphAlignment.Center;
									buttonColumn2.Y = buttonTop;
									tf.DrawString("Center 1: " + btn.code, Arial10Regular, textColour, buttonColumn2, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(33.5), XUnit.FromMillimeter(20.5));
									gfx.DrawImage(buttonLeftImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(40), XUnit.FromMillimeter(21.25));
									rect.Offset(XUnit.FromMillimeter(3.5), XUnit.FromMillimeter(2));
									break;

								case "CENTER_2":
									tf.Alignment = XParagraphAlignment.Center;
									buttonColumn2.Y = buttonTop + LineHeight12;
									tf.DrawString("Center 2: " + btn.code, Arial10Regular, textColour, buttonColumn2, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(33.5), XUnit.FromMillimeter(29.5));
									gfx.DrawImage(buttonLeftImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(40), XUnit.FromMillimeter(30.25));
									rect.Offset(XUnit.FromMillimeter(3.5), XUnit.FromMillimeter(2));
									break;

								case "CENTER_3":
									tf.Alignment = XParagraphAlignment.Center;
									buttonColumn2.Y = buttonTop + (LineHeight12 * 2);
									tf.DrawString("Center 3: " + btn.code, Arial10Regular, textColour, buttonColumn2, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(33.5), XUnit.FromMillimeter(38.5));
									gfx.DrawImage(buttonLeftImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(40), XUnit.FromMillimeter(39.25));
									rect.Offset(XUnit.FromMillimeter(3.5), XUnit.FromMillimeter(2));
									break;

								case "CENTER_4":
									tf.Alignment = XParagraphAlignment.Center;
									buttonColumn2.Y = buttonTop + (LineHeight12 * 3);
									tf.DrawString("Center 4: " + btn.code, Arial10Regular, textColour, buttonColumn2, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(33.5), XUnit.FromMillimeter(48));
									gfx.DrawImage(buttonLeftImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(40), XUnit.FromMillimeter(48.75));
									rect.Offset(XUnit.FromMillimeter(3.5), XUnit.FromMillimeter(2));
									break;

								case "CENTER_5":
									tf.Alignment = XParagraphAlignment.Center;
									buttonColumn2.Y = buttonTop + (LineHeight12 * 4);
									tf.DrawString("Center 5: " + btn.code, Arial10Regular, textColour, buttonColumn2, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(33.5), XUnit.FromMillimeter(57));
									gfx.DrawImage(buttonLeftImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(40), XUnit.FromMillimeter(57.75));
									rect.Offset(XUnit.FromMillimeter(3.5), XUnit.FromMillimeter(2));
									break;

								case "RIGHT_1":
									tf.Alignment = XParagraphAlignment.Right;
									buttonColumn3.Y = buttonTop;
									tf.DrawString("Right 1: " + btn.code, Arial10Regular, textColour, buttonColumn3, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(46), XUnit.FromMillimeter(20.5));
									gfx.DrawImage(buttonRightImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(52), XUnit.FromMillimeter(21.25));
									rect.Offset(XUnit.FromMillimeter(1.5), XUnit.FromMillimeter(2));
									break;

								case "RIGHT_2":
									tf.Alignment = XParagraphAlignment.Right;
									buttonColumn3.Y = buttonTop + LineHeight12;
									tf.DrawString("Right 2: " + btn.code, Arial10Regular, textColour, buttonColumn3, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(46), XUnit.FromMillimeter(29.5));
									gfx.DrawImage(buttonRightImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(52), XUnit.FromMillimeter(30.25));
									rect.Offset(XUnit.FromMillimeter(1.5), XUnit.FromMillimeter(2));
									break;

								case "RIGHT_3":
									tf.Alignment = XParagraphAlignment.Right;
									buttonColumn3.Y = buttonTop + (LineHeight12 * 2);
									tf.DrawString("Right 3: " + btn.code, Arial10Regular, textColour, buttonColumn3, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(46), XUnit.FromMillimeter(38.5));
									gfx.DrawImage(buttonRightImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(52), XUnit.FromMillimeter(39.25));
									rect.Offset(XUnit.FromMillimeter(1.5), XUnit.FromMillimeter(2));
									break;

								case "RIGHT_4":
									tf.Alignment = XParagraphAlignment.Right;
									buttonColumn3.Y = buttonTop + (LineHeight12 * 3);
									tf.DrawString("Right 4: " + btn.code, Arial10Regular, textColour, buttonColumn3, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(46), XUnit.FromMillimeter(48));
									gfx.DrawImage(buttonRightImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(52), XUnit.FromMillimeter(48.75));
									rect.Offset(XUnit.FromMillimeter(1.5), XUnit.FromMillimeter(2));
									break;

								case "RIGHT_5":
									tf.Alignment = XParagraphAlignment.Right;
									buttonColumn3.Y = buttonTop + (LineHeight12 * 4);
									tf.DrawString("Right 5: " + btn.code, Arial10Regular, textColour, buttonColumn3, XStringFormats.TopLeft);

									rect.Offset(XUnit.FromMillimeter(46), XUnit.FromMillimeter(57));
									gfx.DrawImage(buttonRightImage, rect.Left, rect.Top);
									iconRect.Offset(XUnit.FromMillimeter(52), XUnit.FromMillimeter(57.75));
									rect.Offset(XUnit.FromMillimeter(1.5), XUnit.FromMillimeter(2));
									break;
							}

							if (null == btn.label)
							{
								try
								{
									string iconImagePath = HttpContext.Current.Server.MapPath("~/images/icons/" + btn.icon + ".png");
									XImage iconImage = XImage.FromFile(iconImagePath);

									gfx.DrawImage(iconImage, iconRect.Left, iconRect.Top);
								}
								catch (Exception exception)
								{
									Console.Write(exception.ToString());
								}
							}
							else
							{
								tf.Alignment = XParagraphAlignment.Left;
								tf.DrawString(checkStringLength(btn.label), Arial8Regular, XBrushes.White, rect, XStringFormats.TopLeft);
							}
						}
					}

					currentPanel++;
					panelsOnPage++;
				}

				currentPage++;
			}

            //******************************************************************************************
            //******************************************************************************************

            MemoryStream ms = new MemoryStream();
            orderForm.Save(ms, false);

            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ContentType = "application/pdf";
            HttpContext.Current.Response.AddHeader("content-length", ms.Length.ToString());
            HttpContext.Current.Response.BinaryWrite(ms.ToArray());
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + HttpContext.Current.Server.UrlEncode("HelvarButtonPanel.pdf") + "\"");
            HttpContext.Current.Response.Flush();
            ms.Close();
            HttpContext.Current.Response.End();
        }

        protected string checkStringLength(string label)
        {
            while (gfx.MeasureString(label, Arial8Regular).Width > BUTTON_WIDTH)
            {
                label = label.Substring(0, label.Length - 1);
            }

            return label;
        }
    }
}