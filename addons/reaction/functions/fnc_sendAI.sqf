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

params ["_group", "_position", "_targetedUnits"];
diag_log "SendAI";
// Send now the AI!
[{
    diag_log "Target Event Send AI";
    [QGVAR(sendAI), _this, _this select 0] call CBA_fnc_targetEvent;
}, [_group, _position], 1] call CBA_fnc_waitAndExecute;

GVAR(areRunning) = GVAR(areRunning) + 1;

// Add perFrame EH
[_group, _targetedUnits] call FUNC(waitForTime);
_group setVariable [QGVAR(areRunning), true, true];
[{
    params ["_grp"];
    _grp setSpeedMode "FULL";
}, _group] call CBA_fnc_execNextFrame;
