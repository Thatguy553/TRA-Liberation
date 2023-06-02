TRA_playerStructures set [
	"struct_fob",
	/* HQ Class */
	"Land_Cargo_HQ_V1_F"
];

// TRA_playerStructures set [
// 	"logistics",
// 	[
// 		["unique_class", [_cost, _cost, _cost]],
// 		["unique_class", [_cost, _cost, _cost]]
// 	]
// ];


/******************************************
	Vehicle Format:
	["vehicle_class", [supply, ammo, fuel]]

	Example:
	["rhsusf_m1045_w_s", [200, 200, 50]],

*******************************************/

TRA_playerVehicles set [
	"veh_light",
	[
		["rhsusf_m1025_w_m2", 								[200, 100, 50]],
		["rhsusf_m1025_w_mk19", 							[200, 150, 50]],
		["rhsusf_m1025_w", 									[200, 0, 50]],
		["rhsusf_m1045_w_s", 								[200, 200, 50]],
		["rhsusf_m1151_m2_v1_usarmy_wd", 					[250, 100, 70]],
		["rhsusf_m1151_m240_v1_usarmy_wd", 					[250, 50, 70]],
		["rhsusf_m1151_mk19_v2_usarmy_wd", 					[250, 150, 70]],
		["rhsusf_m1151_usarmy_wd", 							[250, 0, 70]],
		["rhsusf_m1151_m2crows_usarmy_wd", 					[300, 100, 70]],
		["rhsusf_m1151_mk19crows_usarmy_wd", 				[300, 150, 70]],
		["rhsusf_m1165a1_gmv_m134d_m240_socom_d", 			[250, 300, 70]],
		["rhsusf_m1165a1_gmv_m2_m240_socom_d", 				[250, 200, 70]],
		["rhsusf_m1165a1_gmv_mk19_m240_socom_d", 			[250, 250, 70]],
		["rhsusf_M1117_W", 									[350, 200, 100]],
		["rhsusf_M1220_usarmy_wd", 							[400, 0, 150]],
		["rhsusf_M1220_M153_M2_usarmy_wd", 					[450, 100, 150]],
		["rhsusf_M1220_M153_MK19_usarmy_wd", 				[450, 150, 150]],
		["rhsusf_M1220_M2_usarmy_wd", 						[400, 100, 150]],
		["rhsusf_M1220_MK19_usarmy_wd", 					[400, 150, 150]],
		["rhsusf_M1230a1_usarmy_wd", 						[450, 0, 150]],
		["rhsusf_M1232_usarmy_wd", 							[500, 0, 150]],
		["rhsusf_M1232_M2_usarmy_wd", 						[500, 100, 150]],
		["rhsusf_M1237_MK19_usarmy_wd", 					[500, 150, 150]],
		["rhsusf_m1240a1_usarmy_wd", 						[350, 0, 200]],
		["rhsusf_m1240a1_m2_usarmy_wd", 					[350, 100, 200]],
		["rhsusf_m1240a1_m240_usarmy_wd", 					[350, 50, 200]],
		["rhsusf_m1240a1_mk19_usarmy_wd", 					[350, 150, 200]],
		["rhsusf_m1240a1_m2_uik_usarmy_wd",					[350, 100, 200]],
		["rhsusf_m1240a1_m240_uik_usarmy_wd",				[350, 50, 200]],
		["rhsusf_m1240a1_mk19_uik_usarmy_wd",				[350, 150, 200]],
		["rhsusf_m1240a1_m2crows_usarmy_wd",				[400, 150, 200]],
		["rhsusf_m1240a1_mk19crows_usarmy_wd",				[400, 150, 200]],
		["rhsusf_M1238A1_socom_d", 							[400, 0, 150]],
		["rhsusf_M1238A1_M2_socom_d", 						[400, 100, 150]],
		["rhsusf_M1238A1_Mk19_socom_d", 					[400, 150, 150]],
		["rhsusf_M1239_socom_d", 							[400, 0, 150]],
		["rhsusf_M1239_M2_socom_d", 						[400, 100, 150]],
		["rhsusf_M1239_MK19_socom_d", 						[400, 150, 150]],
		["rhsusf_M1078A1P2_WD_fmtv_usarmy",					[200, 0, 100]],
		["rhsusf_M1078A1P2_WD_flatbed_fmtv_usarmy",			[200, 0, 100]],
		["rhsusf_M1078A1P2_B_WD_fmtv_usarmy",				[200, 0, 100]],
		["rhsusf_M1078A1P2_B_WD_flatbed_fmtv_usarmy",		[200, 0, 100]],
		["rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy",			[200, 100, 100]],
		["rhsusf_M1078A1P2_B_M2_WD_flatbed_fmtv_usarmy",	[200, 100, 100]],
		["rhsusf_M1084A1P2_WD_fmtv_usarmy",					[200, 0, 100]],
		["rhsusf_M1084A1P2_B_M2_WD_fmtv_usarmy",			[200, 100, 100]]
	]
];
TRA_playerVehicles set [
	"veh_heavy",
	[
		["rhsusf_stryker_m1126_m2_wd",						[500, 150, 200]],
		["rhsusf_stryker_m1126_mk19_wd",					[500, 200, 200]],
		["rhsusf_stryker_m1127_m2_wd",						[500, 150, 200]],
		["rhsusf_stryker_m1132_m2_np_wd",					[500, 150, 200]],
		["rhsusf_stryker_m1132_m2_wd",						[500, 150, 200]],
		["rhsusf_stryker_m1134_wd",							[500, 200, 200]],
		["RHS_M2A2_wd",										[450, 250, 250]],
		["RHS_M2A2_BUSKI_WD",								[500, 250, 250]],
		["RHS_M2A3_wd",										[500, 300, 250]],
		["RHS_M2A3_BUSKI_wd",								[550, 300, 250]],
		["RHS_M2A3_BUSKIII_wd",								[600, 300, 250]],
		["RHS_M6_wd",										[450, 200, 250]],
		["rhsusf_m1a1fep_wd",								[600, 450, 300]],
		["rhsusf_m1a1fep_od",								[600, 450, 300]],
		["rhsusf_m1a1hc_wd",								[600, 450, 300]],
		["rhsusf_m1a1aimwd_usarmy",							[600, 450, 300]],
		["rhsusf_m1a1aim_tuski_wd",							[650, 500, 300]],
		["rhsusf_m1a2sep1wd_usarmy",						[650, 450, 300]],
		["rhsusf_m1a2sep1tuskiwd_usarmy",					[700, 500, 300]],
		["rhsusf_m1a2sep1tuskiiwd_usarmy",					[750, 500, 300]],
		["rhsusf_m1a2sep2wd_usarmy",						[700, 500, 300]]
	]
];
TRA_playerVehicles set [
	"veh_aircraft",
	[
		["RHS_MELB_AH6M",									[300, 0, 200]],
		["RHS_MELB_MH6M",									[300, 0, 200]],
		["RHS_MELB_H6M", 									[300, 0, 200]],
		["RHS_AH64D_wd",									[500, 600, 300]],
		["RHS_CH_47F",										[350, 100, 350]],
		["RHS_UH60M",										[300, 100, 250]],
		["RHS_UH60M_ESSS",									[350, 300, 300]],
		["RHS_UH60M_MEV2",									[300, 0, 300]],
		["RHS_UH60M_MEV",									[250, 0, 250]],
		["RHS_AH1Z_wd",										[400, 500, 250]],
		["rhsusf_CH53E_USMC",								[400, 0, 300]],
		["rhsusf_CH53E_USMC_GAU21",							[400, 100, 300]],
		["RHS_UH1Y_FFAR",									[250, 200, 200]],
		["RHS_UH1Y",										[250, 100, 200]],
		["RHS_UH1Y_UNARMED",								[200, 0, 200]]
	]
];
// TRA_playerVehicles set [
// 	"seacraft",
// 	[
// 		["unique_class", [_cost, _cost, _cost]],
// 		["unique_class", [_cost, _cost, _cost]]
// 	]
// ];
// TRA_playerVehicles set [
// 	"static",
// 	[
// 		["unique_class", [_cost, _cost, _cost]],
// 		["unique_class", [_cost, _cost, _cost]]
// 	]
// ];
// TRA_playerVehicles set [
// 	"logistics",
// 	[
// 		["unique_class", [_cost, _cost, _cost]],
// 		["unique_class", [_cost, _cost, _cost]]
// 	]
// ];
// TRA_playerVehicles set [
// 	"infantry",
// 	[
// 		["unique_class", [_cost, _cost, _cost]],
// 		["unique_class", [_cost, _cost, _cost]]
// 	]
// ];