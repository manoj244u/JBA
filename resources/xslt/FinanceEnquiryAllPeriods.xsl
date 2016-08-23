<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" version="1.0">
  <!--  XHTML output with XML syntax -->
  <xsl:output method="xml" encoding="utf-8" indent="no" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/>
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
      <style type="text/css">body {
					font-family : 'Lucida Sans Unicode', 'Lucida Grande', sans-serif;
					font-size : 12px;
				}
				.header {
					font-weight : bold;
					padding : 0px 30px 0px 10px;
					vertical-align : top;
					}</style>
      <title> Finance Details</title>
      <link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css"/>
      <script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"/>
    </head>
    <body>
     <div id="CollapsiblePanel0" class="CollapsiblePanel">
				<div class="CollapsiblePanelTab" tabindex="0">Finance Details</div>
				<div class="CollapsiblePanelContent">
            <table width="100%" border="1">
            <tr>
              <td>Company</td>
              <td>
                <xsl:value-of select="result/@company"/>
              </td>
              <td>Ledger</td>
              <td>
                <xsl:value-of select="result/@ledger"/>
              </td>
            </tr>
            <tr>
              <td>Account</td>
              <td>
                <xsl:value-of select="result/@account"/>
              </td>
              <td>Period</td>
              <td>
                <xsl:value-of select="result/@period"/>
              </td>
            </tr>
            <tr>
              <td>Net Posted for Period</td>
              <td>
                <xsl:value-of select="result/@netpostedforperiod"/>
              </td>
              <td >Fiscal Year to Date</td>
              <td>
                <xsl:value-of select="result/@fiscalyeartodate"/>
              </td>
            </tr>
            <tr>
              <td>Calendar Year to Date</td>
              <td>
                <xsl:value-of select="result/@calenderyeartodate"/>
              </td>
            </tr>
		    </table>
        </div>
    </div>
	<br/>
	
      <script type="text/javascript">var CollapsiblePanel0 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel0");
var CollapsiblePanel1 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel1");
var CollapsiblePanel2 = new Spry.Widget.CollapsiblePanel("CollapsiblePanel2");</script>
    </body>
  </xsl:template>
</xsl:stylesheet>