Config = {}
Config.molt_systemEng = 3.0  --do not touch                             default value 3.0

--------- DEBUG ----------
Config.debug_server = false  -- log message server console
Config.debug_client = false  -- log message client
---------------------------

Config.demageBody   = 0.1   -- set value Body       min 0.1 - max 1     default value 0.1
-- TODO -- Sync body deformation

------ CONFIG ENGINE -----
-- the greater the reduction factor the greater the damage
Config.demageEng = {    -- set reducing factor value for ENGINE         min 0.1 - max 1 / 1.2  recommended 
    [0] = 	0.8,		--	0: Compacts                                 default value 0.8
            0.8,		--	1: Sedans                                   default value 0.8
            0.7,		--	2: SUVs                                     default value 0.7
            0.7,		--	3: Coupes                                   default value 0.7
            0.6,		--	4: Muscle                                   default value 0.6
            0.6,		--	5: Sports Classics                          default value 0.6
            0.6,		--	6: Sports                                   default value 0.6
            0.5,		--	7: Super                                    default value 0.5
            0.25,		--	8: Motorcycles                              default value 0.25
            0.5,		--	9: Off-road                                 default value 0.5
            0.25,		--	10: Industrial                              default value 0.25
            1.0,		--	11: Utility                                 default value 1.0
            1.0,		--	12: Vans                                    default value 1.0
            1.0,		--	13: Cycles                                  default value 1.0
            0.5,		--	14: Boats                                   default value 0.5
            0.1,		--	15: Helicopters                             default value 0.1
            0.1,		--	16: Planes                                  default value 0.1
            0.4,		--	17: Service                                 default value 0.4
            0.4,		--	18: Emergency                               default value 0.4
            0.1,		--	19: Military                                default value 0.1
            0.8,		--	20: Commercial                              default value 0.8
            0.1			--	21: Trains                                  default value 0.1
}