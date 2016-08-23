module namespace Finance = 'Finance';

import module namespace common 				= 'common' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/common.xqy';
import module namespace utility 			= 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';
import module namespace dynamicQueryModule 	= 'dynamicQueryModule' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/dynamicQueryModule.xqy';

declare function Finance:mainQuery($company,$ledger,$account,$restrictions,$first,$last,$currentuser){
    let $import := "import module namespace utility = 'utility' at '/APPLICATIONS/JBA/resources/xqueries/commonModules/utility.xqy';"
	let $for 	:= " for $x in doc('/DATA/JBA/Collection/F/FLP004')/FLP004/FLP004-ROW"
	let $where 	:= dynamicQueryModule:queryWhereFramer("x",($company,$ledger,$account),("CONO","LEDNO","PSTPER"),("=","=","="))
	let $return	:=  "return
<result	
	company='{$x/CONO}'
	ledger='{$x/LEDNO}'
	account='{$x/PSTPER}'		
	period='{$x/PSTPER}'
	npdr='{$x/NPDR04}'
	npcr='{$x/NPCR04}'
	netpostedforperiod = '{$x/NPDR04+$x/NPCR04}'
	fiscalyeartodate='{$x/FYDR04+$x/FYCR04}'
	calenderyeartodate='{$x/CYDR04+$x/CYCR04 }'
	type='FinanceEnquiryAllPeriods'
	title=''
	/>"
		
	let $main-query := xhive:evaluate(concat($import,$for,$where,$return))
    return common:getQuerySubsequence($main-query, $first, $last)
};