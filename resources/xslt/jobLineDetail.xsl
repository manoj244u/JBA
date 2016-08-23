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
      <title>Job Line Details</title>
      <link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css"/>
      <script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"/>
    </head>
    <body>
      <div id="CollapsiblePanel0" class="CollapsiblePanel">
        <div class="CollapsiblePanelTab" tabindex="0">Job Line Details</div>
          <div class="CollapsiblePanelContent">
           <table width="100%" border="1">
                        <tr>
				              <td>CompanyCode</td>
				              <td>
				                <xsl:value-of select="result/@companyCode"/>
				              </td>
				              <td>Branch</td>
				              <td>
				                <xsl:value-of select="result/@branch"/>
				              </td>
                      </tr>
            <tr>
	               <td>Job</td>
	               <td>
	               <xsl:value-of select="result/@job"/>
	               </td>
	               <td>Contract Date</td>
	               <td>
	                <xsl:value-of select="result/@date"/>
	                </td>
              </tr>
              <tr>
              
	               <td>ModelNumber</td>
	              <td>
	                <xsl:value-of select="result/@modelNumber"/>
	              </td>
	           
	              <td>Serial Number</td>
	              <td>
	                <xsl:value-of select="result/@serialNumber"/>
	              </td>
            </tr>
            <tr>
	              <td>Job Cat</td>
	              <td>
	                <xsl:value-of select="result/@jobCategory"/>
	              </td>
	             
	              <td>Date</td>
	              <td>
	                <xsl:value-of select="result/@date"/>
	              </td>
	         </tr>
	         <tr>
	             <td>JOb Status</td>
	              <td>
	                <xsl:value-of select="result/@jobStatus"/>
	              </td>
	             
	              
	              <td>Time</td>
	              <td>
	                <xsl:value-of select="result/@time"/>
	              </td>
	             
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