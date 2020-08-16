#include "script_component.hpp"
/*
    RBU

    Author: joko // Jonas

    Description:
    Fired EH that Do stuff


    Remarks:
    Only Execute On the Server

    Parameter(s):
    0: Argument <Type>

    Returns:
    0: Return <Type>
*/
params["_group", "_targets"];

private _index = GVAR(trackedGroups) find _group;
if (_index != -1) then {
    GVAR(trackedGroups) deleteAt _index;
};

{
    _x setVariable [QGVAR(isTargeted), false, true];
    nil
} count _targets;

private _units = units _group;

private _oldGroup = _group getVariable [QGVAR(oldGroup), grpNull];
_oldGroup setVariable [QGVAR(groupHasDispatch), false, true];
if (_units isEqualTo []) exitWith {};
//Create a new group
if (isNull _oldGroup || {{alive _x} count (units _oldGroup) == 0}) then {
    // Send AI back
    // Later task send them back on there original track
    private _position = _group getVariable [QGVAR(oldPosition), getPos (leader _group)];

    // Delete Current Serach Waypoint
    _group call CBA_fnc_clearWaypoints;

    [{
        [QGVAR(resetAI), _this, _this select 0] call CBA_fnc_targetEvent;
    }, [_group, _position], 1] call CBA_fnc_waitAndExecute;

    if (GVAR(debug)) then {
        private _str = format ["[RBU] %1: Reset Group %2 to Old Group Missing Create New Task", side _group, _group];
        systemChat _str;
        diag_log _str;
    };
} else {
    _units joinSilent _oldGroup; // reattach Group to Original Group
    if (GVAR(debug)) then {
        private _str = format ["[RBU] %1: Reset Group %2 to Old Group %3", side _group, _group, _oldGroup];
        systemChat _str;
        diag_log _str;
    };
};
