Config = {
	Debug = false, 
	img = "lj-inventory/html/images/", --//Change mat karna
	Peds = true, --//Change mat karna
	Limit = true, --//Change mat karna
	MaxSlots = 30, -- Set this to your player inventory slot count, this is default "41"
	BlackMarket = false, -- enable to add blackmarket locations (defined at the bottom of this file)
	Measurement = "kg", --//Change mat karna
	VendOverride = false, --//Change mat karna
	RandomAmount = false, --//Change mat karna 
    
	Products = {
		["weedshop"] = {
		    { name = "weapon_poolcue", price = 100, amount = 500, },
			{ name = "weed_nutrition", price = 50, amount = 500, },
			{ name = "empty_weed_bag", price = 80, amount = 500, },
			{ name = "empty_coke_bag", price = 500, amount = 150, },
			{ name = "rolling_paper", price = 40, amount = 0, },
			{ name = "lighter", price = 20, amount = 100, },
		},
		["casino"] = {
			{ name = 'casinochips', price = 1, amount = 999999 },
		},
		["blackmarket"] = {
			{ name = "radioscanner", price = 8522222222220, amount = 5 },
		},
	},
}

Config.SellCasinoChips = {
    coords = vector4(987.74, 32.33, 71.47, 349.89),
    ped = 'S_M_Y_CASINO_01',
    pricePer = 1,
}

Config.Locations = {
    -- 24/7 Locations
    ["weedshop"] = {
        ["label"] = "White Widow",
        ["targetLabel"] = "Open Store",
		["type"] = "items",
		["model"] = 'mp_m_weed_01',
		["scenario"] = "WORLD_HUMAN_SMOKING",
		["logo"] = "",
        ["coords"] = {vector4(188.0, -242.11, 54.07, 255.89),},
        ["products"] = Config.Products["weedshop"],
		["blipsize"] = 0.65,
        ["blipsprite"] = 496,
		["blipcolour"] = 2,
    },
	
	-- Casino Locations
	["casino"] = {
		["label"] = "The Diamond Casino & Resort",
		["targetLabel"] = "Buy Chips",
		["type"] = "items",
		["model"] = `U_F_M_CasinoShop_01`,
		["scenario"] = "s_m_m_movprem_01",
		["coords"] = {
			vector4(990.82, 31.01, 71.47, 51.46),
		},
		["products"] = Config.Products["casino"],
		["blipsize"] = 0.55,
        ["blipsprite"] = 679,
		["blipcolour"] = 0,
	},
   

}

if Config.BlackMarket then
	Config.Locations["blackmarket"] = {
		["label"] = "Black Market",
		["type"] = "items",
		["model"] = {
			`mp_f_weed_01`,
			`MP_M_Weed_01`,
			`A_M_Y_MethHead_01`,
			`A_F_Y_RurMeth_01`,
			`A_M_M_RurMeth_01`,
			`MP_F_Meth_01`,
			`MP_M_Meth_01`,
		},
		["coords"] = {
			vector4(776.24, 4184.08, 41.8, 92.12),
		},
		["products"] = Config.Products["blackmarket"],
		["hideblip"] = true,
	}
end


