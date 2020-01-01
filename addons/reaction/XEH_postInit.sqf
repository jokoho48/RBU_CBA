#include "script_component.hpp"

[QGVAR(sendAI), {
    params ["_group", "_pos"];
    diag_log _this;
    [_group, [_pos, GVAR(searchRad), GVAR(searchRad), 0, false], GVAR(aiMode), "AWARE", "FULL"] call CBA_fnc_taskSearchArea;
}] call CBA_fnc_addEventHandler;

[QGVAR(resetAI), {
    params ["_group", "_pos"];
    [_group, _pos, GVAR(searchRad), GVAR(waypointCount), "MOVE", "AWARE", "", GVAR(aiMode)] call CBA_fnc_taskPatrol;
}] call CBA_fnc_addEventHandler;

["CAManBase", "FiredMan", {_this call FUNC(firedEH)}] call CBA_fnc_addClassEventHandler;
