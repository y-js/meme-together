
var Y = require('yjs');
Y.XMPP = require('y-connectors').XMPP;

var connector = new Y.XMPP("meme-together-yjs", {
  host: "yatta.ninja",
  user: "dmonad@users.yatta.ninja",
  password: process.argv[2],
});

connector.debug = true

var y = new Y(connector);
var feed = y.val("feed",[],"mutable").val("feed");

/*
 Do not allow a feed size greater that 10
*/

var feed_size = 10;

feed.observe(function(){
  // whenever something changed, check if the feedt size exceeds 10
  var length = feed.val().length;
  if(length > feed_size){
    feed.delete(feed_size,length-feed_size)
  }
})
console.log("listening!")

