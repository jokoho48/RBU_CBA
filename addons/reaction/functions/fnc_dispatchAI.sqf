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
