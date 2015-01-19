
Yatta = require '../Yatta/lib/yatta.coffee'
XMPPConnector = require '../Yatta-Connectors/lib/xmpp-connector/xmpp-connector.coffee'

connector = new XMPPConnector "meme-together2",
  server: true
  user: "dmonad@users.yatta.ninja"
  password: process.argv[2]

connector.debug = true

yatta = new Yatta connector

console.log("listening!")

module.exports = yatta
