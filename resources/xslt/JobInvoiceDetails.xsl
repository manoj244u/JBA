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
    <xsl:if test="result/@typeOfJob='JIN'"><tr>
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
               
        <br/>
         <div class="CollapsiblePanelTab" tabindex="0"></div>
                
                 <div class="CollapsiblePanelContent">
                    <table width="100%" border="1">
                        <tr>
                        <td><b>Job Invoice No</b></td>
                        <td><b>Currency Code</b></td>
                            <td><b>Date</b></td>
                            <td><b>JobNo</b></td>
                            <td><b>Model</b></td>
                            <td><b>SerialNo</b></td>
                            <td><b>TechnicalReportNumber</b></td>
                             <td><b>VisitDate</b></td>
                            
                        </tr>
                      <xsl:for-each select="result">
                            <tr>
                           <td>
                    <xsl:value-of select="@InvoiceNumber"/>
                  </td>
                   <td>
                    <xsl:value-of select="@CurrencyCode"/>
                  </td>
                   <td>
                    <xsl:value-of select="@InvoiceDate"/>
                  </td>
                  <td>
                    <xsl:value-of select="@JobNumber"/>
                  </td>
                   <td>
                    <xsl:value-of select="@Model"/>
                  </td>
                   <td>
                    <xsl:value-of select="@SerialNo"/>
                  </td>
                   <td>
                    <xsl:value-of select="@TechnicalReportNumber"/>
                  </td>
                   <td>
                    <xsl:value-of select="@VisitDate"/>
                  </td>
                            </tr></xsl:for-each>
                       
                        
                        
                        <xsl:for-each select="noResult">
                            <tr>
                                <td colspan="5">
                                    <xsl:value-of select="@comment" />
                                </td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </div>
        <br/>
                <div class="CollapsiblePanelTab" tabindex="0"></div>
                <div class="CollapsiblePanelContent">
                    <table width="100%" border="1">
                        <tr>
                        <td><b>Job Category</b></td>
                         <td><b>Vat Code</b></td>
                         <td><b>Rate</b></td>
                          <td><b>Vat(Rate)</b></td>
                        <td><b>Line Value</b></td>
                            <td><b>Vat Value</b></td>
                            <td><b>Labour Rate</b></td> 
                                    
                        </tr>

						 <tr>
                           <td>
                    <xsl:value-of select="result/@JobCategory"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@VatCode"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@Rate"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@ Vat_Rate"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@LineValue"/>
                  </td>
                  <td>
                    <xsl:value-of select="result/@VatValue"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@LabourRate"/>
                  </td>
                 
                            </tr>
                    
                        
                        
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
            
        </body></tr> </xsl:if>
       
        
    </xsl:template>
</xsl:stylesheet>
