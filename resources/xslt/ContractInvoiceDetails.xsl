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
   
        <xsl:if test="result/@typeOfJob='CCR'"><tr>
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
                        <td><b>Service ContractInvoice Number</b></td>
                        <td><b>Contract Number</b></td>
                            <td><b>Currency Code</b></td>
                            <td><b>Contract Type</b></td>
                           
                            
                            
                        </tr>
                      
                            <tr>
                           <td>
                    <xsl:value-of select="result/@ServiceContractInvoiceNumber"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@ContractNumber"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@CurrencyCode"/>
                  </td>
                  <td>
                    <xsl:value-of select="result/@ContractType"/>
                  </td>
                   
                </tr>
                  <td><b>Contract Start Date</b></td>
                <td><b>Invoice Value</b></td>
                <td><b>Invoice Vat Value</b></td>
                <td><b>Invoice Total</b></td>
               
                <tr>
                <td>
                    <xsl:value-of select="result/@ContractStartDate"/>
                  </td>
                  <td>
                    <xsl:value-of select="result/@InvoiceValue"/>
                  </td>
                  <td>
                    <xsl:value-of select="result/@InvoiceVatValue"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@InvoiceTotal"/>
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
        <br/>
                <div class="CollapsiblePanelTab" tabindex="0"></div>
                <div class="CollapsiblePanelContent">
                    <table width="100%" border="1">
                        <tr>
                        <td><b>Model Description</b></td>
                         <td><b>Serial Number</b></td>
                         <td><b>Inst_Quantity</b></td>
                        <td><b>Total Value</b></td>
                                     
                        </tr>

						 <tr>
                           <td>
                    <xsl:value-of select="result/@ModelDescription"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@SerialNumber"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@Inst_Quantity"/>
                  </td>
                   <td>
                    <xsl:value-of select="result/@TotalValue"/>
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
        </body>
    </tr> </xsl:if>
    
        
    </xsl:template>
</xsl:stylesheet>
