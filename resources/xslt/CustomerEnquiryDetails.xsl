<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><!-- XHTML output with XML syntax -->
	<xsl:output method="xml" encoding="utf-8" indent="no"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />
	<xsl:param name="data-base-uri" />
	<xsl:template match="/"><!-- always emit at least an empty HTML 
			element -->
		<html><!-- and look at the rest of the file -->
			<xsl:apply-templates />
		</html>
	</xsl:template>
	<xsl:template match="results">
		<head>
			<style type="text/css">
				body {
				font-family : 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;
				font-size : 12px;
				}
				.header {
				font-weight : bold;
				padding : 0px 30px 0px 10px;
				vertical-align : top;
				}
			</style>
			<title>Period Details For Bank Account</title>
			<link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet"
				type="text/css" />
			<script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript" />
		</head>
		<body>
			<div id="CollapsiblePanel0" class="CollapsiblePanel">

				<div class="CollapsiblePanelContent">
					<table width="100%" border="1">
						<tr>
							<td>
								<b>Customer</b>
							</td>
							<td>
								<b>Customer Name</b>
							</td>
							<td>
								<b>Type</b>
							</td>
							<td>
								<b>Reference</b>
							</td>
							<td>
								<b>DateItem Created</b>
							</td>
							<td>
								<b>Source</b>
							</td>
							<td>
								<b>DocumentDate</b>
							</td>
							<td>
								<b>Period</b>
							</td>
							<td>
								<b>Session</b>
							</td>
						</tr>

						<xsl:for-each select="result">
							<tr>
								<td>
									<xsl:value-of select="@Customer" />
								</td>
								<td>
									<xsl:value-of select="@CustomerName" />
								</td>
								<td>
									<xsl:value-of select="@Type" />
								</td>
								<td>
									<xsl:value-of select="@Reference" />
								</td>
								<td>
									<xsl:value-of select="@DateItemCreated" />
								</td>
								<td>
									<xsl:value-of select="@Source" />
								</td>
								<td>
									<xsl:value-of select="@DocumentDate" />
								</td>
								<td>
									<xsl:value-of select="@Period" />
								</td>
								<td>
									<xsl:value-of select="@Session" />
								</td>
							</tr>
						</xsl:for-each>					
						
						<tr></tr>
						<tr>
							<td>
								<b>SOP Reference</b>
							</td>
							<td>
								<b>Due Date</b>
							</td>
							<td>
								<b>RateCode</b>
							</td>
							<td>
								<b>RateCode_MD</b>
							</td>
							<td>
								<b>OS_Balance_Base</b>
							</td>
							<td>
								<b>OS_Balance_Prime</b>
							</td>
							<td>
								<b>Goods_Base</b>
							</td>
							<td>
								<b>Goods_Prime</b>
							</td>
							<td>
								<b>Discout_Base</b>
							</td>

						</tr>


						<xsl:for-each select="result">
							<tr>

								<td>
									<xsl:value-of select="@SOPReference" />
								</td>
								<td>
									<xsl:value-of select="@DueDate" />
								</td>
								<td>
									<xsl:value-of select="@RateCode" />
								</td>
								<td>
									<xsl:value-of select="@RateCode_MD" />
								</td>
								<td>
									<xsl:value-of select="@OS_Balance_Base" />
								</td>
								
								<td>
									<xsl:value-of select="@OS_Balance_Prime" />
								</td>
								
								<td>
									<xsl:value-of select="@Goods_Base" />
								</td>
								
								<td>
									<xsl:value-of select="@Goods_Prime" />
								</td>
								
								<td>
									<xsl:value-of select="@ClearedDate" />
								</td>


							</tr>
						</xsl:for-each>
						
						<tr>
							<td>
								<b>Discout_Base</b>
							</td>
							<td>
								<b>Discount_Prime</b>
							</td>
							<td>
								<b>VAT_Base</b>
							</td>
							<td>
								<b>VAT_Prime</b>
							</td>
							<td>
								<b>Total_Base</b>
							</td>
							<td>
								<b>Total_Prime</b>
							</td>
							<td>
								<b>Discount Code</b>
							</td>
							<td>
								<b>Extended Term</b>
							</td>
							<td>
								<b>Payment Method</b>
							</td>

						</tr>


						<xsl:for-each select="result">
							<tr>

								
								<td>
									<xsl:value-of select="@Discout_Base" />
								</td>
								<td>
									<xsl:value-of select="@Discount_Prime" />
								</td>
								<td>
									<xsl:value-of select="@VAT_Base" />
								</td>
								<td>
									<xsl:value-of select="@VAT_Prime" />
								</td>
								<td>
									<xsl:value-of select="@Total_Base" />
								</td>
								<td>
									<xsl:value-of select="@Total_Prime" />
								</td>
								<td>
									<xsl:value-of select="@DiscountCode" />
								</td>
								<td>
									<xsl:value-of select="@ExtendedTerm" />
								</td>
								<td>
									<xsl:value-of select="@PaymentMethod" />
								</td>


							</tr>
						</xsl:for-each>


						<xsl:for-each select="noResult">
							<tr>
								<td colspan="5">
									<xsl:value-of select="@comment" />
								</td>
							</tr>
						</xsl:for-each>
					</table>
				</div>
			</div>
			<script type="text/javascript">
				var CollapsiblePanel0 = new
				Spry.Widget.CollapsiblePanel("CollapsiblePanel0");
			</script>
		</body>
	</xsl:template>
</xsl:stylesheet>
