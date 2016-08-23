module namespace searchequipEnquiry = 'searchequipEnquiry';

import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule = 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function searchequipEnquiry:mainQuery($companyCode,$branch,$job,$Model,$SerialNumber,$restrictions,$first,$last,$currentuser){
let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
let $for := " for $elem in fn:doc('/DATA/JBA/Collection/SSP55')/SSP55/SSP55-ROW"
let $where := dynamicQueryModule:queryWhereFramer("elem",($companyCode,$branch,$job,$Model,$SerialNumber),("CONO55","BRSV55","JOBN55","CNDT55"),("=","=","=","=","="))
let $return:= " return

          <result  


                            companyCode = '{$elem/CONO55}'
                            branch= '{$elem/BRSV55}'
                            job = '{$elem/JOBN55}'
                            date= '{$elem/TDAT55}'
                            time= '{$elem/TDAT55}'
                            account= '{$elem/CONO55}'
                            location = '{$elem/LOCN55}'
                            calibrationDate= '{$elem/CALD55}'
                            description= '{$elem/DESC55}'
                            title='Test Equipment Details'
					        type ='equipEnquiry'
                            

/> "
let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};

                                

