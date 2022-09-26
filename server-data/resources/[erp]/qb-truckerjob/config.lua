Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.BailPrice = 350

Config.Locations = {
    ["main"] = {
        label = "Trucker Shed",
        coords = vector4(153.22, -3210.7, 5.86, 282.12),
    },
    ["vehicle"] = {
        label = "Truck Storage",
        coords = vector4(133.75, -3213.23, 6.09, 0.37),
    },
    ["stores"] ={
        [1] = {
            name = "ltdgasoline",
            coords = vector4(-41.07, -1747.91, 29.4, 137.5),
        },
        [2] = {
            name = "247supermarket",
            coords = vector4(31.62, -1315.87, 29.52, 179.5),
        },
        [3] = {
            name = "robsliquor",
            coords = vector4(-1226.48, -907.58, 12.32, 119.5),
        },
        [4] = {
            name = "ltdgasoline2",
            coords = vector4(-714.13, -909.13, 19.21, 0.5),
        },
        [5] = {
            name = "robsliquor2",
            coords = vector4(-1469.78, -366.72, 40.2, 138.5),
        },
        [6] = {
            name = "ltdgasoline3",
            coords = vector4(-1829.15, 791.99, 138.26, 46.5),
        },
        [7] = {
            name = "robsliquor3",
            coords = vector4(-2959.92, 396.77, 15.02, 178.5),
        },
        [8] = {
            name = "247supermarket2",
            coords = vector4(-3047.58, 589.89, 7.78, 199.5),
        },
        [9] = {
            name = "247supermarket3",
            coords = vector4(-3245.85, 1008.25, 12.83, 90.5),
        },
        [10] = {
            name = "247supermarket4",
            coords = vector4(1735.54, 6416.28, 35.03, 332.5),
        },
        [11] = {
            name = "247supermarket5",
            coords = vector4(1702.84, 4917.28, 42.22, 323.5),
        },
        [12] = {
            name = "247supermarket6",
            coords = vector4(1960.47, 3753.59, 32.26, 127.5),
        },
        [13] = {
            name = "robsliquor4",
            coords = vector4(1169.27, 2707.7, 38.15, 267.5),
        },
        [14] = {
            name = "247supermarket7",
            coords = vector4(543.47, 2658.81, 42.17, 277.5),
        },
        [15] = {
            name = "247supermarket8",
            coords = vector4(2678.09, 3288.43, 55.24, 61.5),
        },
        [16] = {
            name = "247supermarket9",
            coords = vector4(2553.0, 399.32, 108.61, 179.5),
        },
        [17] = {
            name = "ltdgasoline4",
            coords = vector4(1155.97, -319.76, 69.2, 17.5),
        },
        [18] = {
            name = "robsliquor5",
            coords = vector4(1119.78, -983.99, 46.29, 287.5),
        },
        [19] = {
            name = "247supermarket10",
            coords = vector4(382.13, 326.2, 103.56, 253.5),
        },
        [20] = {
            name = "Walmart",
            coords = vector4(-519.89, -592.55, 30.84, 2.42),
        },
        [21] = {
            name = "hardware",
            coords = vector4(2704.09, 3457.55, 55.53, 339.5),
        },
    },
}

Config.Vehicles = {
    ["speedo4"] = "Delivery Van",
}
