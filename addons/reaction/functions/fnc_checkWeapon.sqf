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
scopeName "CheckWeapon";

params [
    "_unit",
    "_weapon",
    "_muzzle"
];

if ((vehicle _unit) != _unit) exitWith { 1 };
if (_weapon == "") exitWith { 1 };
if (_weapon != _muzzle) exitWith { 1 };

private _supp = switch (_weapon) do {
    case (handgunWeapon _unit): {
        (handgunItems _unit) select 0;
    };
    case (primaryWeapon _unit): {
        (primaryWeaponItems _unit) select 0;
    };
    case (secondaryWeapon _unit): {
        (secondaryWeaponItems _unit) select 0;
    };
    default { 1 breakOut "CheckWeapon"; };
};

private _cfg = (configFile >> "CfgWeapons" >> _supp >> "ItemInfo" >> "AmmoCoef");
private _audibleFire = if (isNumber (_cfg >> "audibleFire")) then { getNumber (_cfg >> "audibleFire") } else { 1 };
private _audibleFireTime =  if (isNumber (_cfg >> "audibleFireTime")) then { getNumber (_cfg >> "audibleFireTime") } else { 1 };

private _audible = _audibleFire / _audibleFireTime;

_audible
