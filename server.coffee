
Yatta = require '../Yatta/lib/yatta.coffee'
XMPPConnector = require '../Yatta-Connectors/lib/xmpp-connector/xmpp-connector.coffee'

connector = new XMPPConnector "meme-together2",
  server: true
  user: "dmonad@users.yatta.ninja"
  password: process.argv[2]

connector.debug = true

yatta = new Yatta connector
feed = yatta.val("feed",[],"mutable").val("feed")

feed_size = 2

feed.observe ()->
  l = feed.val().length
  if l > feed_size
    feed.delete(feed_size,l-feed_size)

console.log("listening!")

module.exports = yatta
