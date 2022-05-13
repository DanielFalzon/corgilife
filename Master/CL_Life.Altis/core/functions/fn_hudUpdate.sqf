#include "..\..\script_macros.hpp"

#define INFINITE 1e+1000
#define IDC_CL_BAR_FOOD 2200
#define IDC_CL_BAR_FOOD_RING 3200
#define IDC_CL_BAR_WATER 2201
#define IDC_CL_BAR_WATER_RING 3201
#define IDC_CL_BAR_HEALTH 2202
#define IDC_CL_BAR_HEALTH_RING 3202
#define IDC_CL_BAR_Speaker 3007
#define IDC_CL_BAR_SeatBelt 4203

disableSerialization;
private _ui = uiNameSpace getVariable ["playerHUD",displayNull];
if (isNull _ui) then {[] call CL_fnc_hudSetup;};

//[CL_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
CL_ID_PlayerTags = ["CL_PlayerTags","onEachFrame","CL_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;

if (!isNil "CL_seatbelt") then {
    if (!(vehicle player isEqualTo player)) then {
        if (CL_seatbelt) then {
            CLctrl(IDC_CL_BAR_SeatBelt) ctrlSetText "icons\HUD\seatbeltOn.paa";
        } else {
            CLctrl(IDC_CL_BAR_SeatBelt) ctrlSetText "icons\HUD\seatbeltOff.paa";
        };
    } else {
        CLctrl(IDC_CL_BAR_SeatBelt) ctrlSetText "";
    };
};

if (!isNil "CL_fadeSound") then
{
	if (CL_fadeSound) then
	{
		CLctrl(IDC_CL_BAR_Speaker) ctrlSetText "icons\HUD\earplugsY.paa";
	} else {
		CLctrl(IDC_CL_BAR_Speaker) ctrlSetText "icons\HUD\earplugsN.paa";
	};
};

if (!isNil "CL_thirst") then
{
	if (CL_thirst <= 100) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water0.paa";
	};

	if (CL_thirst <= 90) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water1.paa";
	};

	if (CL_thirst <= 80) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water2.paa";
	};

	if (CL_thirst <= 70) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water3.paa";
	};

	if (CL_thirst <= 60) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water4.paa";
	};

	if (CL_thirst <= 50) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water5.paa";
	};

	if (CL_thirst <= 40) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water6.paa";
	};

	if (CL_thirst <= 30) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water7.paa";
	};

	if (CL_thirst <= 20) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water8.paa";
	};

	if (CL_thirst <= 10) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water9.paa";
	};

	if (CL_thirst <= 0) then
	{
		CLctrl(IDC_CL_BAR_WATER_RING) ctrlSetText "icons\HUD\water10.paa";
	};
};

if (damage player >= 0) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health0.paa";
};

if (damage player >= 0.01) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health1.paa";
};

if (damage player >= 0.02) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health2.paa";
};

if (damage player >= 0.03) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health3.paa";
};

if (damage player >= 0.07) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health4.paa";
};

if (damage player >= 0.13) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health5.paa";
};

if (damage player >= 0.2) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health6.paa";
};

if (damage player >= 0.3) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health7.paa";
};

if (damage player >= 0.4) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health8.paa";
};

if (damage player >= 0.7) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health9.paa";
};

if (damage player >= 1) then
{
	CLctrl(IDC_CL_BAR_HEALTH_RING) ctrlSetText "icons\HUD\health10.paa";
};

if (!isNil "CL_hunger") then
{
	if (CL_hunger <= 100) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food0.paa";
	};

	if (CL_hunger <= 90) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food1.paa";
	};

	if (CL_hunger <= 80) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food2.paa";
	};

	if (CL_hunger <= 70) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food3.paa";
	};

	if (CL_hunger <= 60) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food4.paa";
	};

	if (CL_hunger <= 50) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food5.paa";
	};

	if (CL_hunger <= 40) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food6.paa";
	};

	if (CL_hunger <= 30) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food7.paa";
	};

	if (CL_hunger <= 20) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food8.paa";
	};

	if (CL_hunger <= 10) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food9.paa";
	};

	if (CL_hunger <= 0) then
	{
		CLctrl(IDC_CL_BAR_FOOD_RING) ctrlSetText "icons\HUD\food1.paa";
	};
};