# qb-phone (with discord app)
This is the standard QB-Phone with the Discord

Features
 - Buying public/private chatrooms.
 - Chatroom moderation (kick people, delete messages, pin messages)
 - Search function in rooms.
 - Option to join chatroom or view. If you join you get push notifications.
 - Create pin codes for your room, turn it private/public.
 - Create "hacked" rooms via a hacked phone.
 - Hacked rooms can only be seen by those with a hacked phone.
 - Attach pictures to rooms by posting the link (auto embed)

Requires
- Run the provided discordapp.sql file
- David's [qb-input](https://github.com/davidxd33/qb-input) to allow for some front end magic.
- [racingusb](https://github.com/Boom1053/racingusb) - You can remove these edits if you don't want to use this
- [passhack](https://forum.cfx.re/t/paid-dimboscripts-password-hack/4340860)  - You can use your own hack for the phone dongle in room_creation client lua - Line 152

The app is configured to work around legal and illegal selling of chatrooms (default location inside [Patochoe's Cyberbar MLO](https://www.gta5-mods.com/maps/mlo-cyber-bar-fivem-sp))

![](https://i.imgur.com/gPnxlzD.png) ![](https://i.imgur.com/NI4VVCR.png) ![](https://i.imgur.com/uLeajg6.jpeg) ![](https://i.imgur.com/vXB2py8.png) ![](https://i.imgur.com/ipXGMHJ.png) ![](https://i.imgur.com/TI6nb37.png) ![](https://i.imgur.com/HbQYjfQ.jpeg) 

###Shows with a hacked phone in pocket
![](https://i.imgur.com/Ex1M7bP.png)
![](https://i.imgur.com/E57VpCv.png)
![](https://i.imgur.com/tGKhQgj.png)
![](https://i.imgur.com/qKDQxTW.png)


# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>

## Dependencies
- [racingusb](https://github.com/Boom1053/racingusb) - You can remove these edits if you don't want to use this
- [passhack](https://forum.cfx.re/t/paid-dimboscripts-password-hack/4340860)  - You can use your own hack for the phone dongle
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-policejob](https://github.com/qbcore-framework/qb-policejob) - MEOS, handcuff check etc. 
- [qb-crypto](https://github.com/qbcore-framework/qb-crypto) - Crypto currency trading 
- [qb-lapraces](https://github.com/qbcore-framework/qb-lapraces) - Creating routes and racing 
- [qb-houses](https://github.com/qbcore-framework/qb-houses) - House and Key Management App
- [qb-garages](https://github.com/qbcore-framework/qb-garages) - For Garage App
- [qb-banking](https://github.com/qbcore-framework/qb-banking) - For Banking App
- [screenshot-basic](https://github.com/citizenfx/screenshot-basic) - For Taking Photos
- A Webhook for hosting photos (Discord or Imgur can provide this)


## Screenshots
![Home](https://cdn.discordapp.com/attachments/921675245360922625/921675439783673897/home.jpg)
![Bank](https://cdn.discordapp.com/attachments/921675245360922625/921675441142644756/bank.jpg)
![Advert](https://cdn.discordapp.com/attachments/921675245360922625/921675440878415872/advert.jpg)
![Mail](https://cdn.discordapp.com/attachments/921675245360922625/921675440278614068/mail.jpg)
![Garage](https://cdn.discordapp.com/attachments/921675245360922625/921675439590760528/garage.jpg)
![Garage Detail](https://cdn.discordapp.com/attachments/921675245360922625/921675441591422986/garage_in.jpg)
![services](https://cdn.discordapp.com/attachments/921675245360922625/921675458670641152/services.jpg)
![Houses](https://cdn.discordapp.com/attachments/921675245360922625/921675440005988362/house.jpg)
![Racing](https://cdn.discordapp.com/attachments/921675245360922625/921675458423173140/race.jpg)
![Crypto](https://cdn.discordapp.com/attachments/921675245360922625/921675457718517820/qbit.jpg)
![Gallery](https://cdn.discordapp.com/attachments/921675245360922625/921675441381736448/gallery.jpg)
![MEOS](https://cdn.discordapp.com/attachments/921675245360922625/921675440488341534/meos.jpg)
![Twitter](https://cdn.discordapp.com/attachments/921675245360922625/921675459270438922/twitter.jpg)
![Settings](https://cdn.discordapp.com/attachments/921675245360922625/921675458905513984/setting.jpg)
![Whatsapp](https://cdn.discordapp.com/attachments/921675245360922625/921675459517906944/whatsapp.jpg)
![Phone](https://cdn.discordapp.com/attachments/921675245360922625/921675440677064745/phone.jpg)

## Features
- Garages app to see your vehicle details
- Mails to inform the player
- Banking app to see balance and transfer money
- Racing app to create races
- App Store to download apps
- MEOS app for polices to search
- Houses app for house details and management

## Installation
### Manual
- Download the script and put it in the `[qb]` directory.
- Import `qb-phone.sql` in your database
- Add the following code to your server.cfg/resouces.cfg
```
ensure qb-core
ensure screenshot-basic
ensure qb-phone
ensure qb-policejob
ensure qb-crypto
ensure qb-lapraces
ensure qb-houses
ensure qb-garages
ensure qb-banking
```

## Configuration
```

Config = Config or {}

Config.RepeatTimeout = 2000 -- Timeout for unanswered call notification
Config.CallRepeats = 10 -- Repeats for unanswered call notification
Config.OpenPhone = 244 -- Key to open phone display
Config.PhoneApplications = {
    ["phone"] = { -- Needs to be unique
        app = "phone", -- App route
        color = "#04b543", -- App icon color
        icon = "fa fa-phone-alt", -- App icon
        tooltipText = "Phone", -- App name
        tooltipPos = "top",
        job = false, -- Job requirement
        blockedjobs = {}, -- Jobs cannot use this app
        slot = 1, -- App position
        Alerts = 0, -- Alert count
    },
}
```
## Setup Webhook in `server/main.lua` for photos
Set the following variable to your webhook (For example, a Discord channel or Imgur webhook)
### To use Discord:
- Right click on a channel dedicated for photos
- Click Edit Channel
- Click Integrations
- Click View Webhooks
- Click New Webhook
- Confirm channel
- Click Copy Webhook URL
- Paste into `WebHook` in `server/main.lua`
```
local WebHook = ""
```
