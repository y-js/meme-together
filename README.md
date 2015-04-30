
This is a showcase project for [Yjs](https://github.com/y-js/yjs).

Create memes collaboratively. Everyone is able to see the changes you make in Real-Time. Open this page in another tab and be amazed. You find the complete source code for this example on here. You can also include this in your project, if you want.

Test it out now on [my homepage](http://y-js.org/meme-together/)

# Howto include this
```
<!-- 1. Load webcomponents.min.js for polyfill support. -->
<script src="../webcomponentsjs/webcomponents.min.js"></script>

<!-- 2. Use an HTML Import to bring in the element. -->
<link rel="import" href="./meme-together-raw.html">
```
In your body you can use this element like this.
```
<meme-together></meme-together>
```

If you start a master client for your instance, you are able to serve thousands of users. Therefore you must set the syncMethod to "master-slave" and start the server with your room. (Check out server.js)

E.g.:
```
<meme-together syncMothed="master-slave"></meme-together>
```

By default, meme-together creates a room that has the value of `window.location.host`. Therefore every server has another instance. You can also set, or retrieve the current room: `$("meme-together")[0].room`.
