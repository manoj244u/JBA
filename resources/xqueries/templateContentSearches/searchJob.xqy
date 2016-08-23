module namespace searchJob = 'searchJob';

import module namespace common 				= 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility 			= 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';


declare function searchJob:mainQuery($serialNumber,$model,$accountNumber,$contractNumber,$customerOrderNo,$jobNumber,$mServicetempjob,$restrictions,$first,$last,$currentuser){
    let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
	let $for 	:= " for $elem1 in doc('/DATA/JBA/Collection/SSP55')/SSP55/SSP55-ROW"
                              
 let $where 	:= dynamicQueryModule:queryWhereFramer("elem1",($serialNumber,$model,$accountNumber,$contractNumber,$customerOrderNo,$jobNumber,$mServicetempjob),("INTY55","INNO55","ACNO55","CNNO55","ORDN55","JOBN55","AUNO55" ),("=","=","=","=","=","=","="))
         
	let $return	:=  
	
	
	"  return
                    let $elem := doc('/DATA/JBA/Collection/SSP54')/SSP54/SSP54-ROW[JOBN54= $elem1/JOBN55][BRSV54=$elem1/BRSV55]
	
	return
	<result
	            
	               
			                            companyCode='{$elem/CONO54}'
			                            branch = '{$elem/BRSV54}'
			                            job='{$elem/JOBN54}'
			                            contractdate='{$elem/CNDT54}'
			                            modelNumber = '{$elem1/INNO55}'
			                            serialNumber = '{$elem1/INTY55}'
			                            jobCategory = '{$elem1/JOBT55}'
			                            fault= '{$elem1/FLTC55}'
			                            date='{utility:dateFormatter($elem1/DTCT55)}'
			                            time = '{utility:genTime($elem1/TMCT55)}'
					        title='Job History Details'
					        type ='jobHistoryDetails'
					                    
							/> "
							
							
							
	
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
    
};

