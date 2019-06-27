These are things that hurt when trying to make a local

ssb-server --help basically told us nothing

ssb-server had big ol errors about libsodium, but then 'fell back to javascript' which seemed okay but was scary

ssb-server threw a bunch of errors when we had multiple servers running in a room
  we had to turn off wifi to temporarily 'fix' those errors

ssb_appname is in environment, but all other things are config flags

allowprivate=true and local=true was needed to start the server

getting the local fully qualified hostname is a pain, and different across systems (hostname [-A])

npm install -g ssb-patchwork fails for a bunch of reasons

we decided to use ssb-patchwork instead of the binary one because we wanted to point it towards our ssb_appname


# things that would make substantial help

When options are not entered

1. for `ssb_appname`, if running from an interactive commandline, fail
2. for `host`, if local is true then use `bash hostname`
3. for `host`, if local is false then use `curl ifconfig.co`
4. for `caps.sign`, if caps.shs is specified, it should fail
