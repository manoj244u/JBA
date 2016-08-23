module namespace searchInternal = 'searchInternal';

import module namespace common 				= 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility 			= 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function searchInternal:mainQuery($job,$model,$serialNumber,$generatedserialNumber,$restrictions,$first,$last,$currentuser){
    let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/SSP55')/SSP55/SSP55-ROW"
	let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($job,$model,$serialNumber,$generatedserialNumber),("JOBN55","INNO55","INTY55","SINT55"),("=","=","=","="))
	let $return	:= "
		
		
	
	return
	 <result
				            companyCode='{$elem/CONO55}'
				            job='{$elem/JOBN55}'
				            branch='{$elem/BRSV55}'
						     modelNumber = '{$elem/INNO55}'
						    serialNumber = '{$elem/INTY55}'
							title= 'InternalDetails'
		                    type = 'internalDetails'
							/> "
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};



                                

