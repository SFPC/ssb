# this is really unsafe to run

command -v ssb-server >/dev/null || npm install -g ssb-minimal-pub-server

SSB_APPNAME=sfpc

generate_secret() {
  node -e 'console.log(require("crypto").randomBytes(32).toString("base64"))'
}

CAPS_SHS=$(generate_secret)
CAPS_SIGN=$(generate_secret)
LOCALHOST=$(hostname -A | awk '{print $1}' || hostname | awk '{print $1}')

ssb_appname=$SSB_APPNAME ssb-server start -- \
  --host=$LOCALHOST \
  --caps.shs=$CAPS_SHS \
  --caps.sign=$CAPS_SIGN \
  --allowPrivate=true \
  --local=true

ssb_appname=$SSB_APPNAME ssb-server invite.create $INVITES -- \
  --host=$LOCALHOST \
  --caps.shs=$CAPS_SHS \
  --caps.sign=$CAPS_SIGN
