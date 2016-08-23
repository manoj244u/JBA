module namespace searchLabour = 'searchLabour';

import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule = 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function searchLabour:mainQuery($model,$serialNumber,$account,$company,$location,$generatedserialNumber,$contractNumber,$contractType,$jobNumber,$branch,$restrictions,$first,$last,$currentuser){
let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
let $for := " for $elem in fn:doc('/DATA/JBA/Collection/SSP55')/SSP55/SSP55-ROW"
let $where := dynamicQueryModule:queryWhereFramer("elem",($model,$serialNumber,$account,$company,$location,$generatedserialNumber,$contractNumber,$contractType,$jobNumber,$branch),("INNO55","INTY55","ACNO55","CONO55","LOCN55","SINT55","CNNO55","CNTY55","JOBN55","BRSV55"),("=","=","=","=","=","=","=","=","=","="))
let $return:= 
" 
return

      let  $elem1 :=   doc('/DATA/JBA/Collection/SSP54')/SSP54/SSP54-ROW[CONO54 =$elem/CONO55][JOBN54=$elem/JOBN55]
     let  $elem2 :=  doc('/DATA/JBA/Collection/SSP72')/SSP72/SSP72-ROW[CONO72=$elem/CONO55][JOBN72=$elem/JOBN55][INNO72=$elem/INNO55][INTY72=$elem/INTY55][SINT72=$elem/SINT55]
     let  $elem3 :=  doc('/DATA/JBA/Collection/SSP70')/SSP70/SSP70-ROW[CONO70=$elem/CONO55] [REPN70=$elem/REPN55]
     let  $elem4 := doc('/DATA/JBA/Collection/SSP12')/SSP12/SSP12-ROW[CONO12=$elem/CONO55] [PRMT12 = 'FLTC' and PSAR12 = 'AFLT72']


return
          <result  


                            companyCode='{$elem1/CONO54}'
							jobNumber  ='{$elem1/JOBN54}'
							model ='{$elem/INNO55}'
							serialNumber ='{$elem/INTY55 }'
							contractNumber='{$elem/CNNO55}'
							contractType='{$elem/CNTY55}'
							visitdate='{utility:dateFormatter($elem2/VSDT72)}'
							jobcategory='{$elem2/JOBT72}'
							report='{$elem2/REPN72}'
							date='{utility:dateFormatter($elem2/RPDT72)}'
							chg='{$elem2/PYPC72}'
							traveltime =''
							correctiveAction='{$elem2/CORA72}'
							mileage='{$elem3/MILE70}'
							hoursType='{$elem2/LHTY72}'
							recordedFault='{$elem2/AFLT72}'
							faultDescription='{$elem4/PDESC12}'
							engineerNumber='{$elem2/ENUM72}'
							hours   ='{$elem2/SITM72}'
							section='{$elem/SECT72}'
							sub-section ='{$elem/SSCT72}'
                            title='LabourHoursDetails'
                             type='labourDetails'

/> "
let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};

                                

