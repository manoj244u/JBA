module namespace searchContractList = 'searchContractList';

import module namespace common 				= 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility 			= 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';


declare function searchContractList:mainQuery($contractNumber,$contractType,$accountNumber,$accountAddress,$restrictions,$first,$last,$currentuser){
    let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/SSP35')/SSP35/SSP35-ROW"
                              
 let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($contractNumber,$contractType,$accountAddress),("CNNO35","CNTY35","LOCN35"),("=","=","="))
         
         
  let $whereCorr :=if($accountNumber!='') then 
					  if(contains($where,"where")) then			
		          		               concat ($where, "and " ,"$elem/ACNO35='",$accountNumber,"'")
					 else  concat(" where "," $elem/ACNO35='",$accountNumber,"' and $elem/STAT35='A'")
                                                    else $where         
         
	let $return	:=  
	"
	return
	    let $elem1 :=  doc('/DATA/JBA/Collection/SSP64')/SSP64/SSP64-ROW[CONO64=$elem/CONO35][CNTY64=$elem/CNTY35]
	
	
	
	return
	<result
	            
	               
			                 company='{$elem/CONO35}' 
                             contract ='{$elem/CNNO35}'      
                             contractType='{$elem/CNTY35}'
                             description='{$elem1/CNDS64}'
                             contractStartDate='{$elem/CNDT35}'
                              status='{$elem/STAT35}'
                             
                                  title='JobContract'
					               type='jobContract'     
							/> "
							
							
	
	let $main-query := xhive:evaluate(concat($import,$for,$whereCorr,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
    
};

