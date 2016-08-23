module namespace searchJobLine = 'searchJobLine';

import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function searchJobLine:mainQuery($companyCode,$branch,$job,$contractDate,$restrictions,$first,$last,$currentuser){
	let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/SSP54')/SSP54/SSP54-ROW"
	let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($companyCode,$branch,$job,$contractDate),("CONO54","BRSV54","JOBN54","CNDT54"),("=","=","=","="))
	let $return	:= " return
	    for $elem1 in doc('/DATA/JBA/Collection/SSP55')/SSP55/SSP55-ROW[CONO55 =$elem/CONO54][JOBN55=$elem/JOBN54]
	
	return <result
	
				            companyCode = '{$elem1/CONO55}'
                            job = '{$elem1/JOBN55}'
                            modelNumber= '{$elem1/INNO55}'
                            serialNumber= '{$elem1/INTY55}'
                            jobCategory = '{$elem1/JOBT55}'
                            fault= '{$elem1/FLTC55}'
                            faultDescription= '{$elem1/FLT155}'
                            date='{$elem1/DTCT55}'
                            time = '{$elem1/TMCT55}'
                            jobStatus='{$elem1/TMCT55}'
							type='jobLineDetail'
							title='JobLineDetail'
							/> "
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};



                                

