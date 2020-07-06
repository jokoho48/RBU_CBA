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

private _units = units _group;

private _oldGroup = _group getVariable [QGVAR(oldGroup), grpNull];
_oldGroup setVariable [QGVAR(groupHasDispatch), false, true];
//Create a new group
if (isNull _oldGroup || {{alive _x} count (units _oldGroup) == 0}) then {
    // Send AI back
    // Later task send them back on there original track
    private _position = _group getVariable [QGVAR(oldPosition), getPos (leader _group)];

    [{
        [QGVAR(resetAI), _this, _this select 0] call CBA_fnc_targetEvent;
    }, [_group, _position], 1] call CBA_fnc_waitAndExecute;

} else {
    _units joinSilent _oldGroup; // reattach Group to Original Group
};

private _index = GVAR(trackedGroups) find _group;
if (_index != -1) then {
    GVAR(trackedGroups) deleteAt _index;
};

{
    _x setVariable [QGVAR(isTargeted), false, true];
    nil
} count _targets;
