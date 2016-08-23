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
			<title>Main Contract Details</title>
			<link href="SpryAssets/SpryCollapsiblePanel.css" rel="stylesheet"
				type="text/css" />
			<script src="SpryAssets/SpryCollapsiblePanel.js" type="text/javascript" />
		</head>
		<body>
			<div id="CollapsiblePanel0" class="CollapsiblePanel">
				<div class="CollapsiblePanelTab" tabindex="0">Main Contract Details</div>
				
				 <div class="CollapsiblePanelContent">
            <table width="100%" border="1">
                        <tr>
				              <td>AccountNumber</td>
				              <td>
				                <xsl:value-of select="result/@AccountNumber"/>
				              </td>
				              <td>ContractNumber</td>
				              <td>
				                <xsl:value-of select="result/@ContractNumber"/>
				              </td>
                      </tr>
                   <tr>
	               <td>Contract Type</td>
	               <td>
	               <xsl:value-of select="result/@ContractType"/>
	               </td>
	               <td>Status</td>
	               <td>
	                <xsl:value-of select="result/@Status"/>
	                </td>
                        </tr>
              <tr>
              
	               <td>Alt .Con. No</td>
	              <td>
	                <xsl:value-of select="result/@AltContNo"/>
	              </td>
	           
	              <td>Version</td>
	              <td>
	                <xsl:value-of select="result/@Version"/>
	              </td>
            </tr>
            <tr>
	              <td>Contract Type Description</td>
	              <td>
	                <xsl:value-of select="result/@ContractTypeDescription"/>
	              </td>
	              <td>Contract Start Date</td>
	              <td>
	                <xsl:value-of select="result/@ContractStartDate"/>
	              </td>
	             
	         </tr>
	          <tr>
	              <td>Contract End Date</td>
	              <td>
	                <xsl:value-of select="result/@ContractEndDate"/>
	              </td>
	              <td>Invoice Start Date</td>
	              <td>
	                <xsl:value-of select="result/@invoiceStartDate"/>
	              </td>
	             
	         </tr>
	         <tr>
	              <td>Calender Code</td>
	              <td>
	                <xsl:value-of select="result/@CalendarCode"/>
	              </td>
	              <td>Total Contract Value</td>
	              <td>
	                <xsl:value-of select="result/@TotalContactValue"/>
	              </td>
	             
	         </tr>
	          <tr>
	              <td>Duration </td>
	              <td>
	                <xsl:value-of select="result/@Duration"/>
	              </td>
	              <td>Mantle code</td>
	              <td>
	                <xsl:value-of select="result/@MantleCode"/>
	              </td>
	             
	         </tr>
	        
             <tr>
	              <td>Customer Order ref</td>
	              <td>
	                <xsl:value-of select="result/@CustomerOrderRef"/>
	              </td>
	              <td>order Ref Date</td>
	              <td>
	                <xsl:value-of select="result/@OrderRefDate"/>
	              </td>
	             
	         </tr>
	          <tr>
	              <td>Customer Contact</td>
	              <td>
	                <xsl:value-of select="result/@CustomerContact"/>
	              </td>
	              <td>Telephone No</td>
	              <td>
	                <xsl:value-of select="result/@TelephoneNumber"/>
	              </td>
	             
	         </tr>
	          <tr>
	              <td>Renew Contract</td>
	              <td>
	                <xsl:value-of select="result/@RenewContract"/>
	              </td>
	              <td>Region</td>
	              <td>
	                <xsl:value-of select="result/@Region"/>
	              </td>
	             
	         </tr>
	         <tr>
	              <td>Non posting Invoices</td>
	              <td>
	                <xsl:value-of select="result/@NonpostingInvoices"/>
	              </td>
	              <td>Header Pricing Level</td>
	              <td>
	                <xsl:value-of select="result/@Headerlevelpricing"/>
	              </td>
	             
	         </tr>
	           <tr>
	              <td>Sales man Code</td>
	              <td>
	                <xsl:value-of select="result/@SalesmanCode"/>
	              </td>
	              <td>Invoice Summ</td>
	              <td>
	                <xsl:value-of select="result/@InvoiceSumm"/>
	              </td>
	             
	         </tr>
	           <tr>
	              <td>Invoice Destination</td>
	              <td>
	                <xsl:value-of select="result/@InvoiceDestination"/>
	              </td>
	              <td>ContractInvoiceBillToA</td>
	              <td>
	                <xsl:value-of select="result/@ContractInvoiceBillToA"/>
	              </td>
	             
	         </tr>
	          <tr>
	              <td>Contract Invoice Bill to</td>
	              <td>
	                <xsl:value-of select="result/@ContractInvoiceBillToLoc"/>
	              </td>
	              <td>JobInvoiceBilltoA</td>
	              <td>
	                <xsl:value-of select="result/@JobInvoiceBilltoA"/>
	              </td>
	              
	             
	         </tr>
	        
	        <tr>
	        <td>JobInvoiceBilltoLoc</td>
	              <td>
	                <xsl:value-of select="result/@JobInvoiceBilltoLoc"/>
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