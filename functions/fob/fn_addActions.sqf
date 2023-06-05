params["_caller", "_fobObject"];

FOB addAction [ 
 "Deploy FOB", 
 { 
  params["_target", "_caller"]; 
  [_caller, _target] call TRA_fnc_buildFob; 
 } 
];
FOB addAction [ 
 "Open Build Menu", 
 { 
  params["_target", "_caller"]; 
  [_caller] call TRA_fnc_buildMenu; 
 } 
];
FOB addAction [ 
 "Halo Jump", 
 { 
  params ["_target", "_caller"]; 
  [_caller] call TRA_fnc_haloMenu; 
 } 
];
FOB addAction [
  "Heal",
  {
    [] call TRA_fnc_heal;
  }
];

