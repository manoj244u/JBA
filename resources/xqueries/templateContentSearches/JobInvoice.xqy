module namespace JobInvoice = 'JobInvoice';


import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function JobInvoice:mainQuery($Company,$Branch,$Invoice,$restrictions,$first,$last,$currentuser){
	let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"


	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/SSP45')/SSP45/SSP45-ROW[RECT45='IN'][INVT45='J']"


	let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($Company,$Branch,$Invoice),("CONO45","BRSV45","INVN45"),("=","=","="))
	let $return	:= " 
              return <result 
              
                              CONO='{$elem/CONO45 }'
                              Invoice='{$elem/INVN45 }'
                              Date1='{utility:dateFormatter($elem/DTIN45)}'
                               Date='{$elem/DTIN45 }'
					                    InvoiceValue='{$elem/INVG45}'
					                    Account='{$elem/ACNO45  }'
					                    Location ='{$elem/LOCN45}'
					                    Currency='{$elem/CURN45}' 
					                  

					                    title='JobInvoiceDetails'
							            type='JobInvoiceDetails' 
					 /> "
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};