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

//So we will take the first group and start building it form there
private _group = (_this select 0) select 1;
private _groupSize = {alive _x} count units _group;
_group setVariable [QGVAR(haveRunner), true, true];
//So our group is too big
if (_groupSize > GVAR(numberOfAi)) exitWith {

    /*
    If we have a group of 10 units
    and the missionmaker want only groups of 4 units,
    we will remove 4 units from the group and will send them to the location of the shoot.
    */
    private _units = units _group;
    reverse _units;
    _units resize GVAR(numberOfAi); // @TODO check if -1 is required
    private _groupNew = createGroup (side _group);
    _units joinSilent _groupNew;
    _groupNew setVariable [QGVAR(oldGroup), _group];
    _groupNew setVariable [QGVAR(oldPosition), getPos (leader _group)];
    _groupNew
};
// if the groups is smaller just return the group and let it be (we dont want to overcomplicate it)
_group setVariable [QGVAR(oldPosition), getPos (leader _group)];
_group
