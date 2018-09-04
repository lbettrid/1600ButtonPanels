<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HelvarButtonPanels._Default" %>
<!DOCTYPE html>
<html class="fuelux" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>Helvar 1600 Panel Button Configurator</title>
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
            <!--
            <div class="navbar navbar-custom" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                    </div>
                </div>
            </div>
            -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12 helvarBrand"></div>
				</div>
			</div>

			<h1 class="text-center">1600 Series Button Panel Wizard</h1>
			<div style="margin: 20px 10px;">
				<div id="panelWizard" class="wizard">
					<ul class="steps">
						<li data-step="1" class="active"><span class="badge badge-info">1</span>Panel Finish<span class="chevron"></span></li>
						<li data-step="2"><span class="badge">2</span>Button Layout<span class="chevron"></span></li>
						<li data-step="3"><span class="badge">3</span>Labels & Icons<span class="chevron"></span></li>
						<li data-step="4"><span class="badge">4</span>Review Panels<span class="chevron"></span></li>
						<li data-step="5"><span class="badge">5</span>Create PDF<span class="chevron"></span></li>
					</ul>
					<div class="actions">
						<button type="button" class="btn btn-default btn-prev"><span class="glyphicon glyphicon-arrow-left"></span>Prev</button>
						<button type="button" class="btn btn-default btn-next" data-last="Finish">Next<span class="glyphicon glyphicon-arrow-right"></span></button>
					</div>
					<div class="step-content">
						<div class="step-pane active" data-step="1">

							<h3 class="text-info">Select panel finish:</h3>
							<p>First select a panel finish, then you can specify the buttons and quantity you require.</p>
							<div class="panelStyles">
								<div>
									<h4>Stainless Steel 16xSS</h4>
									<img src="images/ss_1to1.png" alt="stainless steel finish" data-panel-style="ss" title="Stainless Steel" width="242" height="242" />
								</div>
								<div>
									<h4>Mirrored Steel 16xMS</h4>
									<img src="images/ms_1to1.png" alt="mirrored steel finish" data-panel-style="ms" title="Mirrored Steel" width="242" height="242" />
								</div>
								<div>
									<h4>Antique Bronze 16xAB</h4>
									<img src="images/ab_1to1.png" alt="antique bronze finish" data-panel-style="ab" title="Antique Bronze" width="242" height="242" />
								</div>
								<div>
									<h4>Polished Brass 16xPB</h4>
									<img src="images/pb_1to1.png" alt="polished brass finish" data-panel-style="pb" title="Brass" width="242" height="242" />
								</div>
								<div>
									<h4>Black Nickel 16xBN</h4>
									<img src="images/bn_1to1.png" alt="black nickel finish" data-panel-style="bn" title="Black" width="242" height="242" />
								</div>
								<div>
									<h4>Polished Nickel 16xPN</h4>
									<img src="images/pn_1to1.png" alt="polished nickel finish" data-panel-style="pn" title="Black" width="242" height="242" />
								</div>
								<div>
									<h4>Painted White 16xWH</h4>
									<img src="images/wh_1to1.png" alt="painted white metal finish" data-panel-style="wh" title="Black" width="242" height="242" />
								</div>
							</div>

						</div>

						<div class="step-pane" data-step="2">

							<h3 class="text-info">Select button layout:</h3>
							<p>Select from standard button layouts and labels, or a standard button layout with your own labels.<br />It is also possible to specify your own button layouts and labels but this may increase cost and lead time.</p>
							<div style="margin:30px 0 60px 0;">
								<h4 class="text-info">Standard button layouts and labels.</h4>
								<div class="panelTypes Thumbnails panelStandardLayouts">
									<!-- panel type thumbnails inserted via a template using the panel style selected from step 1 -->
								</div>
							</div>
							<div style="margin-bottom:60px;">
								<h4 class="text-info">Standard button layouts. Choose your own labels.</h4>
								<div class="panelTypes Thumbnails panelLayouts">
									<!-- panel type thumbnails inserted via a template using the panel style selected from step 1 -->
								</div>
							</div>
							<div style="margin-bottom:60px;">
								<h4 class="text-info">Choose your own button layout and labels!</h4>
								<div class="panelTypes Thumbnails customLayout" style="display:inline-block;">
									<!-- panel type thumbnails inserted via a template using the panel style selected from step 1 -->
								</div>
								<div style="display:inline-block;vertical-align:top;"><p>Please note we would need to confirm lead times for non standard panels!</p></div>
							</div>
							<div class="customPanelMaker">
								<h4>Click on the panel to place your buttons. Click a button again to remove it.</h4>
								<div class="ButtonPanel customButtonPanel">
									<div class="ButtonPanelInner customButtonPanelInner">
										<!-- button panel templates go here via a click on a panel thumbnail -->
									</div>
								</div>
							</div>

						</div>

						<div class="step-pane" data-step="3">

							<h3 class="text-info editingTitle">Drag and drop icons or labels onto the buttons:</h3>
							<h3 class="text-info nonEditingTitle">Check button labels and enter the quantity of this panel you require:</h3>

							<div class="editingInst" style="margin-top:20px;">
								<div style="display:inline-block;width:375px;margin-right:10px;text-align:center;">
									<span class="glyphicon glyphicon-info-sign"></span><span class="text-info"><i>&nbsp;Specify a blank button using the empty icon</i></span>
								</div>
								<div style="display:inline-block;width:323px;text-align:center;">
									<span class="glyphicon glyphicon-info-sign"></span><span class="text-info"><i>&nbsp;Click on a button label to edit the text</i></span>
								</div>
							</div>

							<div style="margin:10px 0;">
								<div>
									<div style="display:inline-block;margin-right:20px;vertical-align:top;">

										<div class="ButtonPanel">
											<div class="ButtonPanelInner">
												<!-- button panel templates go here via a click on a panel thumbnail -->
											</div>
										</div>

										<div style="display:inline-block;height:300px;vertical-align:top;padding-top:20px;">
											<p class="sapNumber text-center text-info">Part No. <b></b></p>
											<table>
												<tr>
													<td class="text-right customerInfo"><b>Quantity of this panel:</b></td>
													<td><input type="number" id="panelQuantity" name="panelQuantity" min="1" value="1" class="input-sm" /></td>
												</tr>
												<tr>
													<td class="text-right customerInfo"><b>Notes regarding this panel:</b></td>
													<td><textarea id="panelNotes" name="panelNotes"></textarea></td>
												</tr>
											</table>
										</div>

									</div>

									<div style="display:inline-block;margin-right:10px;vertical-align:top;">

										<div class="defaultIcons">
											<table class="table table-striped table-condensed">
												<tbody>
													<!-- the icon list is read from xml then inserted here via a template -->
												</tbody>
											</table>
										</div>

									</div>
									<div style="display:inline-block;margin-left:10px;vertical-align:top;">

										<div class="defaultLabels">
											<table class="table table-striped table-condensed">
												<tbody>
													<!-- the label list is read from xml then inserted here via a template -->
												</tbody>
											</table>
										</div>

									</div>

								</div>
								
							</div>

						</div>

						<div class="step-pane" data-step="4">

							<h3 class="text-info">Your panels</h3>
							<div class="yourPanelsCont">
								<!-- show the existing panels in here -->
							</div>
							<div>
								<h4>Would you like to specify another panel or export your completed panels to pdf?</h4>
								<button id="newPnlBtn" class="btn btn-primary" type="button">New Panel</button>
								<button id="getCustomerInfoBtn" class="btn btn-primary" type="button">Export Panels</button>
							</div>

						</div>

						<div class="step-pane" data-step="5">

							<table class="customerInfoTbl">
								<tr>
									<td class="text-right customerInfo">
										<b>Customer Name:</b>
									</td>
									<td class="customerInfo">
										<asp:TextBox runat="server" AutoPostBack="false" EnableViewState="true" id="custNameInp"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td class="text-right customerInfo">
										<b>Company Name:</b>
									</td>
									<td class="customerInfo">
										<asp:TextBox runat="server" AutoPostBack="false" EnableViewState="true" id="compNameInp"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td class="text-right customerInfo">
										<b>Contact Number:</b>
									</td>
									<td class="customerInfo">
										<asp:TextBox runat="server" AutoPostBack="false" EnableViewState="true" id="contNumInp"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td class="text-right customerInfo">
										<b>Email Address:</b>
									</td>
									<td class="customerInfo">
										<asp:TextBox runat="server" AutoPostBack="false" EnableViewState="true" id="emailAddInp"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td class="text-right customerInfo">
										<b>Project Name:</b>
									</td>
									<td class="customerInfo">
										<asp:TextBox runat="server" AutoPostBack="false" EnableViewState="true" id="projNameInp"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td class="text-right customerInfo">
										<b>Customer Order Number:</b>
									</td>
									<td class="customerInfo">
										<asp:TextBox runat="server" AutoPostBack="false" EnableViewState="true" id="ordNumInp"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td class="text-right customerInfo">
										<b>Helvar Order Number:</b>
									</td>
									<td class="customerInfo">
										<asp:TextBox runat="server" AutoPostBack="false" EnableViewState="true" id="helvarOrdNumInp"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td class="text-right customerInfo">
										<asp:Button runat="server" ID="exportPnlBtn" CssClass="btn btn-primary" Text="Create PDF" OnClick="exportPDF_Click" />
									</td>
									<td class="customerInfo"></td>
								</tr>
							</table>

						</div>

					</div>
				</div>
			</div>

			<!-- CUSTOMER INFO -->
            <asp:HiddenField runat="server" ID="panelData" />
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

		<!-- STEP 2 template panel layout thumbnails template -->
		<script type="text/html" id="standard_layouts_template">
			<table>
                <tr>
                    <td style="text-align:center;"><img src="images/<@= style @>_2_button_thumbnail.png" alt="2 button panel" data-panel-layout="161" /><br />161<span style="text-transform:uppercase;"><@= style @></span></td>
					<td style="text-align:center;"><img src="images/<@= style @>_2_button_thumbnail.png" alt="2 button panel" data-panel-layout="162" /><br />162<span style="text-transform:uppercase;"><@= style @></span></td>
                    <td style="text-align:center;"><img src="images/<@= style @>_4_button_thumbnail.png" alt="4 button panel" data-panel-layout="163" /><br />163<span style="text-transform:uppercase;"><@= style @></span></td>
                    <td style="text-align:center;"><img src="images/<@= style @>_5_button_thumbnail.png" alt="5 button panel" data-panel-layout="164" /><br />164<span style="text-transform:uppercase;"><@= style @></span></td>
                    <td style="text-align:center;"><img src="images/<@= style @>_7_button_thumbnail.png" alt="7 button panel" data-panel-layout="165" /><br />165<span style="text-transform:uppercase;"><@= style @></span></td>
                    <td style="text-align:center;"><img src="images/<@= style @>_10_button_thumbnail.png" alt="10 button panel" data-panel-layout="166" /><br />166<span style="text-transform:uppercase;"><@= style @></span></td>
					<td style="text-align:center;"><img src="images/<@= style @>_10_button_thumbnail.png" alt="10 button panel" data-panel-layout="169" /><br />169<span style="text-transform:uppercase;"><@= style @></span></td>
                </tr>
            </table>
		</script>

		<script type="text/html" id="layouts_template">
			<table>
                <tr>
                    <td style="text-align:center;"><img src="images/<@= style @>_2_button_thumbnail.png" alt="2 button panel" data-panel-layout="161" /><br />161<span style="text-transform:uppercase;"><@= style @>L</span></td>
                    <td style="text-align:center;"><img src="images/<@= style @>_4_button_thumbnail.png" alt="4 button panel" data-panel-layout="163" /><br />163<span style="text-transform:uppercase;"><@= style @>L</span></td>
                    <td style="text-align:center;"><img src="images/<@= style @>_5_button_thumbnail.png" alt="5 button panel" data-panel-layout="164" /><br />164<span style="text-transform:uppercase;"><@= style @>L</span></td>
                    <td style="text-align:center;"><img src="images/<@= style @>_7_button_thumbnail.png" alt="7 button panel" data-panel-layout="165" /><br />165<span style="text-transform:uppercase;"><@= style @>L</span></td>
                    <td style="text-align:center;"><img src="images/<@= style @>_10_button_thumbnail.png" alt="10 button panel" data-panel-layout="166" /><br />166<span style="text-transform:uppercase;"><@= style @>L</span></td>
                </tr>
            </table>
		</script>

		<script type="text/html" id="customLayout_template">
			<table>
				<tr>
					<td><img src="images/<@= style @>_thumbnail.png" alt="custom button panel" data-panel-layout="custom" /></td>
				</tr>
			</table>
		</script>

		<script type="text/html" id="placeButtons_template">
			<img src="images/<@= style @>_1to1.png" alt="hidden" width="323" height="323" />
			<button type="button" class="btn btn-success btn-sm acceptButtonsBtn" title="Accept Panel" style="position:absolute;top:10px;left:280px;display:none;">
				<span class="glyphicon glyphicon-ok"></span>
			</button>
			<div class="btnPlaceHolder" style="left:77px;top:77px;" data-location="LEFT" data-position="1" data-index="0" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:77px;top:111px;" data-location="LEFT" data-position="2" data-index="1" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:77px;top:147px;" data-location="LEFT" data-position="3" data-index="2" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:77px;top:182px;" data-location="LEFT" data-position="4" data-index="3" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:77px;top:216px;" data-location="LEFT" data-position="5" data-index="4" onclick="toggleButton(event)"></div>

			<div class="btnPlaceHolder" style="left:125px;top:77px;" data-location="CENTER" data-position="1" data-index="5" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:125px;top:111px;" data-location="CENTER" data-position="2" data-index="6" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:125px;top:147px;" data-location="CENTER" data-position="3" data-index="7" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:125px;top:182px;" data-location="CENTER" data-position="4" data-index="8" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:125px;top:216px;" data-location="CENTER" data-position="5" data-index="9" onclick="toggleButton(event)"></div>

			<div class="btnPlaceHolder" style="left:175px;top:77px;" data-location="RIGHT" data-position="1" data-index="10" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:175px;top:111px;" data-location="RIGHT" data-position="2" data-index="11" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:175px;top:147px;" data-location="RIGHT" data-position="3" data-index="12" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:175px;top:182px;" data-location="RIGHT" data-position="4" data-index="13" onclick="toggleButton(event)"></div>
			<div class="btnPlaceHolder" style="left:175px;top:216px;" data-location="RIGHT" data-position="5" data-index="14" onclick="toggleButton(event)"></div>
		</script>

		<!-- STEP 3 button template -->
		<script type="text/html" id="custom_btn_template">
			<img src="images/<@= panel.style @>_1to1.png" alt="panel" width="323" height="323" />
			<button type="button" class="btn btn-success btn-sm panelCompleteBtn" title="Accept Panel" style="position:absolute;top:10px;left:280px;display:none;">
				<span class="glyphicon glyphicon-ok"></span>
			</button>
			<@ _.each(panel.buttons, function(button, index) { @>
				<@ if (button !== null) { @>
					<@ if (button.location.indexOf('RIGHT') >= 0) { @>
						<img id="btn_img_<@= index @>" class="droppable" data-id="<@= index @>" src="images/button_right.png" width="71" height="27" alt="button" style="position:absolute;left:<@= configurator['BTN_' + button.location][0] @>px;top:<@= configurator['BTN_' + button.location][1] @>px;" />
					<@ } else { @>
						<img id="btn_img_<@= index @>" class="droppable" data-id="<@= index @>" src="images/button_left.png" width="71" height="27" alt="button" style="position:absolute;left:<@= configurator['BTN_' + button.location][0] @>px;top:<@= configurator['BTN_' + button.location][1] @>px;" />
					<@ } @>
					<div id="btn_icn_<@= index @>" style="position:absolute;left:<@= configurator['ICN_' + button.location][0] @>px;top:<@= configurator['ICN_' + button.location][1] @>px;width:22px;height:20px;"></div>
					<input id="btn_inp_<@= index @>" data-id="<@= index @>" type="text" class="sizedTextBox" style="position:absolute;left:<@= configurator['LBL_' + button.location][0] @>px;top:<@= configurator['LBL_' + button.location][1] @>px;" />
				<@ } @>
			<@ }); @>
		</script>

		<!-- STEP 3 icons and labels templates -->
        <script type="text/html" id="labels_template">
            <@ _.each(items, function(item, index) { @>
                <tr>
                    <td>
                        <span data-type="text" data-label="<@= item.label_0 @>" class="draggable"><@= item.label_0 @></span>
                    </td>
                    <td>
                    <@ if (item.label_1) { @>
                        <span data-type="text" data-label="<@= item.label_1 @>" class="draggable"><@= item.label_1 @></span>
                    <@ } @>
                    </td>
                    <td>
                    <@ if (item.label_2) { @>
                        <span data-type="text" data-label="<@= item.label_2 @>" class="draggable"><@= item.label_2 @></span>
                    <@ } @>
                    </td>
					<td>
                    <@ if (item.label_3) { @>
                        <span data-type="text" data-label="<@= item.label_3 @>" class="draggable"><@= item.label_3 @></span>
                    <@ } @>
                    </td>
					<td>
                    <@ if (item.label_4) { @>
                        <span data-type="text" data-label="<@= item.label_4 @>" class="draggable"><@= item.label_4 @></span>
                    <@ } @>
                    </td>
                </tr>
            <@ }); @>
        </script>

        <script type="text/html" id="icons_template">
            <@ _.each(items, function(item, index) { @>
                <tr>
                    <td>
                        <img src="images/icons/<@= item.label_0 @>.png" data-type="icon" data-label="<@= item.label_0 @>" class="draggable" />
                    </td>
                    <td>
                    <@ if (item.label_1) { @>
                        <img src="images/icons/<@= item.label_1 @>.png" data-type="icon" data-label="<@= item.label_1 @>" class="draggable" />
                    <@ } @>
                     </td>
                    <td>
                    <@ if (item.label_2) { @>
                        <img src="images/icons/<@= item.label_2 @>.png" data-type="icon" data-label="<@= item.label_2 @>" class="draggable" />
                    <@ } @>
                    </td>
					<td>
                    <@ if (item.label_3) { @>
                        <img src="images/icons/<@= item.label_3 @>.png" data-type="icon" data-label="<@= item.label_3 @>" class="draggable" />
                    <@ } @>
                    </td>
                </tr>
            <@ }); @>
        </script>

		<!-- STEP 4 your panels template -->
		<script type="text/html" id="yourPanel_Template">
			<@ _.each(panels, function(panel, index) { @>
				<div style="display:inline-block;text-align:center;margin:15px;width:323px;vertical-align:top;">
					<div class="ButtonPanel">
						<div class="ButtonPanelInner">
							<img src="images/<@= panel.style @>_1to1.png" alt="panel" width="323" height="323" />
							<@ _.each(panel.buttons, function(button, index) { @>
								<@ if (button !== null) { @>
									<@ if (button.location.indexOf('RIGHT') >= 0) { @>
										<img src="images/button_right.png" width="71" height="27" alt="button" style="position:absolute;left:<@= configurator['BTN_' + button.location][0] @>px;top:<@= configurator['BTN_' + button.location][1] @>px;" />
									<@ } else { @>
										<img src="images/button_left.png" width="71" height="27" alt="button" style="position:absolute;left:<@= configurator['BTN_' + button.location][0] @>px;top:<@= configurator['BTN_' + button.location][1] @>px;" />
									<@ } @>
									<@ if (button.icon !== null) { @>
										<div style="position:absolute;left:<@= configurator['ICN_' + button.location][0] @>px;top:<@= configurator['ICN_' + button.location][1] @>px;width:22px;height:20px;background-image:url('images/icons/<@= button.icon @>.png')"></div>
									<@ } @>
									<span class="sizedTextBox" style="position:absolute;left:<@= configurator['LBL_' + button.location][0] @>px;top:<@= configurator['LBL_' + button.location][1] @>px;"><@= button.label @></span>
								<@ } @>
							<@ }); @>
						</div>
					</div>
					<b>Part No : </b><span class="text-info"><@= panel.SAP @></span><br />
					<b>Quantity : </b><span class="text-info"><@= panel.quantity @></span><br />
					<b>Notes : </b><span class="text-info"><@= panel.notes @></span>
				</div>
			<@ }); @>
		</script>

        <script type="text/javascript">
        	var configurator = {};

        	configurator.BTN_LEFT_1 = [77, 77];
        	configurator.BTN_LEFT_2 = [77, 111];
        	configurator.BTN_LEFT_3 = [77, 147];
        	configurator.BTN_LEFT_4 = [77, 182];
        	configurator.BTN_LEFT_5 = [77, 216];

        	configurator.BTN_CENTER_1 = [125, 77];
        	configurator.BTN_CENTER_2 = [125, 111];
        	configurator.BTN_CENTER_3 = [125, 147];
        	configurator.BTN_CENTER_4 = [125, 182];
        	configurator.BTN_CENTER_5 = [125, 216];

        	configurator.BTN_RIGHT_1 = [175, 77];
        	configurator.BTN_RIGHT_2 = [175, 111];
        	configurator.BTN_RIGHT_3 = [175, 147];
        	configurator.BTN_RIGHT_4 = [175, 182];
        	configurator.BTN_RIGHT_5 = [175, 216];

        	configurator.ICN_LEFT_1 = [102, 81];
        	configurator.ICN_LEFT_2 = [102, 115];
        	configurator.ICN_LEFT_3 = [102, 150];
        	configurator.ICN_LEFT_4 = [102, 185];
        	configurator.ICN_LEFT_5 = [102, 220];

        	configurator.ICN_CENTER_1 = [152, 81];
        	configurator.ICN_CENTER_2 = [152, 115];
        	configurator.ICN_CENTER_3 = [152, 150];
        	configurator.ICN_CENTER_4 = [152, 185];
        	configurator.ICN_CENTER_5 = [152, 220];

        	configurator.ICN_RIGHT_1 = [197, 81];
        	configurator.ICN_RIGHT_2 = [197, 115];
        	configurator.ICN_RIGHT_3 = [197, 150];
        	configurator.ICN_RIGHT_4 = [197, 185];
        	configurator.ICN_RIGHT_5 = [197, 220];

        	configurator.LBL_LEFT_1 = [91, 84];
        	configurator.LBL_LEFT_2 = [91, 118];
        	configurator.LBL_LEFT_3 = [91, 153];
        	configurator.LBL_LEFT_4 = [91, 188];
        	configurator.LBL_LEFT_5 = [91, 223];

        	configurator.LBL_CENTER_1 = [139, 84];
        	configurator.LBL_CENTER_2 = [139, 118];
        	configurator.LBL_CENTER_3 = [139, 153];
        	configurator.LBL_CENTER_4 = [139, 188];
        	configurator.LBL_CENTER_5 = [139, 223];

        	configurator.LBL_RIGHT_1 = [179, 84];
        	configurator.LBL_RIGHT_2 = [179, 118];
        	configurator.LBL_RIGHT_3 = [179, 153];
        	configurator.LBL_RIGHT_4 = [179, 188];
        	configurator.LBL_RIGHT_5 = [179, 223];

            configurator.currentStyle;

            configurator.panels = [];
            configurator.currentPanelNum = 0;
            configurator.tempPanel = null;

            configurator.labelCodes = {};
            configurator.iconCodes = {};

			// stepsOpen is used to control the availability of the wizards 'Next' button. the wizard steps start from 1 so this array will not use zero index
            configurator.stepsOpen = [null, true, false, false, false, false];

            configurator.standardLayoutsTemplate = _.template($('#standard_layouts_template').html());
            configurator.layoutsTemplate = _.template($('#layouts_template').html());
            configurator.customLayoutTemplate = _.template($('#customLayout_template').html());
            configurator.placeButtonsTemplate = _.template($('#placeButtons_template').html());

            configurator.buttonTemplate = _.template($('#custom_btn_template').html());

            configurator.labelsTemplate = _.template($('#labels_template').html());
            configurator.iconsTemplate = _.template($('#icons_template').html());
            configurator.yourPanelTemplate = _.template($('#yourPanel_Template').html());

            // after the list of labels and icons has been read out from the xml file
            // group them into columns and build the html to display them

            function buildLabelList(allLabels) {
                var COLUMNS = 5, counter = 0;
                var labelList = [];

                for (var i = 0; i < allLabels.length; i += COLUMNS) {
                    labelList[counter] = {};

                    for (var inner = 0; inner < COLUMNS; inner++) {
                        if (i + inner < allLabels.length) {
                            labelList[counter]['label_' + inner] = allLabels[i + inner];
                        }
                    }

                    counter++;
                }

                $('.defaultLabels table tbody').html(configurator.labelsTemplate({ items: labelList }));
            }

            function buildIconList(allIcons) {
                var COLUMNS = 4, counter = 0;
                var iconList = [];

                for (var i = 0; i < allIcons.length; i += COLUMNS) {
                    iconList[counter] = {};

                    for (var inner = 0; inner < COLUMNS; inner++) {
                        if (i + inner < allIcons.length) {
                            iconList[counter]['label_' + inner] = allIcons[i + inner];
                        }
                    }

                    counter++;
                }

                $('.defaultIcons table tbody').html(configurator.iconsTemplate({ items: iconList }));
            }

        	// *************************************************************************************************
        	// *************************************************************************************************

        	//when a panel finish thumbnail is clicked in step 1, create or recreate a new panel

            function createPanelObj(layout) {
            	var panelIndex = configurator.currentPanelNum;
            	configurator.panels[panelIndex] = {
            		style: configurator.currentStyle,
            		SAP: (layout.SAP) ? layout.SAP.toUpperCase() : 'CUSTOM',
                    buttons: [null, null, null, null, null, null, null, null, null, null],
                    quantity: 1,
					notes: ''
                };

            	for (var customBtnIndex = 0, btnIndex = 0; customBtnIndex < layout.buttons.length && btnIndex < configurator.panels[panelIndex].buttons.length; customBtnIndex++) {

            		if (layout.buttons[customBtnIndex] !== null) {
            			configurator.panels[panelIndex].buttons[btnIndex] = { location: layout.buttons[customBtnIndex], label: null, icon: null, code: null };
            			btnIndex++;
            		}
            	}
            }

        	// *************************************************************************************************
        	// *************************************************************************************************

            // once document has loaded read the xml label list and attach click handlers
            $(document).ready(function () {

            	$('.customPanelMaker').hide();
            	$('.actions .btn-next').addClass('disabled').prop('disabled', true);

            	$(document).keydown(function (e) {
            		if (e.which === 13) {
						//enter key
            			e.preventDefault();

            			if ($(e.target).hasClass('sizedTextBox')) {
            				$(e.target).trigger('blur');
            			}
            		}
            		else if (e.which === 46 || e.which === 8) {
						//delete || backspace key
            		    if ($(e.target).hasClass('sizedTextBox')) {

            		        var index = parseInt($(e.target).data('id'), 10);

            		        if (configurator.panels[configurator.currentPanelNum].buttons[index].icon !== null) {
            		            $('#btn_icn_' + index).css('background-image', 'url()');
            		            configurator.panels[configurator.currentPanelNum].buttons[index].icon = null;
            		            configurator.panels[configurator.currentPanelNum].buttons[index].code = null;

            		            completeBtnVisible();
            		        }
            			}
            		}
            	});

            	// *************************************************************************************************
            	// *************************************************************************************************
            	// get the xml list of labels and icons
            	$.ajax({
            		type: 'GET',
            		url: 'labels.xml',
            		dataType: 'xml',
            		success: function (xml, textStatus, jqXHR) {

            			var allLabels = [], allIcons = [];

            			$(xml).find('label').each(function (index) {
            			    allLabels[index] = $(this).text();
            			    configurator.labelCodes[allLabels[index]] = $(this).attr('code');
            			});

            			buildLabelList(allLabels);

            			$(xml).find('icon').each(function (index) {
            			    allIcons[index] = $(this).text();
            			    configurator.iconCodes[allIcons[index]] = $(this).attr('code');
            			});

            			buildIconList(allIcons);

            			// STEP 3. the drag and drop functionality
            			$('.draggable').draggable({
            				helper: 'clone',
            				cursorAt: { top: 2 },
            				zIndex: 100
            			});

            			$('#panelWizard').wizard();
            		},
            		error: function (jqXHR, textStatus, errorThrown) {
            			alert(textStatus + '\n\n' + errorThrown);
            		}
            	});

            	// *************************************************************************************************
            	// *************************************************************************************************
            	// STEP 1. panel style thumbnails click handler
            	$('.panelStyles img').click(function () {
            		configurator.currentStyle = $(this).data('panel-style');
            		$('.panelStandardLayouts').html(configurator.standardLayoutsTemplate({ style: configurator.currentStyle }));
            		$('.panelLayouts').html(configurator.layoutsTemplate({ style: configurator.currentStyle }));
            		$('.customLayout').html(configurator.customLayoutTemplate({ style: configurator.currentStyle }));
            		$('.customPanelMaker').hide();

            		configurator.stepsOpen[2] = true;
            		$('#panelWizard').wizard('next');
            	});

            	// *************************************************************************************************
            	// *************************************************************************************************
            	// STEP 2. panel layout thumbnails click handler
            	$('.panelStandardLayouts').on('click', 'img', function () {
            		var panelType = '' + $(this).data('panel-layout');

            		configurator.tempPanel = {
            			style: configurator.currentStyle,
            			SAP: panelType + configurator.currentStyle,
            			buttons: [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]
            		};

            		switch (panelType) {
            			case '161':
            				configurator.tempPanel.buttons[0] = 'CENTER_2';
            				configurator.tempPanel.buttons[1] = 'CENTER_4';

            				createPanelObj(configurator.tempPanel);

            				configurator.panels[configurator.currentPanelNum].buttons[0].code = 'S1 A3';
            				configurator.panels[configurator.currentPanelNum].buttons[0].icon = 'line';
            				configurator.panels[configurator.currentPanelNum].buttons[1].code = 'S1 A2';
            				configurator.panels[configurator.currentPanelNum].buttons[1].icon = 'circleEmptyLarge';
            				break;
            			case '162':
            				configurator.tempPanel.buttons[0] = 'CENTER_2';
            				configurator.tempPanel.buttons[1] = 'CENTER_4';

            				createPanelObj(configurator.tempPanel);

            				configurator.panels[configurator.currentPanelNum].buttons[0].code = 'S1 E5';
            				configurator.panels[configurator.currentPanelNum].buttons[0].icon = 'arrowUp';
            				configurator.panels[configurator.currentPanelNum].buttons[1].code = 'S1 D5';
            				configurator.panels[configurator.currentPanelNum].buttons[1].icon = 'arrowDown';
            				break;
            			case '163':
            				configurator.tempPanel.buttons[0] = 'LEFT_2';
            				configurator.tempPanel.buttons[1] = 'LEFT_4';
            				configurator.tempPanel.buttons[2] = 'RIGHT_2';
            				configurator.tempPanel.buttons[3] = 'RIGHT_4';

            				createPanelObj(configurator.tempPanel);

            				configurator.panels[configurator.currentPanelNum].buttons[0].code = 'S1 A3';
            				configurator.panels[configurator.currentPanelNum].buttons[0].icon = 'line';
            				configurator.panels[configurator.currentPanelNum].buttons[1].code = 'S1 A2';
            				configurator.panels[configurator.currentPanelNum].buttons[1].icon = 'circleEmptyLarge';
            				configurator.panels[configurator.currentPanelNum].buttons[2].code = 'S1 E5';
            				configurator.panels[configurator.currentPanelNum].buttons[2].icon = 'arrowUp';
            				configurator.panels[configurator.currentPanelNum].buttons[3].code = 'S1 E6';
            				configurator.panels[configurator.currentPanelNum].buttons[3].icon = 'arrowDown';
            				break;
            			case '164':
            				configurator.tempPanel.buttons[0] = 'CENTER_1';
            				configurator.tempPanel.buttons[1] = 'CENTER_2';
            				configurator.tempPanel.buttons[2] = 'CENTER_3';
            				configurator.tempPanel.buttons[3] = 'CENTER_4';
            				configurator.tempPanel.buttons[4] = 'CENTER_5';

            				createPanelObj(configurator.tempPanel);

            				configurator.panels[configurator.currentPanelNum].buttons[0].code = 'S9 A1';
            				configurator.panels[configurator.currentPanelNum].buttons[0].icon = 'one';
            				configurator.panels[configurator.currentPanelNum].buttons[1].code = 'S9 B1';
            				configurator.panels[configurator.currentPanelNum].buttons[1].icon = 'two';
            				configurator.panels[configurator.currentPanelNum].buttons[2].code = 'S9 C1';
            				configurator.panels[configurator.currentPanelNum].buttons[2].icon = 'three';
            				configurator.panels[configurator.currentPanelNum].buttons[3].code = 'S9 D1';
            				configurator.panels[configurator.currentPanelNum].buttons[3].icon = 'four';
            				configurator.panels[configurator.currentPanelNum].buttons[4].code = 'S1 A2';
            				configurator.panels[configurator.currentPanelNum].buttons[4].icon = 'circleEmptyLarge';
            				break;
            			case '165':
            				configurator.tempPanel.buttons[0] = 'LEFT_1';
            				configurator.tempPanel.buttons[1] = 'LEFT_2';
            				configurator.tempPanel.buttons[2] = 'LEFT_3';
            				configurator.tempPanel.buttons[3] = 'LEFT_4';
            				configurator.tempPanel.buttons[4] = 'LEFT_5';
            				configurator.tempPanel.buttons[5] = 'RIGHT_2';
            				configurator.tempPanel.buttons[6] = 'RIGHT_4';

            				createPanelObj(configurator.tempPanel);

            				configurator.panels[configurator.currentPanelNum].buttons[0].code = 'S9 A1';
            				configurator.panels[configurator.currentPanelNum].buttons[0].icon = 'one';
            				configurator.panels[configurator.currentPanelNum].buttons[1].code = 'S9 B1';
            				configurator.panels[configurator.currentPanelNum].buttons[1].icon = 'two';
            				configurator.panels[configurator.currentPanelNum].buttons[2].code = 'S9 C1';
            				configurator.panels[configurator.currentPanelNum].buttons[2].icon = 'three';
            				configurator.panels[configurator.currentPanelNum].buttons[3].code = 'S9 D1';
            				configurator.panels[configurator.currentPanelNum].buttons[3].icon = 'four';
            				configurator.panels[configurator.currentPanelNum].buttons[4].code = 'S1 A2';
            				configurator.panels[configurator.currentPanelNum].buttons[4].icon = 'circleEmptyLarge';
            				configurator.panels[configurator.currentPanelNum].buttons[5].code = 'S1 E5';
            				configurator.panels[configurator.currentPanelNum].buttons[5].icon = 'arrowUp';
            				configurator.panels[configurator.currentPanelNum].buttons[6].code = 'S1 E6';
            				configurator.panels[configurator.currentPanelNum].buttons[6].icon = 'arrowDown';
            				break;
            			case '166':
            				configurator.tempPanel.buttons[0] = 'LEFT_1';
            				configurator.tempPanel.buttons[1] = 'LEFT_2';
            				configurator.tempPanel.buttons[2] = 'LEFT_3';
            				configurator.tempPanel.buttons[3] = 'LEFT_4';
            				configurator.tempPanel.buttons[4] = 'LEFT_5';
            				configurator.tempPanel.buttons[5] = 'RIGHT_1';
            				configurator.tempPanel.buttons[6] = 'RIGHT_2';
            				configurator.tempPanel.buttons[7] = 'RIGHT_3';
            				configurator.tempPanel.buttons[8] = 'RIGHT_4';
            				configurator.tempPanel.buttons[9] = 'RIGHT_5';

            				createPanelObj(configurator.tempPanel);

            				configurator.panels[configurator.currentPanelNum].buttons[0].code = 'S9 A1';
            				configurator.panels[configurator.currentPanelNum].buttons[0].icon = 'one';
            				configurator.panels[configurator.currentPanelNum].buttons[1].code = 'S9 B1';
            				configurator.panels[configurator.currentPanelNum].buttons[1].icon = 'two';
            				configurator.panels[configurator.currentPanelNum].buttons[2].code = 'S9 C1';
            				configurator.panels[configurator.currentPanelNum].buttons[2].icon = 'three';
            				configurator.panels[configurator.currentPanelNum].buttons[3].code = 'S9 D1';
            				configurator.panels[configurator.currentPanelNum].buttons[3].icon = 'four';
            				configurator.panels[configurator.currentPanelNum].buttons[4].code = 'S9 E1';
            				configurator.panels[configurator.currentPanelNum].buttons[4].icon = 'five';
            				configurator.panels[configurator.currentPanelNum].buttons[5].code = 'S9 A2';
            				configurator.panels[configurator.currentPanelNum].buttons[5].icon = 'six';
            				configurator.panels[configurator.currentPanelNum].buttons[6].code = 'S9 B2';
            				configurator.panels[configurator.currentPanelNum].buttons[6].icon = 'seven';
            				configurator.panels[configurator.currentPanelNum].buttons[7].code = 'S1 E5';
            				configurator.panels[configurator.currentPanelNum].buttons[7].icon = 'arrowUp';
            				configurator.panels[configurator.currentPanelNum].buttons[8].code = 'S1 E6';
            				configurator.panels[configurator.currentPanelNum].buttons[8].icon = 'arrowDown';
            				configurator.panels[configurator.currentPanelNum].buttons[9].code = 'S1 A2';
            				configurator.panels[configurator.currentPanelNum].buttons[9].icon = 'circleEmptyLarge';
            				break;
            			case '169':
            				configurator.tempPanel.buttons[0] = 'LEFT_1';
            				configurator.tempPanel.buttons[1] = 'LEFT_2';
            				configurator.tempPanel.buttons[2] = 'LEFT_3';
            				configurator.tempPanel.buttons[3] = 'LEFT_4';
            				configurator.tempPanel.buttons[4] = 'LEFT_5';
            				configurator.tempPanel.buttons[5] = 'RIGHT_1';
            				configurator.tempPanel.buttons[6] = 'RIGHT_2';
            				configurator.tempPanel.buttons[7] = 'RIGHT_3';
            				configurator.tempPanel.buttons[8] = 'RIGHT_4';
            				configurator.tempPanel.buttons[9] = 'RIGHT_5';

            				createPanelObj(configurator.tempPanel);

            				configurator.panels[configurator.currentPanelNum].buttons[0].code = 'S9 A1';
            				configurator.panels[configurator.currentPanelNum].buttons[0].icon = 'one';
            				configurator.panels[configurator.currentPanelNum].buttons[1].code = 'S9 B1';
            				configurator.panels[configurator.currentPanelNum].buttons[1].icon = 'two';
            				configurator.panels[configurator.currentPanelNum].buttons[2].code = 'S9 C1';
            				configurator.panels[configurator.currentPanelNum].buttons[2].icon = 'three';
            				configurator.panels[configurator.currentPanelNum].buttons[3].code = 'S9 D1';
            				configurator.panels[configurator.currentPanelNum].buttons[3].icon = 'four';
            				configurator.panels[configurator.currentPanelNum].buttons[4].code = 'S9 E1';
            				configurator.panels[configurator.currentPanelNum].buttons[4].icon = 'five';
            				configurator.panels[configurator.currentPanelNum].buttons[5].code = 'S9 A2';
            				configurator.panels[configurator.currentPanelNum].buttons[5].icon = 'six';
            				configurator.panels[configurator.currentPanelNum].buttons[6].code = 'S9 B2';
            				configurator.panels[configurator.currentPanelNum].buttons[6].icon = 'seven';
            				configurator.panels[configurator.currentPanelNum].buttons[7].code = 'S9 C2';
            				configurator.panels[configurator.currentPanelNum].buttons[7].icon = 'eight';
            				configurator.panels[configurator.currentPanelNum].buttons[8].code = 'S9 D2';
            				configurator.panels[configurator.currentPanelNum].buttons[8].icon = 'nine';
            				configurator.panels[configurator.currentPanelNum].buttons[9].code = 'S1 A2';
            				configurator.panels[configurator.currentPanelNum].buttons[9].icon = 'circleEmptyLarge';
            				break;
            		}

            		$('[data-step="3"] .ButtonPanelInner').empty().html(configurator.buttonTemplate({ panel: configurator.panels[configurator.currentPanelNum] }));
            		$('.sapNumber > b').text(configurator.panels[configurator.currentPanelNum].SAP);

            		configurator.stepsOpen[3] = true;
            		$('.nonEditingTitle').show();
            		$('.defaultIcons, .defaultLabels, .editingTitle, .editingInst').hide();
            		$('#panelWizard').wizard('next');

            		var buttons = configurator.panels[configurator.currentPanelNum].buttons;
            		for (var i = 0; i < buttons.length; i++) {
            			if (buttons[i] !== null) {
            				if (buttons[i].icon === null){
            					$('#btn_inp_' + i).val(buttons[i].label);
            				}
            				else {
            					$('#btn_icn_' + i).css('background-image', 'url(images/icons/' + buttons[i].icon + '.png)');
            				}
            			}
            		}

            		completeBtnVisible();
            	});

            	$('.panelLayouts').on('click', 'img', function () {
            		var panelType = '' + $(this).data('panel-layout');

            		configurator.tempPanel = {
            			style: configurator.currentStyle,
            			SAP: panelType + configurator.currentStyle + 'L',
            			buttons: [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null]
            		};

            		switch (panelType) {
            			case '161':
            				configurator.tempPanel.buttons[0] = 'CENTER_2';
            				configurator.tempPanel.buttons[1] = 'CENTER_4';
            				break;
            			case '163':
            				configurator.tempPanel.buttons[0] = 'LEFT_2';
            				configurator.tempPanel.buttons[1] = 'LEFT_4';
            				configurator.tempPanel.buttons[2] = 'RIGHT_2';
            				configurator.tempPanel.buttons[3] = 'RIGHT_4';
            				break;
            			case '164':
            				configurator.tempPanel.buttons[0] = 'CENTER_1';
            				configurator.tempPanel.buttons[1] = 'CENTER_2';
            				configurator.tempPanel.buttons[2] = 'CENTER_3';
            				configurator.tempPanel.buttons[3] = 'CENTER_4';
            				configurator.tempPanel.buttons[4] = 'CENTER_5';
            				break;
            			case '165':
            				configurator.tempPanel.buttons[0] = 'LEFT_1';
            				configurator.tempPanel.buttons[1] = 'LEFT_2';
            				configurator.tempPanel.buttons[2] = 'LEFT_3';
            				configurator.tempPanel.buttons[3] = 'LEFT_4';
            				configurator.tempPanel.buttons[4] = 'LEFT_5';
            				configurator.tempPanel.buttons[5] = 'RIGHT_2';
            				configurator.tempPanel.buttons[6] = 'RIGHT_4';
            				break;
            			case '166':
            				configurator.tempPanel.buttons[0] = 'LEFT_1';
            				configurator.tempPanel.buttons[1] = 'LEFT_2';
            				configurator.tempPanel.buttons[2] = 'LEFT_3';
            				configurator.tempPanel.buttons[3] = 'LEFT_4';
            				configurator.tempPanel.buttons[4] = 'LEFT_5';
            				configurator.tempPanel.buttons[5] = 'RIGHT_1';
            				configurator.tempPanel.buttons[6] = 'RIGHT_2';
            				configurator.tempPanel.buttons[7] = 'RIGHT_3';
            				configurator.tempPanel.buttons[8] = 'RIGHT_4';
            				configurator.tempPanel.buttons[9] = 'RIGHT_5';
            				break;
            		}

            		createPanelObj(configurator.tempPanel);
            		$('[data-step="3"] .ButtonPanelInner').empty().html(configurator.buttonTemplate({ panel: configurator.panels[configurator.currentPanelNum] }));
            		$('.sapNumber > b').text(configurator.panels[configurator.currentPanelNum].SAP);

            		addDropHandler();

            		configurator.stepsOpen[3] = true;
            		$('.nonEditingTitle').hide();
            		$('.defaultIcons, .defaultLabels, .editingTitle, .editingInst').show();
            		$('#panelWizard').wizard('next');
            	});

            	$('.customLayout').on('click', 'img', function () {
            		configurator.tempPanel = {
            			style: configurator.currentStyle,
            			SAP: 'CUSTOM',
            			buttons: [null,null,null,null,null,null,null,null,null,null,null,null,null,null,null]
            		};

            		$('.customButtonPanelInner').empty().html(configurator.placeButtonsTemplate({ style: configurator.currentStyle }));
            		$('.customPanelMaker').show();
            	});

            	$('[data-step="2"]').on('click', '.acceptButtonsBtn', function () {
            		createPanelObj(configurator.tempPanel);
            		$('[data-step="3"] .ButtonPanelInner').empty().html(configurator.buttonTemplate({ panel: configurator.panels[configurator.currentPanelNum] }));
            		$('.sapNumber > b').text(configurator.panels[configurator.currentPanelNum].SAP);

            		addDropHandler();

            		configurator.stepsOpen[3] = true;
            		$('.nonEditingTitle').hide();
            		$('.defaultIcons, .defaultLabels, .editingTitle, .editingInst').show();
            		$('#panelWizard').wizard('next');
            	});

            	// *************************************************************************************************
            	// *************************************************************************************************
            	// STEP 3. Panel buttons and labels
            	$('[data-step="3"] .ButtonPanelInner').on('change', '.sizedTextBox', function () {
            	    var index = parseInt($(this).data('id'), 10);
            	    var label = $(this).val();

            		$('#btn_icn_' + index).css('backgroundImage', 'url()');

            		if (label === '') {
            		    configurator.panels[configurator.currentPanelNum].buttons[index].label = null;
            		    configurator.panels[configurator.currentPanelNum].buttons[index].code = null;
            		}
            		else {
            		    configurator.panels[configurator.currentPanelNum].buttons[index].label = label;

            		    if (_.has(configurator.labelCodes, label)) {
            		        configurator.panels[configurator.currentPanelNum].buttons[index].code = configurator.labelCodes[label];
            		    }
            		    else {
            		        configurator.panels[configurator.currentPanelNum].buttons[index].code = 'custom';
            		    }
            		}
            		
            		configurator.panels[configurator.currentPanelNum].buttons[index].icon = null;

            		completeBtnVisible();
            	});

            	$('[data-step="3"]').on('click', '.panelCompleteBtn', function () {
            		var quan = parseInt($('#panelQuantity').val(), 10);
            		if (isNaN(quan) || quan < 1)
            			quan = 1;

            		configurator.panels[configurator.currentPanelNum].quantity = quan;
            		configurator.panels[configurator.currentPanelNum].notes = $('#panelNotes').val();
                	$('#panelData').val(JSON.stringify(configurator.panels));
                	//add panel to step 4.
                	$('.yourPanelsCont').empty().html(configurator.yourPanelTemplate({ panels: configurator.panels }));

                	configurator.stepsOpen[4] = true;
                	$('#panelWizard').wizard('next');
                });

            	// *************************************************************************************************
            	// *************************************************************************************************
				// STEP 4. export panel
                $('#newPnlBtn').click(function () {
                	configurator.currentPanelNum++;

                	//starting point for a new panel so reset the stepsOpen flags and disable the Next Btn
                	configurator.stepsOpen = [null, true, false, false, false, false];
                	$('.actions .btn-next').addClass('disabled').prop('disabled', true);

                	$('#panelNotes').val('');

                	$('[data-step=1]').trigger('click');
                });

                $('#getCustomerInfoBtn').click(function () {
                	configurator.stepsOpen[5] = true;
                	$('#panelWizard').wizard('next');
                });

            	// *************************************************************************************************
            	// *************************************************************************************************
				// generic wizard step change handlers
                $('#panelWizard').on('change', function (e, data) {
                	//change is called before the step change triggered by this code $('#panelWizard').wizard('next');
                	if (data === undefined || data.constructor === undefined)
                		return;

                	if (data.direction === 'next') {
                		if (data.step + 2 < configurator.stepsOpen.length && configurator.stepsOpen[data.step + 2]) {
                			$('.actions .btn-next').removeClass('disabled').prop('disabled', false);
                		}
                		else {
                			$('.actions .btn-next').addClass('disabled').prop('disabled', true);
                		}
                	}
                	else if (data.direction === 'previous') {
                		if (data.step < configurator.stepsOpen.length && configurator.stepsOpen[data.step]) {
                			$('.actions .btn-next').removeClass('disabled').prop('disabled', false);
                		}
                		else {
                			$('.actions .btn-next').addClass('disabled').prop('disabled', true);
                		}
                	}
                });

                $('#panelWizard').on('stepclick', function (e, data) {
                	//stepclick is called after the step change by clicking on the wizard header steps bar
                	if (data.step + 1 < configurator.stepsOpen.length && configurator.stepsOpen[data.step + 1]) {
                		$('.actions .btn-next').removeClass('disabled').prop('disabled', false);
                	}
                	else {
                		$('.actions .btn-next').addClass('disabled').prop('disabled', true);
                	}
                });
            });

        	// *************************************************************************************************
        	// *************************************************************************************************

        	// STEP 2. make custom button layout functionality
            function toggleButton(e) {
            	var location = $(e.target).data('location');
            	var position = parseInt($(e.target).data('position'), 10);
            	var index = parseInt($(e.target).data('index'), 10);

            	if (configurator.tempPanel.buttons[index] === null) {

            		configurator.tempPanel.buttons[index] = location + '_' + position;

            		if (location === 'LEFT') {
            			$(e.target).css('backgroundImage', 'url(images/button_left.png)');
            			//check center
            			if (configurator.tempPanel.buttons[index + 5] !== null) {
            				configurator.tempPanel.buttons[index + 5] = null;
            				$('div[data-index="' + (index + 5) + '"]').css('backgroundImage', 'url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEcAAAAbAQMAAAAUMgDQAAAAA1BMVEUAAACnej3aAAAAAXRSTlMAQObYZgAAABZJREFUeF7twDEBAAAAQDD9U3uFMGICAQ4AAbjL82AAAAAASUVORK5CYII=")');
            			}
            		}
            		else if (location === 'CENTER') {
            			$(e.target).css('backgroundImage', 'url(images/button_left.png)');
            			//check left and right
            			if (configurator.tempPanel.buttons[index - 5] !== null) {
            				configurator.tempPanel.buttons[index - 5] = null;
            				$('div[data-index="' + (index - 5) + '"]').css('backgroundImage', 'url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEcAAAAbAQMAAAAUMgDQAAAAA1BMVEUAAACnej3aAAAAAXRSTlMAQObYZgAAABZJREFUeF7twDEBAAAAQDD9U3uFMGICAQ4AAbjL82AAAAAASUVORK5CYII=")');
            			}

            			if (configurator.tempPanel.buttons[index + 5] !== null) {
            				configurator.tempPanel.buttons[index + 5] = null;
            				$('div[data-index="' + (index + 5) + '"]').css('backgroundImage', 'url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEcAAAAbAQMAAAAUMgDQAAAAA1BMVEUAAACnej3aAAAAAXRSTlMAQObYZgAAABZJREFUeF7twDEBAAAAQDD9U3uFMGICAQ4AAbjL82AAAAAASUVORK5CYII=")');
            			}
            		}
            		else if (location === 'RIGHT') {
            			$(e.target).css('backgroundImage', 'url(images/button_right.png)');
            			//check center
            			if (configurator.tempPanel.buttons[index - 5] !== null) {
            				configurator.tempPanel.buttons[index - 5] = null;
            				$('div[data-index="' + (index - 5) + '"]').css('backgroundImage', 'url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEcAAAAbAQMAAAAUMgDQAAAAA1BMVEUAAACnej3aAAAAAXRSTlMAQObYZgAAABZJREFUeF7twDEBAAAAQDD9U3uFMGICAQ4AAbjL82AAAAAASUVORK5CYII=")');
            			}
            		}
            	}
            	else {
            		configurator.tempPanel.buttons[index] = null;
            		$(e.target).css('backgroundImage', 'url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEcAAAAbAQMAAAAUMgDQAAAAA1BMVEUAAACnej3aAAAAAXRSTlMAQObYZgAAABZJREFUeF7twDEBAAAAQDD9U3uFMGICAQ4AAbjL82AAAAAASUVORK5CYII=")');
            	}

            	acceptBtnVisible();
            }

            function acceptBtnVisible() {
            	var noButtons = true, length = configurator.tempPanel.buttons.length;
            	for (var i = 0; i < length; i++) {
            		if (configurator.tempPanel.buttons[i] !== null) {
            			noButtons = false;
            			break;
            		}
            	}

            	if (noButtons) {
            		$('.acceptButtonsBtn').fadeOut('quick');
            	}
            	else {
            		$('.acceptButtonsBtn').fadeIn('quick');
            	}
            }

        	// *************************************************************************************************
        	// *************************************************************************************************

        	// STEP 3. button input field droppable functionality
            function addDropHandler() {
            	$('.droppable').droppable({
            		activeClass: 'droppable-highlight',
            		hoverClass: 'droppable-hover',
            		drop: function (e, ui) {
						// type and label come from the element being dropped
            			var type = $(ui.helper).data('type');
            			var label = $(ui.helper).data('label');
						// index comes from the target of the drop, the element that is receiving the drop
            			var index = parseInt($(e.target).data('id'), 10);

            			if (type === 'text') {
            				$('#btn_icn_' + index).css('background-image', 'url()');
            				$('#btn_inp_' + index).val(label);

            				configurator.panels[configurator.currentPanelNum].buttons[index].label = label;
            				configurator.panels[configurator.currentPanelNum].buttons[index].icon = null;

            				if (_.has(configurator.labelCodes, label)) {
            				    configurator.panels[configurator.currentPanelNum].buttons[index].code = configurator.labelCodes[label];
            				}
            				else {
            				    configurator.panels[configurator.currentPanelNum].buttons[index].code = 'custom';
            				}
            			}
            			else if (type === 'icon') {
            				$('#btn_inp_' + index).val('');
            				$('#btn_icn_' + index).css('background-image', 'url(images/icons/' + label + '.png)');

            				configurator.panels[configurator.currentPanelNum].buttons[index].label = null;
            				configurator.panels[configurator.currentPanelNum].buttons[index].icon = label;

            				if (_.has(configurator.iconCodes, label)) {
            				    configurator.panels[configurator.currentPanelNum].buttons[index].code = configurator.iconCodes[label];
            				}
            				else {
            				    configurator.panels[configurator.currentPanelNum].buttons[index].code = 'custom';
            				}
            			}

            			completeBtnVisible();
            		}
            	});
            }

            function completeBtnVisible() {
            	var allBtnsRdy = true, length = configurator.panels[configurator.currentPanelNum].buttons.length;
            	for (var i = 0; i < length; i++) {
            		if (configurator.panels[configurator.currentPanelNum].buttons[i] !== null) {
            			if (configurator.panels[configurator.currentPanelNum].buttons[i].label === null && configurator.panels[configurator.currentPanelNum].buttons[i].icon === null) {
            				allBtnsRdy = false;
            				break;
            			}
            		}
            	}

            	if (allBtnsRdy) {
            		$('.panelCompleteBtn').fadeIn('quick');
            	}
            	else {
            		$('.panelCompleteBtn').fadeOut('quick');
            	}
            }
        </script>
    </body>
</html>