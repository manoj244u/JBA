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
								<b>Company</b>
							</td>
							<td>
								<b>Bank Account</b>
							</td>
							<td>
								<b>Period</b>
							</td>
							<td>
								<b>AccountDescription</b>
							</td>
							<td>
								<b>ClosingBalanceinBankCurrency</b>
							</td>
							<td>
								<b>Suspended</b>
							</td>
						</tr>

						<xsl:for-each select="result">
							<tr>
								<td>
									<xsl:value-of select="@Company" />
								</td>
								<td>
									<xsl:value-of select="@BankAccount" />
								</td>
								<td>
									<xsl:value-of select="@Period" />
								</td>
								<td>
									<xsl:value-of select="@AccountDescription" />
								</td>
								<td>
									<xsl:value-of select="@ClosingBalanceinBankCurrency" />
								</td>
								<td>
									<xsl:value-of select="@Suspended" />
								</td>
							</tr>
						</xsl:for-each>
					</table>
					<table width="100%" border="1">
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr>
							<td>
								<b>Source</b>
							</td>
							<td>
								<b>MasterItemType</b>
							</td>
							<td>
								<b>CashBookReference</b>
							</td>
							<td>
								<b>BanksReference</b>
							</td>
							<td>
								<b>Description</b>
							</td>

						</tr>


						<xsl:for-each select="result">
							<tr>

								<td>
									<xsl:value-of select="@Source" />
								</td>
								<td>
									<xsl:value-of select="@MasterItemType" />
								</td>
								<td>
									<xsl:value-of select="@CashBookReference" />
								</td>
								<td>
									<xsl:value-of select="@BanksReference" />
								</td>
								<td>
									<xsl:value-of select="@Description" />
								</td>


							</tr>
						</xsl:for-each>
						</table>
					<table width="100%" border="1">
						
						<tr>
							<td>
								<b>BaseCurrencyValue</b>
							</td>
							<td>
								<b>CurrencyValue</b>
							</td>
							<td>
								<b>CurrencyCode</b>
							</td>
							<td>
								<b>BankAccountCurrencyCode</b>
							</td>
							

						</tr>


						<xsl:for-each select="result">
							<tr>

								
								<td>
									<xsl:value-of select="@BaseCurrencyValue" />
								</td>
								<td>
									<xsl:value-of select="@CurrencyValue" />
								</td>
								<td>
									<xsl:value-of select="@CurrencyCode" />
								</td>
								<td>
									<xsl:value-of select="@BankAccountCurrencyCode" />
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
