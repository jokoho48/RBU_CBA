private _curCat = "Settings";
[
    QGVAR(enabled),
    "CHECKBOX",
    ["Enable", "Enabled the RBU System"],
    [COMPONENT_NAME, _curCat],
    true,
    true
] call CBA_fnc_addSetting;
[
    QGVAR(hearing),
    "SLIDER",
    ["Hearing Range", "Base Distance on that Units Hear Shots"],
    [COMPONENT_NAME, _curCat],
    [25, 12000, 2000, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(numberOfAi),
    "SLIDER",
    ["Max Group Size", "Maximum of Units that get send to Investigate"],
    [COMPONENT_NAME, _curCat],
    [1, 12, 3, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(waypointCount),
    "SLIDER",
    ["Waypoint Amount", "Waypoint Amount that get Created for Investigating Group"],
    [COMPONENT_NAME, _curCat],
    [1, 20, 3, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(searchRad),
    "SLIDER",
    ["Search Radius", "The Radius the Investigating Group Searches the Area of the Shot"],
    [COMPONENT_NAME, _curCat],
    [1, 500, 100, 0],
    true
] call CBA_fnc_addSetting;

#define SEARCH_MODES ["UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"]
[
    QGVAR(aiMode),
    "LIST",
    ["Waypoint Behaviour", "The Behaviour the AI gets set into while Investigating"],
    [COMPONENT_NAME, _curCat],
    [SEARCH_MODES, SEARCH_MODES, 4],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(searchTime),
    "SLIDER",
    ["Search Time", "The Time The AI Searches the Area (in Minutes)"],
    [COMPONENT_NAME, _curCat],
    [2, 120, 20, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(maxDispatchedGroups),
    "SLIDER",
    ["Maximum Dispatched Groups", "The Maximum Amount of Dispachted Groups that go Investigate."],
    [COMPONENT_NAME, _curCat],
    [2, 10, 3, 0],
    true
] call CBA_fnc_addSetting;
