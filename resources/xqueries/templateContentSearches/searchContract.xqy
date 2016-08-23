module namespace searchContract = 'searchContract';

import module namespace common 				= 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility 			= 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function searchContract:mainQuery($company,$branch,$accountNumber,$accountLocation,$accountName,$contractNumber,$contractType,$contractStartDate,$restrictions,$first,$last,$currentuser){
    let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/SSP35')/SSP35/SSP35-ROW"
	                    
                              
    let $where 	:=dynamicQueryModule:queryWhereFramer("elem",($company,$branch,$accountNumber,$accountLocation,$contractNumber,$contractType,$contractStartDate),("CONO35","BRSV35","ACNO35","LOCN35","CNNO35","CNTY35",'CNDT35'),("=","=","=","=","=","="))
    let $whereCorr:=if($accountName!='') then 
					if(contains($where,"where")) then			
		            concat ($where, "and " ,"$elem1/CNAM05='",$accountName,"'")
					else  concat(" where "," $elem1/CNAM05='",$accountName,"'")
					else $where
    let $return	:=  
	       "
         	return
	 let  $elem1 := doc('/DATA/JBA/Collection/SLP05')/SLP05/SLP05-ROW[CONO05=$elem/CONO35][ACNO05=$elem/ACNO35][LOCN05=$elem/LOCN35]
	 let  $elem3 :=  doc('/DATA/JBA/Collection/SSP38')/SSP38/SSP38-ROW[CONO38=$elem/CONO35][ACNO38=$elem/ACNO35][LOCN38=$elem/LOCN35][CNDT38=$elem/CNDT35]
	 let  $elem2 :=  doc('/DATA/JBA/Collection/SSP12')/SSP12/SSP12-ROW[CONO12=$elem/CONO35][PRMT12 = 'CHST'][ PSAR12=$elem3/RSTA38]
	 let  $elem4 :=  doc('/DATA/JBA/Collection/SSP36')/SSP36/SSP36-ROW[CONO36=$elem3/CONO38][CNNO36=$elem3/CNNO38][CNTY36=$elem3/CNTY38][CNDT36=$elem3/CNDT38][INNO36=$elem3/INNO38][INTY36=$elem3/INTY38]
	       return
	            <result
	            
			                    company ='{$elem/CONO35}'
								branch='{$elem/BRSV35}'
								accountNumber='{$elem/ACNO35}'
								accountLocation='{$elem/LOCN35}'
								accountName='{$elem1/CNAM05}'
								contractNumber='{$elem/CNNO35}'
								contractType='{$elem/CNTY35}'
								contractstartDate='{$elem/CNDT35}'
								installationAddress='{$elem3/ACNO38}'
								location='{$elem3/LOCN38}'
								model='{$elem3/INNO38}'
								serial='{$elem3/INTY38}'
								status='{$elem2/DESC12}'
								incDate='{$elem3/CADT38}'
								removaldate='{$elem3/RMDT38}'
								rhours='{$elem3/RSPH38}'
								visit='{if($elem4/CONO36 !='') then '1' else '0'}'
								calendarCode='{$elem3/CCAL38}'
								cancelReason='{$elem3/SPA438}'
                                   title='ContractEquipment'
					               type='contractEquipment'     
							/> "
							
							
	
	let $main-query := xhive:evaluate(concat($import,$for,$whereCorr,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
    
};
