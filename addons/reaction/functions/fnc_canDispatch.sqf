#include "script_component.hpp"
/*
    RBU

    Author: joko // Jonas

    Description:
    Checks if a Group can get Dispatched

    Parameter(s):
    0: Group <GROUP>

    Returns:
    0: Can Get Dispatched <BOOL>
*/
params ["_group", "_side", "_area"];
if (_area in ["", [], objNull]) then {
    !isNull _group &&
    {_group getVariable [QGVAR(allowed), true]} &&
    {!(_group getVariable [QGVAR(groupHasDispatch), false])} &&
    {!(_group getVariable [QGVAR(groupIsInvestigating), false])} &&
    {[_side, side _group] call BIS_fnc_sideIsEnemy} &&
    {isNull ((leader _group) findNearestEnemy (leader _group))} &&
    {(units _group) findIf {isPlayer _x} == -1} &&
    {(units _group) findIf {alive _x} != -1}
} else {
    [_group, _side] call FUNC(canDispatch) &&
    {(leader _group) inArea _area}
};
