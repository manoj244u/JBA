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
      <title>Job Line Equipment</title>
      <link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet" type="text/css"/>
      <script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript"/>
    </head>
    <body>
      <div id="CollapsiblePanel0" class="CollapsiblePanel">
        <div class="CollapsiblePanelTab" tabindex="0">Job Line Equipment Details</div>
          <div class="CollapsiblePanelContent">
           <table width="100%" border="1">
                        <tr>
				              <td>Site</td>
				              <td>
				                <xsl:value-of select="result/@site"/>
				              </td>
				              <td>Owner</td>
				              <td>
				                <xsl:value-of select="result/@ownerAccount"/>
				              </td>
                      </tr>
                        <tr>
	               <td>A/C NO</td>
	               <td>
	               <xsl:value-of select="result/@account"/>
	               </td>
	               <td>ModelNumber</td>
	               <td>
	                <xsl:value-of select="result/@model"/>
	                </td>
                        </tr>
                      <tr>
              
	               <td>SerialNumber</td>
	              <td>
	                <xsl:value-of select="result/@serialNumber"/>
	              </td>
	           
	              <td>Customer Assesment NO</td>
	              <td>
	                <xsl:value-of select="result/@CustomerAssetNumber"/>
	              </td>
            </tr>
            <tr>
	              <td>Quantity</td>
	              <td>
	                <xsl:value-of select="result/@Quantity"/>
	              </td>
	             
	              <td>Revision</td>
	              <td>
	                <xsl:value-of select="result/@Revision"/>
	              </td>
	         </tr>
	         <tr>
	             <td>Equipment Status</td>
	              <td>
	                <xsl:value-of select="result/@EquipmentStatus"/>
	              </td>
				  <td>customer Status</td>
	              <td>
	                <xsl:value-of select="result/@CustomerStatus"/>
	              </td>
	               </tr>
	           <tr>
	              <td>Vat Calc Basis</td>
	              <td>
	                <xsl:value-of select="result/@VatCalcBasis"/>
	              </td>
	               <td>Vat Code</td>
	              <td>
	                <xsl:value-of select="result/@VATCode"/>
	              </td>
				  
	             
            </tr>
             <tr>
	              <td>Warranty Units </td>
	              <td>
	                <xsl:value-of select="result/@WarrantyUnits"/>
	              </td>
				   <td>Model Year</td>
	               <td>
	                <xsl:value-of select="result/@ModelYear"/>
	              </td>
	             
            </tr>
             <tr>
	              <td>Warranty Months</td>
	              <td>
	                <xsl:value-of select="result/@WarrantyMonths"/>
	              </td>
				   <td>Warranty Units</td>
	               <td>
	                <xsl:value-of select="result/@WarrantyUnits"/>
	              </td>
	             
            </tr>
            <tr>
	              <td>Installation Date</td>
	              <td>
	                <xsl:value-of select="result/@InstallationDate"/>
	              </td>
	              <td>Delivery Date</td>
	               <td>
	                <xsl:value-of select="result/@DeliveryDate"/>
	              </td>
	              
	             
            </tr>
            <tr>
	              <td>Waranty Expired</td>
	              <td>
	                <xsl:value-of select="result/@WarrantyExpiryDate"/>
	              </td>
	              <td>Department</td>
	               <td>
	                <xsl:value-of select="result/@Division"/>
	              </td>
	              
	             
            </tr>
             <tr>
	              <td>Location</td>
	              <td>
	                <xsl:value-of select="result/@machineLocation"/>
	              </td>
	              <td>Contract Number</td>
	               <td>
	                <xsl:value-of select="result/@ContractNumber"/>
	              </td>
	              
	             
            </tr>
             <tr>
	              <td>Contract Type</td>
	              <td>
	                <xsl:value-of select="result/@ContractType"/>
	              </td>
	              <td>ContractStartDate</td>
	               <td>
	                <xsl:value-of select="result/@ContractStartDate"/>
	              </td>
	              
	             
            </tr>
          <tr>
	              <td>InclusionDate</td>
	              <td>
	                <xsl:value-of select="result/@InclusionDate"/>
	               </td>
	            <td>InclusionDate</td>
	               <td>
	                <xsl:value-of select="result/@faultDesc"/>
	              </td>
	             
	              
	             
            </tr>
             <tr>
	              <td>EngineerNumber</td>
	              <td>
	                <xsl:value-of select="result/@EngineerNumber"/>
	              </td>
	              <td>EngineerName</td>
	               <td>
	                <xsl:value-of select="result/@EngineerName"/>
	              </td>
	             
	              
	             
            </tr>
             <tr>
	              <td>Points</td>
	              <td>
	                <xsl:value-of select="result/@Points"/>
	              </td>
	              <td>Servicesbyourselves</td>
	               <td>
	                <xsl:value-of select="result/@Servicesbyourselves"/>
	              </td>
	             
	              
	             
            </tr>
             <tr>
	              <td>Underproductsupervision</td>
	              <td>
	                <xsl:value-of select="result/@Underproductsupervision"/>
	              </td>
	              <td>OrderType</td>
	               <td>
	                <xsl:value-of select="result/@OrderType"/>
	              </td>
	             
	             
	              
	             
            </tr>
            <tr>
	              
	             
	              <td>OrderNumber</td>
	               
	              <td>
	                <xsl:value-of select="result/@OrderNumber"/>
	              </td>
	             
	             
	              <td>OrderLineNumber</td>
	               
	              <td>
	                <xsl:value-of select="result/@OrderLineNumber"/>
	              </td>
	             
	              
	             
            </tr>
             <tr>
	              <td>CalendarCode</td>
	               
	              <td>
	                <xsl:value-of select="result/@CalendarCode"/>
	              </td>
	              
	             
	              <td>Despatched</td>
	               
	              <td>
	                <xsl:value-of select="result/@despatchedDate"/>
	              </td>
	              
	             
            </tr>
             <tr>
	              <td>CalendarCodeDescription</td>
	               
	              <td>
	                <xsl:value-of select="result/@CalendarCodeDescription"/>
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