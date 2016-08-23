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
			<title>Job Header Details</title>
			<link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet"
				type="text/css" />
			<script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript" />
		</head>
		<body>
			<div id="CollapsiblePanel0" class="CollapsiblePanel">
				<div class="CollapsiblePanelTab" tabindex="0">Job Header Details</div>
				
				 <div class="CollapsiblePanelContent">
           <table width="100%" border="1">
                        <tr>
				              <td>Account Number</td>
				              <td>
				                <xsl:value-of select="result/@accountNumber"/>
				              </td>
                      </tr>
          
       </table>
         
        </div>
        <br/>
				<div class="CollapsiblePanelContent">
					<table width="100%" border="1">
						<tr>
						<td><b>Job no</b></td>
							<td><b>CompanyCode</b></td>
							<td><b>Branch</b></td>
							<td><b>SerialNo</b></td>
							<td><b>ModelNo</b></td>
							<td><b>JobCat</b></td>
						    <td><b>Fault</b></td>
							<td><b>Date</b></td>
							<td><b>Time</b></td>
							
						</tr>


						<xsl:for-each select="result">
							<tr>
								<td>
									<xsl:value-of select="@job" />
								</td>
								<td>
									<xsl:value-of select="@companyCode" />
								</td>
								<td>
									<xsl:value-of select="@branch" />
								</td>
								<td>
									<xsl:value-of select="@serialNumber" />
								</td>
								<td>
									<xsl:value-of select="@modelNumber" />
								</td>
								<td>
									<xsl:value-of select="@jobCategory" />
								</td>
								<td>
									<xsl:value-of select="@fault" />
								</td>
								<td>
									<xsl:value-of select="@date" />
								</td>
								<td>
									<xsl:value-of select="@time" />
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