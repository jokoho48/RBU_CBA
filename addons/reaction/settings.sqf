private _curCat = "Settings";
[
    QGVAR(hearing),
    "SLIDER",
    ["Hearing Range", "Base Distance on that Units Hear Shots"],
    [COMPONENT_NAME, _curCat],
    [25, 12000, 1000, 0],
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

[
    QGVAR(aiMode),
    "LIST",
    ["Waypoint Behaviour", "The Behaviour the AI gets set into while Investigating"],
    [COMPONENT_NAME, _curCat],
    [["UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"], ["UNCHANGED", "CARELESS", "SAFE", "AWARE", "COMBAT", "STEALTH"], 4], // TODO: Find Stringtable Entrys
    true
] call CBA_fnc_addSetting;

[
    QGVAR(walkCycles),
    "SLIDER",
    ["WalkCycles", "The Amount of Walk Cycles the Group Does before it returns to the Original Group.(One Walk Cycle is 10 Seconds, that means 300 Walk Cycles are 3000 Seconds)"],
    [COMPONENT_NAME, _curCat],
    [10, 1200, 300, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVAR(areRunningMax),
    "SLIDER",
    ["Maximum Dispatched Groups", "The Maximum Amount of Dispachted Groups that go Investigate."],
    [COMPONENT_NAME, _curCat],
    [2, 10, 3, 0],
    true
] call CBA_fnc_addSetting;
