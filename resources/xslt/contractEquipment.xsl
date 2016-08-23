<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><!-- XHTML output with XML syntax -->
	<xsl:output method="xml" encoding="utf-8" indent="no"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" />
	<xsl:param name="data-base-uri" />
	<xsl:template match="/">
	
	<!-- always emit at least an empty HTML 
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
			<title>Contract Equipment Details</title>
			<link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet"
				type="text/css" />
			<script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript" />
		</head>
		<body>
			<div id="CollapsiblePanel0" class="CollapsiblePanel">
				<div class="CollapsiblePanelTab" tabindex="0"> Contract EquipmentDetails</div>
				
				 <div class="CollapsiblePanelContent">
            <table width="100%" border="1">
                        <tr>
				              <td>AccountNumber</td>
				              <td>
				                <xsl:value-of select="result/@accountNumber"/>
				              </td>
				              <td>ContractNumber</td>
				              <td>
				                <xsl:value-of select="result/@contractNumber"/>
				              </td>
                      </tr>
                   <tr>
	               <td>Contract Type</td>
	               <td>
	               <xsl:value-of select="result/@contractType"/>
	               </td>
	               <td>Status</td>
	               <td>
	                <xsl:value-of select="result/@status"/>
	                </td>
                        </tr>
              <tr>
              
	               <td>Company Code</td>
	              <td>
	                <xsl:value-of select="result/@company"/>
	              </td>
	           
	              <td>Branch</td>
	              <td>
	                <xsl:value-of select="result/@branch"/>
	              </td>
            </tr>
            <tr>
	              <td>Account Location</td>
	              <td>
	                <xsl:value-of select="result/@accountLocation"/>
	              </td>
	              <td>Contract Start Date</td>
	              <td>
	                <xsl:value-of select="result/@contractstartDate"/>
	              </td>
	             
	         </tr>
	          <tr>
	              <td>Location</td>
	              <td>
	                <xsl:value-of select="result/@location"/>
	              </td>
	              <td>Installation Address</td>
	              <td>
	                <xsl:value-of select="result/@installationAddress"/>
	              </td>
	             
	         </tr>
	         <tr>
	              <td>Model</td>
	              <td>
	                <xsl:value-of select="result/@model"/>
	              </td>
	              <td>Serial</td>
	              <td>
	                <xsl:value-of select="result/@serial"/>
	              </td>
	             
	         </tr>
	          <tr>
	              <td> INC. Dt.</td>
	              <td>
	                <xsl:value-of select="result/@incDate"/>
	              </td>
	              <td>Remove Date</td>
	              <td>
	                <xsl:value-of select="result/@removaldate"/>
	              </td>
	             
	         </tr>
	        
             <tr>
	              <td>RHours</td>
	              <td>
	                <xsl:value-of select="result/@rhours"/>
	              </td>
	              <td>visit</td>
	              <td>
	                <xsl:value-of select="result/@visit"/>
	              </td>
	             
	         </tr>
	         
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