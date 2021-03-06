module namespace searchCost = 'searchCost';

import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule = 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

            
declare function searchCost:mainQuery($model,$serialNumber,$account,$company,$location,$generatedserialNumber,$contractNumber,$contractType,$jobNumber,$branch,$restrictions,$first,$last,$currentuser){
let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
let $for := " for $elem in fn:doc('/DATA/JBA/Collection/SSP55')/SSP55/SSP55-ROW"
let $where := dynamicQueryModule:queryWhereFramer("elem",($model,$serialNumber,$account,$company,$location,$generatedserialNumber,$contractNumber,$contractType,$jobNumber,$branch),("INNO55","INTY55","ACNO55","CONO55","LOCN55","SINT55","CNNO55","CNTY55","JOBN55","BRSV55"),("=","=","=","=","=","=","=","=","=","="))
       let $return:= "
 return

         let  $elem1 :=   doc('/DATA/JBA/Collection/SSP54')/SSP54/SSP54-ROW[CONO54 =$elem/CONO55][JOBN54=$elem/JOBN55]
        let  $elem2 :=  doc('/DATA/JBA/Collection/SSP72')/SSP72/SSP72-ROW[CONO72=$elem/CONO55][JOBN72=$elem/JOBN55][SINT72=$elem/SINT55][INTY72=$elem/INTY55]
        let  $elem3 := doc('/DATA/JBA/Collection/SSP74')/SSP74/SSP74-ROW[CONO74=$elem/CONO55][JOBN74=$elem/JOBN55] 
      let $T01 := if ($elem3/MXRF74 > 0 ) then doc('/DATA/JBA/Collection/SSP11')/SSP11/SSP11-ROW[CONO11=$elem/CONO55] [XTYP11='MD'][XREF11=$elem3/MXRF74] 
      else if ($elem3/MXRF74 = '0') then  doc('/DATA/JBA/Collection/SSP12')/SSP12/SSP12-ROW[CONO12=$elem/CONO55] [PRMT12='CHGT'] [PSAR12 = $elem3/CHGT74] else ()
	 let  $elem4 :=   doc('/DATA/JBA/Collection/SSP63')/SSP63/SSP63-ROW[CONO63 =$elem/CONO63][JOBT63=$elem/JOBT74]

 


return
<result  


                            companyCode='{$elem1/CONO54}'
							job  ='{$elem1/JOBN54}'
							modelNumber ='{$elem/INNO55}'
							serialNumber ='{$elem/INTY55}'
							contractNumber='{$elem/CNNO55}'
							contractType='{$elem/CNTY55}'
							visitdate='{$elem2/VSDT72}'
							jobCategory=''
                            chargeType='{$elem3/CHGT74}'
                            modifiedText = '{$T01/TLIN11}'
							standardText = '{$T01/DESC12}'
                           	jobType = '{$elem3/JOBT74}'
							jobDesc='{$elem4/WCTD63}'
							amount='{$elem3/INVA74}'
							vat='{$elem3/IVCD74}'
							engineer='{$elem3/ENUM74}'
							rep='{$elem3/REPN74}'
							uplift='{$elem3/UPPC74}'
							act='{$elem3/CSTT74}'
							chg='{if($elem3/PYPC74=  '100')then '1' else '0'}'
							

                             title='Misc and Cost Details'
                             type='costDetails'

/> "
let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};
