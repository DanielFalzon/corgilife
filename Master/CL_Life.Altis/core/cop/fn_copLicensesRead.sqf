/*
	File: fn_copLicensesRead.sqf
	Author: Dark
	Description:
	Outprints the cops licenses.
*/
params [
	["_cop","",[""]],
	["_licenses",(localize "STR_Cop_NoLicenses"),[""]]
];

hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'>" +(localize "STR_Cop_Licenses")+ "</t></t><br/>%2",_cop,_licenses];
