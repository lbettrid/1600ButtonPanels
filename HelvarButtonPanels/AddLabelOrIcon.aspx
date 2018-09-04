<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLabelOrIcon.aspx.cs" Inherits="HelvarButtonPanels.AddLabelOrIcon" %>
<!DOCTYPE html>
<html class="fuelux" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>Helvar 1600 Panels: Add Labels and Icons</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <!--[if lt IE 9]>
		<script type="text/javascript">
			window.location = 'ie8.aspx';
		</script>
	<![endif]-->

    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/fuelux.min.css" />
	<link type="text/css" rel="stylesheet" href="css/jquery-ui-1.10.4.custom.min.css" />
	<link type="text/css" rel="stylesheet" href="styles.css" />
</head>
<body>
    <form runat="server" autocomplete="off">
		<div style="margin:30px;">
			<h1>1600 Series Button Labels and Icons</h1>
			<div class="defaultLabels" style="width:200px; display:inline-block; vertical-align: top;">
				<h4>Current Labels</h4>
				<table class="table table-striped table-condensed">
					<tbody>
						<!-- the label list is read from xml then inserted here via a template -->
					</tbody>
				</table>
			</div>
			<div class="defaultIcons" style="width:200px; display:inline-block; vertical-align: top; margin-left: 20px;">
				<h4>Current Icons</h4>
				<table class="table table-striped table-condensed">
					<tbody>
						<!-- the label list is read from xml then inserted here via a template -->
					</tbody>
				</table>
			</div>
			<div style="display:inline-block; vertical-align: top; margin-left: 20px;">
				<h4>New Item Information</h4>
				<p>Enter a valid code</p>
				<span style="display: inline-block; width: 60px;">Code :</span><asp:TextBox ID="ItemCode" Rows="1" runat="server"></asp:TextBox><br /><br />

				<p>Then either add the text for a new Label, <b><i>OR</i></b> add an image for a new Icon</p>

				<span style="display: inline-block; width: 60px;">Text :</span><asp:TextBox ID="LabelText" Rows="1" runat="server"></asp:TextBox><br /><br />

				<asp:FileUpload ID="IconUpload" runat="server" />
				<asp:Button ID="btnUpload" CssClass="btn btn-warning" runat="server" Text="Upload" OnClientClick="return ValidateFile()" OnClick="Upload" /><br /><br />

				<asp:Image ID="IconImage" Width="22" Height="20" runat="server" /><br /><br />

				<asp:Label ID="ErrorLabel" runat="server" Text="" ForeColor="Red" /><br /><br />

				<p class="alert-info">Icon files must be .png format and 22 pixels wide by 20 pixels high</p>

				<asp:Button ID="AddItemBtn" CssClass="btn btn-primary" OnClientClick="return ValidateCode()" OnClick="AddItem" runat="server" Text="Add Item"></asp:Button>
			</div>
		</div>
		<asp:HiddenField runat="server" ID="iconImageName" />
    </form>

	<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.10.4.custom.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/fuelux.min.js"></script>
    <script type="text/javascript" src="js/underscore-min.js"></script>
    <script type="text/javascript">
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@(.+?)\@\>/gim
    };
    </script>

	<!-- Template for displaying the current Labels -->
	<script type="text/html" id="labels_template">
        <@ _.each(items, function(item, index) { @>
            <tr style="height:40px;">
                <td>
                    <span><@= item.code @></span>
                </td>
                <td>
                    <span><@= item.label @></span>
                </td>
            </tr>
        <@ }); @>
    </script>

	<!-- Template for displaying the current Icons -->
	<script type="text/html" id="icons_template">
        <@ _.each(items, function(item, index) { @>
            <tr style="height:40px;">
                <td>
                    <span><@= item.code @></span>
                </td>
                <td>
                    <img src="images/icons/<@= item.icon @>.png" />
                </td>
            </tr>
        <@ }); @>
    </script>

	<script type="text/javascript">

		var labels = [];
		var icons = [];

		var labelsTemplate = _.template($('#labels_template').html());
		var iconsTemplate = _.template($('#icons_template').html());

		var validFilesTypes = ["png"];

		// get the current XML file and display the current Icons and Labels
		function getXML() {
			$.ajax({
				type: 'GET',
				url: 'labels.xml',
				dataType: 'xml',
				cache: false,
				success: function (xml, textStatus, jqXHR) {
					displayLabelsAndIcons(xml);
				},
				error: function (jqXHR, textStatus, errorThrown) {
					alert(textStatus + '\n\n' + errorThrown);
				}
			});
		}

		function displayLabelsAndIcons(xml) {
			$(xml).find('label').each(function (index) {
				labels[index] = {};
				labels[index].label = $(this).text();
				labels[index].code = $(this).attr('code');
			});

			$('.defaultLabels table tbody').fadeOut().html(labelsTemplate({ items: labels })).fadeIn();

			$(xml).find('icon').each(function (index) {
				icons[index] = {};
				icons[index].icon = $(this).text();
				icons[index].code = $(this).attr('code');
			});

			$('.defaultIcons table tbody').fadeOut().html(iconsTemplate({ items: icons })).fadeIn();
		}

		function ValidateCode() {
			var errorLbl = document.getElementById("<%=ErrorLabel.ClientID%>");
			var code = document.getElementById("<%=ItemCode.ClientID%>").value;
			
			errorLbl.innerHTML = "";
			
			if (/[A-Z][0-9] [A-Z][0-9]/.test(code)) {
				var i = 0;
				var codeUsed = false;

				for (i = 0; i < labels.length; i++) {

					if (code == labels[i].code) {
						codeUsed = true;
						break;
					}
				}

				if (codeUsed == false)
				{
					for (i = 0; i < icons.length; i++) {

						if (code == icons[i].code) {
							codeUsed = true;
							break;
						}
					}
				}

				if (codeUsed) {
					errorLbl.innerHTML = "Invalid Code. That code is already in use";
					return false;
				}
				else {
					return true;
				}
			}
			else {
				errorLbl.innerHTML = "Invalid Code. It must be in the format A1 A1";
				return false;
			}
		}

		function ValidateFile() {

			var errorLbl = document.getElementById("<%=ErrorLabel.ClientID%>");
			var file = document.getElementById("<%=IconUpload.ClientID%>");
			var path = file.value;
			var ext = path.substring(path.lastIndexOf(".") + 1, path.length).toLowerCase();
			var name = path.substring(path.lastIndexOf("\\") + 1, path.lastIndexOf("."));
			var isValidFile = false;

			$('#iconImageName').val('');
			errorLbl.innerHTML = "";

			for (var i = 0; i < validFilesTypes.length; i++) {
				if (ext == validFilesTypes[i]) {
					isValidFile = true;
					break;
				}
			}

			if (!isValidFile) {
				errorLbl.innerHTML = "Invalid File. Please upload a File with extension:\n\n" + validFilesTypes.join(", ");
			}

			return isValidFile;
		}

		$(document).ready(function () {

			getXML();

		});
	</script>
</body>
</html>
