#include "script_component.hpp"

[QGVAR(dispatchAI), {
    params ["_group", "_pos"];
    [_group, [_pos, GVAR(searchRad), GVAR(searchRad), 0, false], GVAR(aiMode), "AWARE", "FULL"] call CBA_fnc_taskSearchArea;
}] call CBA_fnc_addEventHandler;

[QGVAR(resetAI), {
    params ["_group", "_pos"];
    [_group, _pos, GVAR(searchRad), GVAR(waypointCount), "MOVE", "AWARE", "", GVAR(aiMode)] call CBA_fnc_taskPatrol;
}] call CBA_fnc_addEventHandler;
if (isServer) then {
    ["CAManBase", "FiredMan", { _this call FUNC(firedEH) }] call CBA_fnc_addClassEventHandler;
    [{
        {
            if (!isNull _x && { (units _x) isEqualTo [] }) then {
                GVAR(trackedGroups) set [_forEachIndex, grpNull];
                (_x getVariable [QGVAR(oldGroup), grpNull]) setVariable [QGVAR(haveRunner), false, true];
                {
                    _x setVariable [QGVAR(isTargeted), false, true];
                    nil
                } count _targetedUnits;
            };
        } forEach GVAR(trackedGroups);
        GVAR(trackedGroups) = GVAR(trackedGroups) - [grpNull];
    }, 2] call CBA_fnc_addPerFrameHandler;
};
