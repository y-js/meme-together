/*
 * Using Yjs on nodejs is not very different
 * from using it in the browser. It is *just another client*!
 * in some 
 */

var Y = require('../yjs/build/node/y');
Y.XMPP = require('../y-connectors/build/node/index').XMPP;

var connector = new Y.XMPP({
  host: "yatta.ninja", // You _must_ specify the host, when using it with nodejs (this is our testing server)
  user: "dmonad@users.yatta.ninja",
  password: process.argv[2],
}).join("meme-together");

connector.debug = true

var y = new Y(connector);
var feed = y.val("feed",[],"mutable").val("feed");

/*
 * The server has the function to not allow a feed size greater that 15.
 * When a greater number is reached, it will automatically delete the
 * oldest posts.
*/

var feed_size = 15;

feed.observe(function(){
  // whenever something changed, check if the feed size exceeds 15
  var length = feed.val().length;
  if(length > feed_size){
    feed.delete(feed_size,length-feed_size)
  }
})
console.log("listening!")

