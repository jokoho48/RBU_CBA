#include "script_component.hpp"
/*
    RBU

    Author: joko // Jonas

    Description:
    FiredMan EH that Triggers Dispatching of AI Groups

    Remarks:
    Only Execute On the Server

    Parameter(s):
    FiredMan EH Arguments:
    https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#FiredMan

    Returns:
    NONE
*/
//Get all needed vars
params ["_unit", "_weapon", "_muzzle", "", "", "", "", ""];

if !(GVAR(enableForAI) || isPlayer _unit) exitWith {};
if (count GVAR(trackedGroups) == GVAR(maxDispatchedGroups)) exitWith {};


if (toLower(_weapon) in ["put", "take"]) exitWith {};
if (_unit getVariable [QGVAR(isTargeted), false]) exitWith {};

private _area = "";
private _notInArea = false;
if !(GVAR(trackedAreas) isEqualTo []) then {
    _notInArea = true;
    scopeName "AreaTracking";
    {
        if (_unit inArea _x) then {
            _notInArea = false;
            _area = _x;
            breakOut "AreaTracking";
        };
    } forEach GVAR(trackedAreas);
};
if (_notInArea) exitWith {};

private _hearingCoef = [_unit, _weapon, _muzzle] call FUNC(getHearingCoef);
private _hearing = (GVAR(hearing) * _hearingCoef);

private _targetPos = _unit getPos [random 25, random 360];

private _groups = [];

//Loop to allGroups and select the nearest one
private _side = side (group _unit);
{
    if ([_x, _side, _area] call FUNC(canDispatch)) then {
        //Check now if they can hear the shoot
        private _result = _targetPos distance (getPos (leader _x));
        diag_log _result;
        if (_result <= _hearing) then {
            //Check if we can use this group
            _groups pushBack [_result + 50 - random 100, _x];
        };
    };
} forEach allGroups;

_groups sort true;
_groups = _groups apply {_x select 1};
if !(_groups isEqualTo []) then {
    private _unitClose = [_unit];
    {
        _unitClose pushback _x;
        _x setVariable [QGVAR(isTargeted), true, true];
    } forEach nearestObjects [_targetPos, ["CAManBase"], 25, false];
    private _group = (_groups select 0) call FUNC(generateGroup);
    [_group, (getPos _unit), _unitClose] call FUNC(dispatchAI);
} else {
    if (GVAR(debug)) then {
        private _str = format ["[RBU] FIRED: No Group Found For Shoot %1", _unit];
        systemChat _str;
        diag_log _str;
    };
};
