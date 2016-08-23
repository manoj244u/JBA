module namespace CashPostingsforPeriod = 'CashPostingsforPeriod';


import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function CashPostingsforPeriod:mainQuery($Company,$Account,$Period,$ClosingBalance,$restrictions,$first,$last,$currentuser){
	let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"


	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/CSP12')/CSP12/CSP12-ROW,
					  $elem1 in doc('/DATA/JBA/Collection/CSP11')/CSP11/CSP11-ROW[CONO11=$elem/CONO12][BANK11=$elem/BANK12]"	 


	let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($Company,$Account,$Period,$ClosingBalance),("CONO12","BANK12","PERD12","(PYTM12 + RCTM12 + CGTM12 + BLOP12)"
	),("=","=","=","="))
	let $return	:= " 
						
					for $elem2 in doc('/DATA/JBA/Collection/CSP20')/CSP20/CSP20-ROW[CONO20=$elem/CONO12][BANK20=$elem/BANK12][PERD20=$elem/PERD12] 
					return
					
					
               <result 
              
		                                Company = '{$elem/CONO12 }'
		                                BankAccount = '{$elem/BANK12 }'
		                                Period = '{$elem/PERD12}'
		                                AccountDescription = '{$elem1/BDSC11 }'
					                    ClosingBalanceinBankCurrency = '{$elem/(PYTM12 + RCTM12 + CGTM12 + BLOP12)}'
					                    Suspended ='{$elem/(SPTM12 + SRTM12) }'
					                 
					                    Source = '{$elem2/SRCE20}'
					                    MasterItemType = '{$elem2/ETYP20}' 
					                    CashBookReference  = '{$elem2/CBRF20}'
					                    BanksReference = '{$elem2/BREF20}'
					                    Description = '{$elem2/DESC20}'
					                    BaseCurrencyValue = '{$elem2/VLCN20}'
					                    CurrencyValue = '{$elem2/CURV20}'
					                    CurrencyCode = '{$elem2/CURN20}'
					                    BankAccountCurrencyCode = '{$elem2/BCRN20}'
					         
					                    				                  
					                    title='Cash Postings for Period Details'
							            type='CashPostingsforPeriodDetails' 
					 /> "
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};