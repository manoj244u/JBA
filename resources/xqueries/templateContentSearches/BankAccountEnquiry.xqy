module namespace BankAccountEnquiry = 'BankAccountEnquiry';


import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function BankAccountEnquiry:mainQuery($Company,$restrictions,$first,$last,$currentuser){
	let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"


	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/CSP11')/CSP11/CSP11-ROW"
						 


	let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($Company),("CONO11"),("="))
	let $return	:= " 
					for	$elem1 in doc('/DATA/JBA/Collection/CSP12')/CSP12/CSP12-ROW[CONO12=$elem/CONO11][BANK12=$elem/BANK11][PERD12='0']
              return
               <result 
              
		                                Company = '{$elem/CONO11 }'
		                                BankAccount = '{$elem/BANK11 }'
		                                BankType =  '{$elem/BTYP11 }'
		                                AccountDescription = '{$elem/BDSC11 }'
					                    Currency = '{$elem/CURN11}'
					                    Balance = '{$elem1/(PYTM12 + RCTM12 + BLOP12 + CGTM12)}'
					                    Suspended = '{$elem1/BLSP12}'
					                    BaseBalance= '{$elem1/CURN45}' 
					                  

					                    title='BankAccountEnquiryDetails'
							            type='BankAccountEnquiryDetails' 
					 /> "
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};