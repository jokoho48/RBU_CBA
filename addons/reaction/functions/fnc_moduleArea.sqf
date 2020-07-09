#include "script_component.hpp"
/*
 * Author: jokoho482
 * Create and Registers a Area
 *
 * Arguments:
 * TODO
 *
 * Return Value:
 * TODO
 *
 * Example:
 * TODO
 *
 * Public: No
*/
params [["_mode", "", [""]], ["_input", [], [[]]]];

switch (_mode) do {
    // Default object init
    case "init": {
        if (is3DEN) exitWith {};
        _input params [["_logic", objNull, [objNull]], ["_isActivated", true, [true]], ["_isCuratorPlaced", false, [true]]];
        if !(_isActivated) exitWith {};
        if (_isCuratorPlaced) then {
            // Curator is currently not supported
        } else {
            private _area = [getPos _logic];
            _area append (_logic getVariable ["objectarea", [1000, 1000, 0, false, -1]]);
            _area call FUNC(registerArea);
        };
    };
};
true
