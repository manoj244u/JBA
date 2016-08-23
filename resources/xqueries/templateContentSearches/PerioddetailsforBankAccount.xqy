module namespace PerioddetailsforBankAccount = 'PerioddetailsforBankAccount';


import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function PerioddetailsforBankAccount:mainQuery($Company,$Account,$restrictions,$first,$last,$currentuser){
	let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"


	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/CSP11')/CSP11/CSP11-ROW"
						 


	let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($Company,$Account),("CONO11","BANK11"),("=","="))
	let $return	:= " 
					for	$elem1 in doc('/DATA/JBA/Collection/CSP12')/CSP12/CSP12-ROW[CONO12=$elem/CONO11][BANK12=$elem/BANK11][PERD12 !='0']
              return
               <result 
              
		                                Company = '{$elem1/CONO12 }'
		                                BankAccount = '{$elem1/BANK12 }'
		                                AccountDescription = '{$elem/BDSC11 }'
					                    Currency = '{$elem/CURN11}'
					                    Period = '{$elem1/PERD12}'
					                    OpeningBalanceinBankCurrency = '{$elem1/BLOP12}'
					                 ClosingBalanceinBankCurrency = '{$elem1/(PYTM12 + RCTM12  + CGTM12 + BLOP12)}'
					         
					                    
					             			                
					                  
					                    title='Period Details for Bank Account Details'
							            type='PerioddetailsforBankAccountDetails' 
					 /> "
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};