<?xml version="1.0" encoding="UTF-8" ?> 
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--  XHTML output with XML syntax -->
	<xsl:output method="xml" encoding="utf-8" indent="no" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/>
	<xsl:param name="data-base-uri"/>
	<xsl:template match="/">
		<!--  always emit at least an empty HTML element -->
		<html>
			<!--  and look at the rest of the file -->
			<xsl:apply-templates/>
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
					}</style>
      <title>Job contract details</title>
      <link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css"/>
      <script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"/>
    </head>
    <body>
      <div id="CollapsiblePanel0" class="CollapsiblePanel">
        <div class="CollapsiblePanelTab" tabindex="0">

        </div>
        <div class="CollapsiblePanelContent">
          <table bordercolor="#A0A0A0" bgcolor="#F0FFFF" width="100%" border="0">
            <tr>
              <table border="1" bordercolor="#001a0d" width="100%">
                <tr bgcolor="#FFFFFF">
                  
                  <th style="color:#000000">Date</th>
                  <th style="color:#000000">Invoice Value</th>
                  <th style="color:#000000">Account</th>
                  <th style="color:#000000">Location</th>
                  <th style="color:#000000">Currency</th>
                   <th style="color:#000000">AC Name</th>
                 
                </tr>
                <tr>
                 
                  <td>
                    <xsl:value-of select="result/@Date"/>
                  </td>
                  <td>
                    <xsl:value-of select="result/@InvoiceValue"/>
                  </td>
                  <td>
                    <xsl:value-of select="result/@Account"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@Location"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@Currency"/>
                  </td><td>
                    <xsl:value-of select="result/@ACName"/>
                  </td>
                  </tr>
                 
                  <th style="color:#000000">AC AddressLine1</th>
                  <th style="color:#000000">AC AddressLine2</th>
                  <th style="color:#000000">AC AddressLine3</th>
                  <th style="color:#000000">AC AddressLine4</th>
                  <th style="color:#000000">AC AddressLine5</th>
                  <th style="color:#000000">PostCode</th><tr>
                   
                   <td>
                    <xsl:value-of select="result/@ACAddressLine1"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@ACAddressLine2"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@ACAddressLine3"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@ACAddressLine4"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@ACAddressLine5"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@PostCode"/>
                  </td>
                                    
                </tr>
              </table>
            </tr>
          </table>
        </div>
      </div>
      <script type="text/javascript">var CollapsiblePanel0 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel0");
var CollapsiblePanel1 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel1");
var CollapsiblePanel2 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel2");</script>
    </body>
  </xsl:template>
</xsl:stylesheet>