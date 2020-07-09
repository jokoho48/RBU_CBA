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

params ["_group", "_position", "_targets"];
// dispatch now the AI!
[{
    [QGVAR(dispatchAI), _this, _this select 0] call CBA_fnc_targetEvent;
}, [_group, _position], 1] call CBA_fnc_waitAndExecute;

GVAR(trackedGroups) pushBack _group;
if (GVAR(debug)) then {
    private _str = format ["[RBU] %1: Dispatch Group %2 to Target %3", side _group, _group, _position];
    systemChat _str;
    diag_log _str;
    [format ["RBU_%1_%2_%3_DispatchTarget", side _group, _group, _position], _position, "ICON", [1, 1], "TYPE:", "mil_dot", "TEXT:", format ["RBU %1 Dispatch Position for %2", side _group, _group]] call CBA_fnc_createMarker;
};
// Add reset Timer
[{
    _this call FUNC(resetAI);
}, [_group, _targets], GVAR(searchTime)*60] call CBA_fnc_waitAndExecute;

_group setVariable [QGVAR(targets), _targets];
_group setVariable [QGVAR(groupIsInvestigating), true, true];

[{
    params ["_grp"];
    _grp setSpeedMode "FULL";
}, _group] call CBA_fnc_execNextFrame;
