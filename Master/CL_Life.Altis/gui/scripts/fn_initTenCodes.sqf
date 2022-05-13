/*
	File: fn_initTenCodes.sqf
	Author: Goodman
	Description:
	TenCodes for TFR
*/
_header = parseText "<t shadow='2' size='2'>10-Codes Cheat Sheet</t>";

_tenCodesTxt = composeText
[
	_header, lineBreak,
	parseText "<t shadow='2'>10-1  - Unable to copy</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-2  - Solid copy</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-3  - Stop transmitting (STFU)</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-4  - Acknowledgement</t>", lineBreak,
	parseText "<t shadow='2'>10-6  - Busy</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-7  - Out of service (Offline / AFK)</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-8  - Back in service</t>", lineBreak,
	parseText "<t shadow='2'>10-9  - Please repeat</t>", lineBreak,
	parseText "<t shadow='2'>10-12 - Stop or stand by</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-20 - Location</t>", lineBreak,
	parseText "<t shadow='2'>10-22 - Disregard or ignored</t>", lineBreak,
	parseText "<t shadow='2'>10-23 - Arrived on scene</t>", lineBreak,
	parseText "<t shadow='2'>10-24 - Assignment completed</t>", lineBreak,
	parseText "<t shadow='2'>10-28 - Vehicle registration info</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-29 - Check for warrants</t>", lineBreak,
	parseText "<t shadow='2'>10-31 - Crime in progress</t>", lineBreak,
	parseText "<t shadow='2'>10-32 - Armed suspect</t>", lineBreak,
	parseText "<t shadow='2'>10-33 - Emergency</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-36 - Armed traffic stop</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-38 - Stopping vehicle (traffic stop)</t>", lineBreak,
	parseText "<t shadow='2'>10-39 - Urgent (lights and sirens)</t></t>", lineBreak,
	parseText "<t shadow='2'>10-40 - Silent (no lights and sirens)</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-50 - Traffic accident</t>", lineBreak,
	parseText "<t shadow='2'>10-74 - Negative / No</t>", lineBreak,
	parseText "<t shadow='2'>10-76 - En route / Responding</t>", lineBreak,
	parseText "<t shadow='2'>10-77 - ETA</t>", lineBreak,
	parseText "<t shadow='2'>10-78 - Need assistance</t>", lineBreak,
	parseText "<t shadow='2' color='#99ff99'>10-80 - In pursuit</t>", lineBreak
];

(_this select 0) ctrlSetStructuredText _tenCodesTxt;
