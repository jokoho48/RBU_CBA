#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_common"};
        author = "joko // Jonas";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
class CfgFactionClasses {
    class NO_CATEGORY;
    class RBU_Cat: NO_CATEGORY {
        displayName = "RBU";
        priority = 2;
        side = 7;
    };
};

class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
            class Units;
        };
        class ModuleDescription {
            class AnyBrain;
            class EmptyDetector;
        };
    };
    class GVAR(BaseModule): Module_F {
        author = "RBU Dev Team";
        _generalMacro = QGVAR(BaseModule);
        scope = 0;
        scopeCurator = 0;
        is3DEN = 1;
        isGlobal = 0;
        isTriggerActivated = 1;
        curatorCanAttach = 1;
        class AttributesBase: AttributesBase {
            class EditShort {
                control = "EditShort";
                expression = "_this setVariable ['%s', _value, true];";
                defaultValue = "15";
            };
        };
        class ModuleDescription: ModuleDescription {
            duplicate = 0;
            position = 1;
            direction = 0;
            description = "";
            sync[] = {"AnyBrain", "Condition"};
            class Condition: EmptyDetector {
                optional = 1;
            };
        };
    };

    class GVAR(Area) : GVAR(BaseModule) {
        _generalMacro = QGVAR(Area);
        scope = 2;
        displayName = "RBU Area restriction";
        category = "RBU_Cat";
        function = QFUNC(moduleArea);
        icon = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\move_ca.paa";
        portrait = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\move_ca.paa";
        canSetArea = 1;
        canSetAreaShape = 1;
        class AttributeValues {
            size3[] = {1000, 1000, -1};
            isRectangle = 0;
        };

        class ModuleDescription: ModuleDescription {
            duplicate = 1;
            position = 1;
            direction = 1;
            description = "A Area where the AI is limited to.";
        };
    };
};

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
                        expression = "_this setVariable ['rbu_reaction_allowed', _value, true];";
                        typeName = "BOOL";
                        defaultValue = "(true)";
                    };
                };
            };
        };
    };
};
