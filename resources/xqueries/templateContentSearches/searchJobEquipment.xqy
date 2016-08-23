module namespace searchJobEquipment = 'searchJobEquipment';

import module namespace common = 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';



declare function searchJobEquipment:mainQuery($model,$serialNumber,$account,$location,$generatedserialnumber,$companyCode,$branch,$restrictions,$first,$last,$currentuser){
	let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
	let $for 	:= " for $elem in doc('/DATA/JBA/Collection/SSP55')/SSP55/SSP55-ROW"
	let $where 	:= dynamicQueryModule:queryWhereFramer("elem",($model,$serialNumber,$account,$location,$generatedserialnumber,$companyCode,$branch),("INNO55","INTY55","ACNO55","LOCN55","SINT55","CONO55","BRSV55"),("=","=","=","=","=","=","="))
	let $return	:= 
	" return
	          
	                 let  $elem1 := doc('/DATA/JBA/Collection/SSP22')/SSP22/SSP22-ROW[INNO22=$elem/INNO55][INTY22=$elem/INTY55][ACNO22=$elem/ACNO55]
                     let  $elem2 := doc('/DATA/JBA/Collection/SLP05')/SLP05/SLP05-ROW[CONO05=$elem1/CONO22][ CUSN05=$elem1/ACNO22][DSEQ05=$elem1/LOCN22]
                     let  $elem3 := doc('/DATA/JBA/Collection/SSPA8')/SSPA8/SSPA8-ROW[INNOA8=$elem/INNO55][INTYA8=$elem/INTY55][CONOA8=$elem/CONO55][BRSVA8=$elem/BRSV55]
                     let  $elem4 := doc('/DATA/JBA/Collection/SSP30')/SSP30/SSP30-ROW[CONO30=$elem/CONO55][INNO22=$elem/INNO55][MODL30]
                     let  $elem5 := doc('/DATA/JBA/Collection/SSP12')/SSP12/SSP12-ROW[CONO12=$elem1/CONO22]
                     let  $elem6 := doc('/DATA/JBA/Collection/SSP75')/SSP75/SSP75-ROW[CONO75=$elem1/CONO22][DIVC75=$elem1/DIVC22]
                     let  $elem7 := doc('/DATA/JBA/Collection/SSP24')/SSP24/SSP24-ROW[CONO24=$elem/CONO55][ENUM24=$elem/ENUM55]
	
	return 
	      <result
 companyCode= '{$elem1/CONO22}'                       
site='{$elem1/ACNO22}'
siteLocation='{$elem1/LOCN22}'
account='{$elem/CNAM05}'
ownerAccount='{$elem3/OWACA8}'
OwnerAddressCode='{$elem3/OWADA8}'
model='{$elem1/INNO22}'
ModelDescription='{$elem4/PDES30}'
serialNumber='{$elem1/INTY22}'
Quantity='{$elem1/IQTY22}'
CustomerAssetNumber='{$elem1/XDPH22}'
Revision='{$elem1/CULC22}'
EquipmentStatus='{$elem1/EQST22}'
EquipmentStatusDescription='{$elem5/DESC12}'
CustomerStatus='{$elem1/SPA522}'
CustomerStatusDescription='{$elem5/DESC12}'
VatCalcBasis='{$elem1/VATI22}'
VATCode='{$elem1/VATC22}'
ModelYear='{$elem1/MODY22}'
LastServiced='{$elem1/LSDT22}'
WarrantyUnits='{$elem1/CCWT22}'
WarrantyMonths='{$elem1/WRTY22}'
InstallationDate='{utility:dateFormatter($elem1/INSD22)}'
DeliveryDate='{utility:dateFormatter($elem1/DELD22)}'
WarrantyExpiryDate='{utility:dateFormatter($elem1/DTWX22)}'
Location='{$elem1/TLOC22}'
EquipmentContact='{$elem1/CNTC22}'
Division='{$elem1/DIVC22}'
DivisionDescription='{$elem6/PDES75}'
ContractNumber ='{$elem1/CNNO22}'
ContractType='{$elem1/CNTY22}'
ContractStartDate='{$elem1/CNDT22}'
InclusionDate='{utility:dateFormatter($elem1/CCADT38)}'
EngineerNumber='{$elem1/ENUM22}'
EngineerName='{$elem7/ENAM24}'
Points='{$elem1/PNTS22}'
Servicesbyourselves ='{$elem1/MCSF22}'
Underproductsupervision ='{$elem/MCPS22}'
OrderType='{$elem1/ORDT22}'
OrderNumber='{$elem1/SORD22}'
OrderLineNumber='{$elem1/ORDL22}'
CalendarCode='{$elem1/CCAL22}'
CalendarCodeDescription='{$elem1/DESC12}'

                        
							type='jobLineEquipment'
							title='JobLineEquipmentDetail'
							/> "
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};


                                

