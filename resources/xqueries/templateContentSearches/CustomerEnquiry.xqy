module namespace CustomerEnquiry = 'CustomerEnquiry';


import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function CustomerEnquiry:mainQuery($Company,$Customer,$ItemType,$ItemReference,$restrictions,$first,$last,$currentuser){
	let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"


	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/SLP15')/SLP15/SLP15-ROW"


	let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($Company,$Customer,$ItemType,$ItemReference),("CONO15","CUSN15","ETYP15","LREF15"),("=","=","=","="))
	let $return	:= " 
						
						let $elem1 := doc('/DATA/JBA/Collection/SLP05')/SLP05/SLP05-ROW[CONO05=$elem/CONO15][CUSN05=$elem/CUSN15][DSEQ05='000'] 
              return <result 
              
		                                Customer='{$elem/CUSN15 }'
		                                CustomerName='{$elem1/CNAM05 }'
		                                Type='{$elem/ETYP15 }'
		                                Reference='{$elem/LREF15 }'
					                    DateItemCreated='{utility:dateFormatter($elem/DTCR15)}'
					                    Source='{$elem/SRCE15}'
					                    DocumentDate ='{utility:dateFormatter($elem/DOCD15)}'
					                    Period='{$elem/PPER15}' 
					                    Session='{$elem/SESN15}'
					                    
					                    SOPReference='{$elem/SOPN15}'
					                    DueDate='{$elem/PDUE15}'
					                    RateCode='{$elem/CURC15}'
					                    RateCode_MD ='{$elem/MORD15}'
					                    OS_Balance_Base='{$elem/BBAL15}'
					                    OS_Balance_Prime='{$elem/PBAL15}'
					                    Goods_Base='{$elem/BGDS15}'
					                    Goods_Prime='{$elem/PGDS15}'
					                    Discout_Base='{$elem/BDSC15}'
					                    Discount_Prime='{$elem/PDSC15}'
					                    VAT_Base='{$elem/BVAT15}'
					                    VAT_Prime='{$elem/PVAT15}'
					                    Total_Base='{$elem/BTMT15}'
					                    Total_Prime='{$elem/PTMT15}'
					                    ClearedDate='{$elem/CLRD15}'
					                    DiscountCode='{$elem/NFL315}'
					                    ExtendedTerm='{$elem/SPCD15}'
					                    PaymentMethod ='{$elem/PAYM15}'
					              

					                    title='CustomerEnquiryDetails'
							            type='CustomerEnquiryDetails' 
					 /> "
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};