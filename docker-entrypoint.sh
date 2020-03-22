#!/bin/bash

sed -i 's/127.0.0.1/0.0.0.0/g' /usr/src/app/web/vue/statics/UIconfig.js
sed -i 's/localhost/'${HOST}'/g' /usr/src/app/web/vue/statics/UIconfig.js
sed -i 's/3000/'${PORT}'/g' /usr/src/app/web/vue/statics/UIconfig.js
if [[ "${USE_SSL:-0}" == "1" ]] ; then
    sed -i 's/ssl: false/ssl: true/g' /usr/src/app/web/vue/statics/UIconfig.js
fi
exec node --max_old_space_size="$MEMORYNODE" gekko "$@"
