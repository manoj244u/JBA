module namespace searchParts = 'searchParts';

import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule = 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function searchParts:mainQuery($model,$serialNumber,$account,$company,$location,$generatedserialNumber,$contractNumber,$contractType,$jobNumber,$branch,$restrictions,$first,$last,$currentuser){
let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
let $for := " for $elem in fn:doc('/DATA/JBA/Collection/SSP55')/SSP55/SSP55-ROW"
let $where := dynamicQueryModule:queryWhereFramer("elem",($model,$serialNumber,$account,$company,$location,$generatedserialNumber,$contractNumber,$contractType,$jobNumber,$branch),("INNO55","INTY55","ACNO55","CONO55","LOCN55","SINT55","CNNO55","CNTY55","JOBN55","BRSV55"),("=","=","=","=","=","=","=","=","=","="))
       let $return:= "
 return

         let  $elem1 :=   doc('/DATA/JBA/Collection/SSP54')/SSP54/SSP54-ROW[CONO54 =$elem/CONO55][JOBN54=$elem/JOBN55]
        let  $elem2 :=  doc('/DATA/JBA/Collection/SSP72')/SSP72/SSP72-ROW[CONO72=$elem/CONO55][JOBN72=$elem/JOBN55][SINT72=$elem/SINT55][INTY72=$elem/INTY55]
     let  $elem3 :=  doc('/DATA/JBA/Collection/SSP73')/SSP73/SSP73-ROW[CONO73=$elem/CONO55][JOBN73=$elem/JOBN55][SINT73=$elem/SINT55][INTY73=$elem/INTY55][PART73]
     let  $elem4 := doc('/DATA/JBA/Collection/INP35')/INP35/INP35-ROW[CONO35=$elem/CONO55][PNUM35=$elem3/PART73][PDES35]
     let  $elem5 := doc('/DATA/JBA/Collection/SSP63')/SSP63/SSP63-ROW[CONO63=$elem/CONO55][JOBT63=$elem3/JOBT73]
   let  $elem6 := doc('/DATA/JBA/Collection/SSP77')/SSP77/SSP77-ROW[CONO77=$elem/CONO55][JOBN77=$elem/JOBN55][SINT77=$elem/SINT55][INTY77=$elem/INTY55]


return
<result  


                            companyCode='{$elem1/CONO54}'
							job  ='{$elem1/JOBN54}'
							modelNumber ='{$elem/INNO55}'
							serialNumber ='{$elem/INTY55}'
							contractNumber='{$elem/CNNO55}'
							contractType='{$elem/CNTY55}'
							visitdate='{$elem2/VSDT72}'
                            part='{$elem3/PART73}'
                            partDescription  = '{$elem4/PDES35}'
							jobcategory='{$elem2/JOBT73}'
                            jobcategoryDesc ='{$elem5/WCTD63}' 
                            quantityUsed = '{$elem3/UQTY73}'						
							chg='{$elem3/PYPC73}'
							engineerNumber='{$elem2/ENUM72}'
							hours   ='{$elem2/SITM72}'
							supplier = '{$elem6/SUPN77}'
                             reportNumber='{$elem3/REPN73}'
                            reason = '{$elem6/RESN77}'

                               title='PartsRemoved and UsedDetails'
                            	type='partsDetails'

/> "
let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};

                            

