module namespace jobcontract = 'jobcontract';


import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function jobcontract:mainQuery($Company,$Branch,$Invoice,$restrictions,$first,$last,$currentuser){
	let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
	
	
	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/SSP45')/SSP45/SSP45-ROW"
	 
	 
	
	let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($Company,$Branch,$Invoice),("CONO45","BRSV45","INVN45"),("=","=","="))
	let $return	:= "let $elem1 := doc('/DATA/JBA/Collection/SLP05')/SLP05/SLP05-ROW[CONO05=$elem/CONO45][CUSN05=$elem/ACNO45][DSEQ05=$elem/LOCN45] 
									return
									<result  
									    CONO='{$elem/CONO45 }'
									    Invoice='{$elem/INVN45 }'
									    Date1='{utility:dateFormatter($elem/DTIN45)}'
                                        Date='{$elem/DTIN45 }'
					                    InvoiceValue='{$elem/INVG45}'
					                    Account='{$elem/ACNO45  }'
					                    Location ='{$elem/LOCN45}'
					                    Currency='{$elem/CURN45}' 
					                    ACName='{$elem1/CNAM05}' 
					                    ACAddressLine1='{$elem1/CAD105}'
					                    ACAddressLine2='{$elem1/CAD205}'
					                    ACAddressLine3='{$elem1/CAD305}'
					                    ACAddressLine4='{$elem1/CAD405}'
					                    ACAddressLine5='{$elem1/CAD505}'
					                    PostCode='{$elem1/PCD105}'
					                    typeOfJob ='{$elem/RECT45 }'
					                    				                   		                    
					                    title='JoborcontractDetails1'
							            type='JoborcontractDetails1' 
					 /> "
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};