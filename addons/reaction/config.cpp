#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {};
        author = "AUTHOR";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class Cfg3DEN {
    class Group {
        class AttributeCategories {
            class GVAR(attributes) {
                collapsed = 1;
                displayName = "Runs By Us";
                class Attributes {
                    class GVAR(Editor_Reaction_Allowed) {
                        property = QGVAR(Editor_Reaction_Allowed);
                        control = "Checkbox";
                        displayName = "Allow Reaction";
                        tooltip = "if this Checkbox is Active the unit is allowed to reat to Shots Fired.";
                        expression = "if (_value) then {_this setVariable ['rbu_reaction_allowed', _value, true]};";
                        typeName = "BOOL";
                        condition = "objectVehicle";
                        defaultValue = "(true)";
                    };
                };
            };
        };
    };
};
