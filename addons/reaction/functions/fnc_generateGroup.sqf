#include "script_component.hpp"
/*
    RBU

    Author: joko // Jonas

    Description:
    Generates Subgroup if Group is Bigger than Maximun Dispace Group size

    Parameter(s):
    0: Selected Group <GROUP>

    Returns:
    0: Group <GROUP>
*/

params ["_group"];
//So we will take the first group and start building it form there
private _groupSize = { alive _x } count (units _group);
_group setVariable [QGVAR(groupHasDispatch), true, true];
// So our group is too big
if (_groupSize > GVAR(numberOfAi)) exitWith {

    /*
    If we have a group of 10 units
    and the missionmaker want only groups of 4 units,
    we will remove 4 units from the group and will send them to the location of the shoot.
    */
    private _units = units _group;
    reverse _units;
    _units resize GVAR(numberOfAi);
    private _groupNew = createGroup [(side _group), true];
    _units joinSilent _groupNew;
    _groupNew setVariable [QGVAR(oldGroup), _group];
    _groupNew setVariable [QGVAR(oldPosition), getPos (leader _group)];
    _groupNew deleteGroupWhenEmpty true;
    if (GVAR(debug)) then {
        private _str = format ["[RBU] %1: Generate New Sub Group %2 for Dispatchment %3", side _group, _group, _groupNew];
        systemChat _str;
        diag_log _str;
    };

    _groupNew
};
if (GVAR(debug)) then {
    private _str = format ["[RBU] %1: Use Full Group %2 for Dispatchment", side _group, _group];
    systemChat _str;
    diag_log _str;
};
// if the groups is smaller just return the group and let it be (we dont want to overcomplicate it)
_group setVariable [QGVAR(oldPosition), getPos (leader _group)];
_group
