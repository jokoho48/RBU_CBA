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
!isNull _group &&
{_group getVariable [QGVAR(allowed), true]} &&
{!(_group getVariable [QGVAR(groupHasDispatch), false])} &&
{!(_group getVariable [QGVAR(groupIsInvestigating), false])} &&
{[_side, leader _group] call BIS_fnc_sideIsEnemy} &&
{isNull ((leader _group) findNearestEnemy (leader _group))} &&
{{isPlayer _x} findIf (units _x) == -1} &&
{{alive _group} count (units _group) != 0} &&
{ !(_area isEqualTo "") && {leader _group inArea _area} }
