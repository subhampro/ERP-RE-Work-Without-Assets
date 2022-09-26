const Discord = require('discord.js');

const client = new Discord.Client();

const config = require("./config.json");

const log = require("./config.json").logs;

const darkid = require("./config.json").darkweb;

client.on('ready', () => {
	console.log('Jacob.Willson.Embed.Bot is ready for action!');
});

client.on('ready', () => {
	client.user.setActivity('ACTIVITY ON DARKWEB', { type: 'WATCHING' });
});

client.on('message', message => {
	if (message.channel.type === 'dm'){
		const msj = message.content
		const id = message.author.id
		const emb = new Discord.MessageEmbed()
		.setColor('FF0000')
		.setTitle('**Dark Web**')
		.setDescription(`${msj}`)
		.setFooter(`${message.author.username}`, message.author.displayAvatarURL({ dynamic: true }))
		const emb2 = new Discord.MessageEmbed()
		.setColor('050000')
		.setTitle('<:ANONYMOUS:870733184122380308> DARKWEB')
		.setDescription(`👺 **|** ${msj}`)
		const channel = client.channels.cache.get(`${log}`);
		channel.send(emb)
		const channel2 = client.channels.cache.get(`${darkid}`);
		channel2.send(emb2)
	}
});
client.login(config.token);