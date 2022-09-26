QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 450
            },
        },
	},
    ['misc'] = {
        label = 'Misc',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Admin Only',
                payment = 1000
            },
        },
    },
	['police'] = {
		label = 'LSPD',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 950
            },
			['1'] = {
                name = 'Cadet',
                payment = 1350
            },
			['2'] = {
                name = 'Officer',
                payment = 1550
            },
			['3'] = {
                name = 'Senior Officer',
                payment = 2150
            },
			['4'] = {
                name = 'Corporal',
				payment = 2490
            },
            ['5'] = {
                name = 'Sergeant',
				payment = 2950
            },
            ['6'] = {
                name = 'Lieutenant',
				payment = 3300
            },
            ['7'] = {
                name = 'Captain',
				payment = 3795
            },
            ['8'] = {
                name = 'Deputy Chief',
				payment = 4022
            },
            ['9'] = {
                name = 'Asst Chief',
				payment = 4550
            },
            ['10'] = {
                name = 'Chief',
                isboss = true,
				payment = 5135
            }
        },
	},
	['ambulance'] = {
		label = 'EMS',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 1550
            },
			['1'] = {
                name = 'EMT Advance',
                payment = 2400
            },
			['2'] = {
                name = 'Paramedic',
                payment = 2950
            },
			['3'] = {
                name = 'Surgeon',
                payment = 3245
            },
            ['4'] = {
                name = 'Head Medic',
                payment = 3550
            },
            ['5'] = {
                name = 'Lieutenant',
                payment = 3859
            },
            ['6'] = {
                name = 'Captain',
                payment = 4188
            },
			['7'] = {
                name = 'Chief',
				isboss = true,
                payment = 4590
            },
        },
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
            },
        },
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 150
            },
			['1'] = {
                name = 'Driver',
                payment = 700
            },
			['2'] = {
                name = 'Event Driver',
                payment = 890
            },
			['3'] = {
                name = 'Sales',
                payment = 1000
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 1200
            },
        },
	},
    ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 550
            },
		},
	},
	['cardealer'] = {
		label = 'PDM',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 100
            },
			['1'] = {
                name = 'Salesman',
                payment = 125
            },
			['2'] = {
                name = 'Senior Salesman',
                payment = 150
            },
			['3'] = {
                name = 'Executive Salesman',
                payment = 175
            },
            ['4'] = {
                name = 'Assitant Manager',
                payment = 200
            },
            ['5'] = {
                name = 'Manager',
                payment = 300
            },
			['6'] = {
                name = 'CEO',
				payment = 325
            },
            ['7'] = {
                name = 'Owner',
                isboss = true,
                payment = 3000
            },
        },
	},
    ['edm'] = {
        label = 'EDM',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Owner',
                payment = 2000
            },
        },
    },
	['mechanic'] = {
		label = 'ERP Customs',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Novice',
                payment = 100
            },
			['1'] = {
                name = 'Intern',
                payment = 150
            },
			['2'] = {
                name = 'Lead Mechanic',
                payment = 200
            },
			['3'] = {
                name = 'Expert Mechanic',
                payment = 250
            },
            ['4'] = {
                name = 'Senior Mechanic',
                payment = 300
            },
            ['5'] = {
                name = 'Manager',
                payment = 350
            },
            ['6'] = {
                name = 'CEO',
                payment = 400
            },
            ['7'] = {
                name = 'Owner',
                isboss = true,
                payment = 450
            },
        },
	},
	['judge'] = {
		label = 'Chief Justice',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Chief Justice',
                isboss = true,
                payment = 2000
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Clerk',
                payment = 300
            },
            ['1'] = {
                name = 'Private Attorney',
                payment = 500
            },
            ['2'] = {
                name = 'Public Prosecutor',
                payment = 700
            },
            ['3'] = {
                name = 'Additional District Attorney',
                payment = 900
            },
            ['4'] = {
                name = 'District Attorney',
                payment = 1100
            },
            ['5'] = {
                name = 'Asst Judge',
                payment = 1300
            },
        },
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Reporter',
                payment = 600
            },
            ['1'] = {
                name = 'Senior Reporter',
                payment = 800
            },
            ['2'] = {
                name = 'Crime Reporter',
                payment = 950
            },
            ['4'] = {
                name = 'Director',
                isboss = true,
                payment = 1100
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                payment = 1300
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 100
            },
        },
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 700
            },
        },
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 130
            },
        },
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 120
            },
        },
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 850
            },
        },
	},
}