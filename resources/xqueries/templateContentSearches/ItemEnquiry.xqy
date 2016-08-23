module namespace ItemEnquiry = 'ItemEnquiry';


import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function ItemEnquiry:mainQuery($Company,$CashBookReference,$restrictions,$first,$last,$currentuser){
	let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"


	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/CSP12')/CSP12/CSP12-ROW,
					  $elem1 in doc('/DATA/JBA/Collection/CSP20')/CSP20/CSP20-ROW[CONO20=$elem/CONO12][BANK20=$elem/BANK12][PERD20=$elem/PERD12]"	 


	let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($Company),("CONO12"),("="))
	
		let $whereCorr:=	if($CashBookReference!='') then 
					  if(contains($where,"where")) then			
		          		               concat ($where, "and " ,"$elem1/CBRF20='",$CashBookReference,"'")
					 else  concat(" where "," $elem1/CBRF20='",$CashBookReference,"'")
					else $where
	
	let $return	:= " 
						
					let $elem2 := doc('/DATA/JBA/Collection/CSP11')/CSP11/CSP11-ROW[CONO11=$elem/CONO12][BANK11=$elem/BANK12] 
					return
					
					
               <result 
              
		                              	    Company  = '{$elem/CONO12 }'
		                               	    CashBookReference = '{$elem1/CBRF20}'
		                                	BankAccount = '{$elem/BANK12 }'
		                               	    AccountDescription = '{$elem1/BDSC11 }'
		                                    MasterItemType = '{$elem1/ETYP20}'
		                                    BanksReference = '{$elem1/BREF20}'
		                                    Period = '{$elem/PERD12}'
		                                    DocumentReference = '{$elem1/BREF20}'
		                                    ItemValue ='{$elem1/VLCN20}'
		                                    BankValue ='{$elem1/VLCN20}'
		                                    LedgerValue='{$elem1/VLCN20}'
		                                    CurrencyCode = '{$elem1/CURN20}'
					                  		BankAccountCurrencyCode = '{$elem1/BCRN20}'
		                                
		                                
					                    				                  
					                    title='ItemEnquiryDetails'
							            type='ItemEnquiryDetails' 
					 /> "
	let $main-query := xhive:evaluate(concat($import,$for,$whereCorr,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};