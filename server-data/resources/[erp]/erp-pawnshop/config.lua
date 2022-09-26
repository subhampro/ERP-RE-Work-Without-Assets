Config = {}

Config.PawnLocation = vector3(1210.23, -2009.56, -133.25)
Config.BankMoney = false -- Set to true if you want the money to go into the players bank

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.PawnItems = {
    [1] = {
        item = "gold_bracelet",
        price = math.random(100,150)
    },
    [2] = {
        item = "red_diamond_ring",
        price = math.random(600,700)
    },
    [3] = {
        item = "rolex",
        price = math.random(200,350)
    },
    [4] = {
        item = "gold_earing",
        price = math.random(400,500)
    },
    [5] = {
        item = "tablet",
        price = math.random(80,100)
    },
    [6] = {
        item = "iphone",
        price = math.random(150,170)
    },
    [7] = {
        item = "samsungphone",
        price = math.random(50,100)
    },
    [8] = {
        item = "laptop",
        price = math.random(100,150)
    },
    [9] = {
        item = "goldbar",
        price = math.random(300,450)
    },
    [10] = {
        item = "red_diamond",
        price = math.random(150,200)
    }
}


