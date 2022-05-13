/**
 * Bibliothèque de fonctions permettant la visualisation 3D d'objets
 *
 * Copyright (C) 2014 Team ~R3F~
 *
 * This program is free software under the terms of the GNU General Public License version 3.
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

 /*
	File: fn_vehicleShop3DPreview.sqf
	Modified By: NiiRoZz

	Description:
	Called when a new selection is made in the list box and
	displays the new vehicle selected.
*/
if (isNil "CL_preview_3D_vehicle_cam") then
{
	[] call CL_fnc_vehicleShopInit3DPreview;
};

private _classView = _this select 0;

// Ignore non instantiable objects.
if (_classView != "" && {isClass (configFile >> "CfgVehicles" >> _classView) && {getNumber (configFile >> "CfgVehicles" >> _classView >> "scope") > 0}}) then
{
	// Skip if object view is the same as previous.
	if (isNull CL_preview_3D_vehicle_object || {_classView != typeOf CL_preview_3D_vehicle_object}) then
	{
		if (!isNull CL_preview_3D_vehicle_object) then {detach CL_preview_3D_vehicle_object; deleteVehicle CL_preview_3D_vehicle_object;};
		// Create and place the object in the sky
		if (!CL_pos_exist) then {
			CL_pos_attach = [[5000, 5000, 0]] call CL_fnc_searchPosEmpty;
			CL_pos_exist = true;
			CL_preview_light = "#lightpoint" createVehicleLocal CL_pos_attach;
			CL_preview_light setLightBrightness 0.5;
			CL_preview_light setLightColor [1,1,1];
			CL_preview_light setLightAmbient [1,1,1];
		};
		private _object = _classView createVehicleLocal CL_pos_attach;
		private _id = player getVariable ["CL_clientID",-1];
		[_object] remoteExecCall ["CL_fnc_hideObj",-_id];
		[CL_preview_light] remoteExecCall ["CL_fnc_hideObj",-_id];
		[_object] call CL_fnc_clearVehicleAmmo;
		_object attachTo [CL_attachment_point, CL_pos_attach];

		CL_preview_3D_vehicle_object = _object;
	};
};
