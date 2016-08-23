module namespace InvoiceEnquiry = 'InvoiceEnquiry';

import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule = 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function InvoiceEnquiry:mainQuery($InvoiceNumber,$CreditNumber,$StatementAccount,$SiteAccount,$Location,$Company,$restrictions,$first,$last,$currentuser){

	let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"

	let $for 	:= "	for $elem in doc('/DATA/JBA/Collection/SSP45')/SSP45/SSP45-ROW"
		      

        
		let $where := dynamicQueryModule:queryWhereFramer("elem",($StatementAccount,$SiteAccount,$Location,$Company),("ACNO45","ACNO45","LOCN45","CONO45"),("=","=","=","="))
	

			let $whereCorr:=	if($CreditNumber!='') then 
					  if(contains($where,"where")) then			
		          		               concat ($where, "and " ,"$elem/INVN45='",$CreditNumber,"'")
					 else  concat(" where "," $elem/INVN45='",$CreditNumber,"' and $elem/RECT45='CR'") 
					else if($InvoiceNumber!='') then 
					  if(contains($where,"where")) then			
		          		               concat ($where, "and " ,"$elem/INVN45='",$InvoiceNumber,"'")
					 else  concat(" where "," $elem/INVN45='",$InvoiceNumber,"' and $elem/RECT45='IN'") 	
				          	else $where
				
	let $return:= " 	let $elem1 := doc('/DATA/JBA/Collection/SLP05')/SLP05/SLP05-ROW[CONO05=$elem/CONO45][CUSN05=$elem/ACNO45][DSEQ05=$elem/LOCN45] 
									return
									<result 
										  CONO='{$elem/CONO45 }'
									    Invoice='{$elem/INVN45 }'
									    Invoice_Credit='{$elem/INVN45 }'
									    Date1='{utility:dateFormatter($elem/DTIN45)}'
                               Date='{$elem/DTIN45 }'
					                    InvoiceValue='{$elem/INVG45  }'
					                    Account='{$elem/ACNO45  }'
					                    Location ='{$elem/LOCN45}'
					                      Company='{$elem/CONO45 }'
					                    Currency='{$elem/CURN45}'
					                    Type='{$elem/INVT45}'
					                    InstallatonName='{$elem1/CNAM05}' 	
					                     title='InvoiceEnquiryDetails'
							            type='InvoiceEnquiryDetails' 			                   		                    
					               
					 /> "
	let $main-query := xhive:evaluate(concat($import,$for,$whereCorr,$return))
     return common:getQuerySubsequence($main-query, $first, $last)
};