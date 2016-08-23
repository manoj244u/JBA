module namespace searchSchedVisit = 'searchSchedVisit';

import module namespace common 				= 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility 			= 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function searchSchedVisit:mainQuery($company,$branch,$contractNumber,$contractType,$contractStartDate,$model,$serialNumber,$generatedSerialNumber,$restrictions,$first,$last,$currentuser){
    let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/SSP38')/SSP38/SSP38-ROW"
	                          
 let $where := dynamicQueryModule:queryWhereFramer("elem",($company,$branch,$contractNumber,$contractType,$contractStartDate,$model,$serialNumber,$generatedSerialNumber),("CONO38","BRSV38","CNNO38","CNTY38","CNDT38","INNO38","INTY38","SINT38"),("=","=","=","=","=","=","=","="))
 
let $return	:=  
	       "
              return

             let $elem1 :=  doc('/DATA/JBA/Collection/SSP22')/SSP22/SSP22-ROW[CONO22=$elem/CONO38][BRSV22=$elem/BRSV38][INTY22=$elem/INTY38][INNO22=$elem/INNO38]
             let $elem2 :=  doc('/DATA/JBA/Collection/SSP64')/SSP64/SSP64-ROW[CONO64=$elem/CONO38][CNTY64=$elem/CNTY38]
            let $elem3 :=  doc('/DATA/JBA/Collection/SSP36')/SSP36/SSP36-ROW[CONO36=$elem/CONO38][BRSV36=$elem/BRSV38][INTY36=$elem/INTY38][INNO36=$elem/INNO38]
                  return
	            <result
	            
			                    company ='{$elem/CONO38}'
								branch='{$elem/BRSV38}'
								contractNumber='{$elem/CNNO38}'
								contractType='{$elem/CNTY38}'
								contractStartDate='{$elem/CNDT38}'
								model='{$elem/INNO38}'
								serialNumber='{$elem/INTY38}'
								generatedSerialNumber='{$elem/SINT38}'
                                quantity='{$elem1/IQTY22}'
                                description='{$elem2/CNDS64}'
                                period='{$elem3/SCPD36}'
                                numberofVisits='{$elem3/VSNO36}'
                                jobCategory='{$elem3/JOBT36}'
                                jobCategoryDescription='{$elem2/CNDS64}'
                                title='schedVisit'
					            type='schedVisit'     
							/> "
							
							
	
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
    
};                      
   
							
	
	