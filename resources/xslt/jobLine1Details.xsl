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
				              <td>Job Number</td>
				              <td>
				                <xsl:value-of select="result/@job"/>
				              </td>
				              <td>SerialNumber</td>
				              <td>
				                <xsl:value-of select="result/@serialNumber"/>
				              </td>
                      </tr>
                        <tr>
	               <td>JobStatus</td>
	               <td>
	               <xsl:value-of select="result/@jobStatus"/>
	               </td>
	               <td>ModelNumber</td>
	               <td>
	                <xsl:value-of select="result/@modelNumber"/>
	                </td>
                        </tr>
                      <tr>
              
	               <td>ContractType</td>
	              <td>
	                <xsl:value-of select="result/@contractType"/>
	              </td>
	           
	              <td>Configuration</td>
	              <td>
	                <xsl:value-of select="result/@configuration"/>
	              </td>
            </tr>
            <tr>
	              <td>Cover Type</td>
	              <td>
	                <xsl:value-of select="result/@coverType"/>
	              </td>
	             
	              <td>Customer</td>
	              <td>
	                <xsl:value-of select="result/@customer"/>
	              </td>
	         </tr>
	         <tr>
	             <td>Account/Location</td>
	              <td>
	                <xsl:value-of select="result/@account"/>
	              </td>
	              <td>
	                <xsl:value-of select="result/@location"/>
	              </td>
	               </tr>
	           <tr>
	              <td>Call Received Date</td>
	              <td>
	                <xsl:value-of select="result/@callReceivedD"/>
	              </td>
	               <td>Call Received Time</td>
	              <td>
	                <xsl:value-of select="result/@callReceivedT"/>
	              </td>
	             
            </tr>
             <tr>
	              <td>Call Received </td>
	              <td>
	                <xsl:value-of select="result/@callReceivedD"/>
	              </td>
	               <td>
	                <xsl:value-of select="result/@callReceivedT"/>
	              </td>
	             
            </tr>
             <tr>
	              <td>Warranty Equipments/Parts</td>
	              <td>
	                <xsl:value-of select="result/@warrantyEquipment"/>
	              </td>
	               <td>
	                <xsl:value-of select="result/@parts"/>
	              </td>
	             
            </tr>
            <tr>
	              <td>Response Time</td>
	              <td>
	                <xsl:value-of select="result/@responsetime"/>
	              </td>
	              <td>Target Date</td>
	               <td>
	                <xsl:value-of select="result/@targetDate"/>
	              </td>
	               <td>
	                <xsl:value-of select="result/@targetTime"/>
	              </td>
	             
            </tr>
            <tr>
	              <td>Job Cat</td>
	              <td>
	                <xsl:value-of select="result/@jobCategory"/>
	              </td>
	              <td>ServiceRepair</td>
	               <td>
	                <xsl:value-of select="result/@machineUp"/>
	              </td>
	              
	             
            </tr>
             <tr>
	              <td>Machine Location</td>
	              <td>
	                <xsl:value-of select="result/@machineLocation"/>
	              </td>
	              <td>Contact</td>
	               <td>
	                <xsl:value-of select="result/@contact"/>
	              </td>
	              
	             
            </tr>
             <tr>
	              <td>Telephone</td>
	              <td>
	                <xsl:value-of select="result/@telephone"/>
	              </td>
	              <td>Complaint</td>
	               <td>
	                <xsl:value-of select="result/@complaint"/>
	              </td>
	              
	             
            </tr>
          <tr>
	              <td>Fault</td>
	              <td>
	                <xsl:value-of select="result/@fault"/>
	              </td>
	 
	               <td>
	                <xsl:value-of select="result/@faultDesc"/>
	              </td>
	             
	              
	             
            </tr>
             <tr>
	              <td>MachineUp</td>
	              <td>
	                <xsl:value-of select="result/@machineUp"/>
	              </td>
	              <td>Emergency</td>
	               <td>
	                <xsl:value-of select="result/@emergency"/>
	              </td>
	             
	              
	             
            </tr>
             <tr>
	              <td>Team</td>
	              <td>
	                <xsl:value-of select="result/@team"/>
	              </td>
	              <td>Ordr No</td>
	               <td>
	                <xsl:value-of select="result/@orderNumber"/>
	              </td>
	             
	              
	             
            </tr>
             <tr>
	              <td>Eng No</td>
	              <td>
	                <xsl:value-of select="result/@engineerNumber"/>
	              </td>
	              <td>Appoint Date</td>
	               <td>
	                <xsl:value-of select="result/@appointmentDate"/>
	              </td>
	              <td>
	                <xsl:value-of select="result/@appointmentTime"/>
	              </td>
	             
	              
	             
            </tr>
            <tr>
	              
	             
	              <td>Job Duration</td>
	               
	              <td>
	                <xsl:value-of select="result/@jobDuration"/>
	              </td>
	             
	             
	              <td>mServiceTemp</td>
	               
	              <td>
	                <xsl:value-of select="result/@mServiceTemp"/>
	              </td>
	             
	              
	             
            </tr>
             <tr>
	              <td>Estimated arrival</td>
	               
	              <td>
	                <xsl:value-of select="result/@estimatedDate"/>
	              </td>
	                <td>
	                <xsl:value-of select="result/@estimatedDate"/>
	              </td>
	             
	              <td>Despatched</td>
	               
	              <td>
	                <xsl:value-of select="result/@despatchedDate"/>
	              </td>
	              <td>
	                <xsl:value-of select="result/@despatchedTime"/>
	              </td>
	             
            </tr>
             <tr>
	              <td>OnSite</td>
	               
	              <td>
	                <xsl:value-of select="result/@onSiteDate"/>
	              </td>
	               
	              <td>
	                <xsl:value-of select="result/@onSiteTime"/>
	              </td>
	              
	             
	              <td>RelatedJOb</td>
	               
	              <td>
	                <xsl:value-of select="result/@relatedJob"/>
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