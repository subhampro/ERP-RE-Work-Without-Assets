//////////////////////////////////////////
//           Discord Whitelist          //
//////////////////////////////////////////

/// Config Area ///

var guild = "959067219550146600";
var botToken = "OTEzODU0MTQ2MTU3ODc5Mjk3.YaEi_w.B7OffjAj57OaqP3BW7bZOLGjIdg";

var whitelistRoles = [ // Roles by ID that are whitelisted.
    "961515681814282310"
]

var blacklistRoles = [ // Roles by Id that are blacklisted.
    "943835373275070515"
]

// var notWhitelistedMessage = "You're Not Allowlisted. Join Discord and Get Allowlisted Link : https://discord.io/erp"
var notWhitelistedMessage = "Server is Under Development . Join Discord and Get Advanced Allowlisted Link : https://discord.io/erp We will Launch Server Very Soon"
var noGuildMessage = "Server is Under Development . Join Discord and Get Advanced Allowlisted Link : https://discord.io/erp We will Launch Server Very Soon"
var blacklistMessage = "You're blacklisted from this server."
var debugMode = true


/*

NOTES NOTES NOTES

Red Console Log === Member Denied Access
Yellow Console Log === Issue Determining Access
Green Console Log === Member Granted Access
Magenta Console Log === Blacklisted Member Denied Access
Blue Console Log === Script Information (error, etc)

*/


/// CODE DONT TOUCH THIS!!!! ///
/// CODE DONT TOUCH THIS!!!! ///
/// CODE DONT TOUCH THIS!!!! ///
const axios = require('axios').default;
axios.defaults.baseURL = 'https://discord.com/api/v8';
axios.defaults.headers = {
    'Content-Type': 'application/json',
    Authorization: `Bot ${botToken}`
};
function getUserDiscord(source) {
    if(typeof source === 'string') return source;
    if(!GetPlayerName(source)) return false;
    for(let index = 0; index <= GetNumPlayerIdentifiers(source); index ++) {
        if (GetPlayerIdentifier(source, index).indexOf('discord:') !== -1) return GetPlayerIdentifier(source, index).replace('discord:', '');
    }
    return false;
}
on('playerConnecting', (name, setKickReason, deferrals) => {
    let src = global.source;
    deferrals.defer();
    var userId = getUserDiscord(src);

    setTimeout(() => {
        deferrals.update(`Hello ${name}, Your Discord ID is being checked with our Allowlisted...`)
        setTimeout(async function() {
            if(userId) {
                axios(`/guilds/${guild}/members/${userId}`).then((resDis) => {
                    if(!resDis.data) {
                        if(debugMode) console.log(`^1'${name}' with ID '${userId}' cannot be found in the assigned guild and was not granted access.^7`);
                        return deferrals.done(noGuildMessage);
                    }
                    const hasRole = typeof whitelistRoles === 'string' ? resDis.data.roles.includes(whitelistRoles) : resDis.data.roles.some((cRole, i) => resDis.data.roles.includes(whitelistRoles[i]));
                    const hasBlackRole = typeof blacklistRoles === 'string' ? resDis.data.roles.includes(blacklistRoles) : resDis.data.roles.some((cRole, i) => resDis.data.roles.includes(blacklistRoles[i]));
                    if(hasBlackRole) {
                        if(debugMode) console.log(`^6'${name}' with ID '${userId}' is blacklisted to join this server.^7`);
                        return deferrals.done(blacklistMessage);
                    }
                    if(hasRole) {
                        if(debugMode) console.log(`^2'${name}' with ID '${userId}' was granted access and passed the Allowlisted.^7`);
                        return deferrals.done();
                    } else {
                        if(debugMode) console.log(`^6'${name}' with ID '${userId}' is not Allowlisted to join this server.^7`);
                        return deferrals.done(notWhitelistedMessage);
                    }
                }).catch((err) => {
                    if(debugMode) console.log(`^4There was an issue with the Discord API request. Is the guild ID & bot token correct?^7`);
                });
            } else {
                if(debugMode) console.log(`^1'${name}' was not granted access as a Discord identifier could not be found.^7`);
                return deferrals.done(`Discord was not detected. Please make sure Discord is running and installed. See the below link for a debugging process - https://docs.faxes.zone/c/fivem/debugging-discord`);
            }
        }, 0)
    }, 0)
})