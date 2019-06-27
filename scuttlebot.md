# Setting up a local

What is a local?

A local is an scuttlebutt dead drop - a friendly networked server sharing what its heard on the local network.

# Setting up a pub server

First let's install a simple configuration of a peer, made for running a pub

    npm install -g ssb-minimal-pub-server

Since we are messing around with learning this stuff, lets make our own private universe.
These are randomly generated keys. SHS stands for Secret Handshake.

    CAPS_SHS=node -e 'console.log(require("crypto").randomBytes(32).toString("base64"))'

CAPS_SHS is what you share with all the clients to be part of the network

    CAPS_SIGN=node -e 'console.log(require("crypto").randomBytes(32).toString("base64"))'

CAPS_SIGN is only for the server. This makes it safe if a peer changes their SHS, they won't accidentally start leaking messages from one universe to another.

Let's also create a new directory to sync things in, so we don't clobber ~/.ssb

    ssb_appname=sfpc

We need to use a hostname for a local

    LOCALHOST=$(hostname -A | awk '{print $1}' || hostname | awk '{print $1}')

Now we can safely start the server

    ssb_appname=sfpc ssb-server start -- --caps.shs="$CAPS_SHS" --caps.sign="$CAPS_SIGN" --allowPrivate=true --local=true --host=$LOCALHOST

Lets create an invite so peers can request that the pub follow them. Make sure this window has CAPS_SIGN, and CAPS_SHS

    INVITES=100
    INVITE=$(ssb_appname=sfpc ssb-server invite.create $INVITES -- --caps.shs="$CAPS_SHS" --caps.sign="$CAPS_SIGN" --host=$LOCALHOST)
    echo $INVITE

Now post this invite somewhere up in your space!

# How do I connect to the local?

Its a bit easier than setting up the local pub.

First, install patchwork npm

    npm install -g ssb-patchwork