Config.ItemModels = {
	["repairkit"] = `v_ind_cs_toolbox4`,
	["advancedrepairkit"] = `v_ind_cs_toolbox4`,
	["phone"] = `p_amb_phone_01`,
	["tosti"] = `prop_sandwich_01`,
	["sandwich"] = `prop_sandwich_01`,
	["water_bottle"] = `ba_prop_club_water_bottle`,
	["kurkacola"] = `prop_ecola_can`,
	["sprunk"] = `v_res_tt_can03`,
	["sprunklight"] = `v_res_tt_can03`,
	["ecola"] = `prop_ecola_can`,
	["ecolalight"] = `prop_ecola_can`,
	["twerks_candy"] = `prop_choc_pq`,
	["snikkel_candy"] = `prop_choc_pq`,
	["beer"] = `prop_sh_beer_pissh_01`,
	["whiskey"] = `prop_whiskey_bottle`,
	["vodka"] = `prop_vodka_bottle`,
	["lighter"] = `lux_prop_lighter_luxe`,

	["screwdriverset"] = `prop_tool_screwdvr01`,
	["radio"] = `prop_cs_hand_radio`,
	["binoculars"] = `v_serv_ct_binoculars`,
	["cleaningkit"] = `prop_huf_rag_01`,

	["casinochips"] = `vw_prop_chip_100dollar_st`,
	["diving_gear"] = `p_s_scuba_tank_s`,
	["jerry_can"] = `prop_jerrycan_01a`,
	["parachute"] = `p_parachute_s_shop`,

	["coffee"] = `prop_fib_coffee`,
	["fitbit"] = `p_watch_02`,
	["radioscanner"] = `prop_police_radio_main`,
	--Weapons
	["weapon_bat"] = `p_cs_bbbat_01`,
	["weapon_knife"] = `prop_w_me_knife_01`,
	["weapon_hammer"] = `w_me_hammer`,
	["weapon_hatchet"] = `prop_w_me_hatchet`,
	['weapon_dagger'] = `prop_w_me_dagger`,
	['weapon_bottle'] = `prop_w_me_bottle`,
	['weapon_crowbar'] = `prop_ing_crowbar`,
	['weapon_flashlight'] = `w_me_flashlight`,
	['weapon_golfclub'] = `prop_golf_iron_01`,
	['weapon_knuckle'] = `w_me_knuckle`,
	['weapon_machete'] = `prop_ld_w_me_machette`,
	['weapon_switchblade'] = `w_me_switchblade`,
	['weapon_nightstick'] = `w_me_nightstick`,
	['weapon_wrench'] = `v_ind_cs_wrench`,
	['weapon_battleaxe'] = `w_me_battleaxe`,
	['weapon_poolcue'] = `w_me_poolcue`,
	['weapon_handcuffs']  = `prop_cs_cuffs_01`,
	['weapon_bread']  = `v_res_fa_bread01`,
	['weapon_stone_hatchet'] = `w_me_stonehatchet`,

	['weapon_pistol'] = `w_pi_pistol`,
	['weapon_pistol_mk2'] = `w_pi_pistolmk2`,
	['weapon_combatpistol'] = `w_pi_combatpistol`,
	['weapon_appistol']  = `w_pi_appistol`,
	['weapon_stungun'] 	 = `w_pi_stungun`,
	['weapon_pistol50']  = `w_pi_pistol50`,
	['weapon_snspistol']  = `w_pi_sns_pistol`,
	['weapon_heavypistol']  = `w_pi_heavypistol`,
	['weapon_vintagepistol'] = `w_pi_vintage_pistol`,
	['weapon_flaregun'] = `w_pi_flaregun`,
	--['weapon_marksmanpistol'] = ``,
	['weapon_revolver'] = `w_pi_revolver`,
	['weapon_revolver_mk2'] = `w_pi_revolvermk2`,
	['weapon_doubleaction'] = `w_pi_wep1_gun`,
	['weapon_snspistol_mk2'] = `w_pi_sns_pistolmk2`,
	['weapon_raypistol'] = `w_pi_raygun_ev`,
	['weapon_ceramicpistol'] = `w_pi_ceramic_pistol`,
	['weapon_navyrevolver'] = `w_pi_wep2_gun`,
	--['weapon_gadgetpistol'] = ``,
	['weapon_microsmg'] = `w_sb_microsmg`,
	['weapon_smg'] = `w_sb_smg`,
	['weapon_smg_mk2'] = `w_sb_smgmk2`,
	['weapon_assaultsmg'] = `w_sb_assaultsmg`,
	['weapon_combatpdw'] = `w_sb_pdw`,
	--['weapon_machinepistol'] = ``,
	['weapon_minismg'] = `w_sb_minismg`,
	['weapon_raycarbine'] = `w_ar_srifle`,
	['weapon_pumpshotgun'] = `w_sg_pumpshotgun`,
	['weapon_pumpshotgun_mk2'] = `w_sg_pumpshotgunmk2`,
	['weapon_sawnoffshotgun'] = `w_sg_sawnoff`,
	['weapon_assaultshotgun'] = `w_sg_assaultshotgun`,
	['weapon_bullpupshotgun'] = `w_sg_bullpupshotgun`,
	['weapon_musket'] = `w_ar_musket`,
	['weapon_heavyshotgun'] = `w_sg_heavyshotgun`,
	['weapon_dbshotgun'] = `w_sg_doublebarrel`,
	--['weapon_autoshotgun'] = ``,
	--['weapon_combatshotgun'] = ``,

	['weapon_assaultrifle'] = `w_ar_assaultrifle`,
	['weapon_assaultrifle_mk2'] = `w_ar_assaultriflemk2`,
	['weapon_carbinerifle'] = `w_ar_carbinerifle`,
	['weapon_carbinerifle_mk2'] = `w_ar_carbineriflemk2`,
	['weapon_advancedrifle'] = `w_ar_advancedrifle`,
	['weapon_specialcarbine'] = `w_ar_specialcarbine`,
	['weapon_specialcarbine_mk2'] = `w_ar_specialcarbinemk2`,
	['weapon_bullpuprifle'] = `w_ar_bullpuprifle`,
	['weapon_bullpuprifle_mk2'] = `w_ar_bullpupriflemk2`,
	['weapon_compactrifle']  = `w_ar_assaultrifle_smg`,
	['weapon_militaryrifle'] = `w_ar_heavyrifleh`,
	['weapon_mg'] = `w_mg_mg`,
	['weapon_combatmg'] = `w_mg_combatmg`,
	['weapon_combatmg_mk2'] = `w_mg_combatmgmk2`,
	['weapon_gusenberg'] = `w_sb_gusenberg`,

	['weapon_sniperrifle'] = `w_sr_sniperrifle`,
	['weapon_heavysniper'] = `w_sr_heavysniper`,
	['weapon_heavysniper_mk2'] = `w_sr_heavysnipermk2`,
	['weapon_marksmanrifle'] = `w_sr_marksmanrifle`,
	['weapon_marksmanrifle_mk2'] = `w_sr_marksmanriflemk2`,
	--['weapon_remotesniper'] = ``,
	['weapon_rpg'] = `w_lr_rpg`,
	['weapon_grenadelauncher'] = `w_lr_grenadelauncher`,
	['weapon_grenadelauncher_smoke'] = `w_lr_grenadelauncher`,
	['weapon_minigun'] = `prop_minigun_01`,
	['weapon_firework'] = `w_lr_firework`,
	['weapon_railgun'] = `w_ar_railgun`,
	--['weapon_hominglauncher'] = ``,
	--['weapon_compactlauncher'] = ``,
	--['weapon_rayminigun'] = ``,
	['weapon_grenade'] = `w_ex_grenadefrag`,
	['weapon_bzgas'] = `prop_gas_grenade`,
	['weapon_molotov'] = `w_ex_molotov`,
	--['weapon_stickybomb'] = ``,
	['weapon_proxmine'] = `gr_prop_gr_pmine_01a`,
	['weapon_snowball'] = `w_ex_snowball`,
	['weapon_pipebomb'] = `w_ex_pipebomb`,
	['weapon_ball'] = `w_am_baseball`,
	['weapon_smokegrenade'] = `w_ex_grenadesmoke`,
}