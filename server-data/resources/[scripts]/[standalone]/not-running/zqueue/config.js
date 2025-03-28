// Log debug messages (joined queue, removed from queue, etc)
const debug = false;

// Use queue always (true) or only when server is at near capacity (false)
const alwaysUse = false;

// amount of time someone can rejoin without having to wait in queue again (for crashes)
const graceListTime = 5; // minutes

const adaptiveCard = {
    "card_title": "ERP Queue System",
    "card_header": "https://cdn.discordapp.com/attachments/880073470866763896/998313312188108941/Untitled.png",
    "card_description": "Elapsed Roleplay Queue System",
    "button1_title": "Join Discord",
    "button1_url": "https://discord.gg/RCrVd2HPfA",
    "button2_title": "Join Server",
    "button2_url": "https://elapsedrp.cf",
};


const priorityList = [ // Order defines priority
    { // Priority 1
        "title": "Owner",
        "roles": [
            "000000000000000000", // Owner / God
        ],
    },
    { // Priority 2
        "title": "Staff",
        "roles": [
            "000000000000000000", // Admin
            "000000000000000000", // Mod
        ],
    },
    { // Priority 3
        "title": "Donor",
        "roles": [
            "000000000000000000", // Donor
        ],
    },
    // Everyone else will default to end
];



/** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 * !! DO NOT EDIT BELOW THIS LINE UNLESS YOU KNOW WHAT YOU'RE DOING !!
 * !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/

module.exports = {
    debug: getConBool("zqueue_debug", debug),
    alwaysUse: getConBool("zqueue_alwaysuse", alwaysUse),
    graceListTime: graceListTime,
    adaptiveCard: adaptiveCard,
    priorityList: priorityList,
};

/** Returns convar or default value fixed to a true/false boolean
 * @param {boolean|string|number} con - Convar name
 * @param {boolean|string|number} def - Default fallback value
 * @returns {boolean} - parsed bool */
function getConBool(con, def) {
    if (typeof def == "boolean") def = def.toString();
    const ret = GetConvar(con, def);
    if (typeof ret == "boolean") return ret;
    if (typeof ret == "string") return ["true", "on", "yes", "y", "1"].includes(ret.toLocaleLowerCase().trim());
    if (typeof ret == "number") return ret > 0;
    return false;
}
