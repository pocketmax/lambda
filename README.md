# lambda - generic lambda execution based purely on docker containers

runs basic lambda function in parallel from queue
```
docker run --rm -e LIMIT=10 -e TTL=4000 pocketmax/lambda
```

# features
* can use different event sources like redis, mongodb

# THINGS TO FIGURE OUT
1. how to unit test with pre-defined events. need to monitor what events get emitted by function

# docker layers
1. layers/node-9.3 <- uses node
2. layers/redis    <- uses node redis driver for event client
3. layers/fn       <- lambda function with injected redis instance for emiter

# file structure
/app.js
/package.js
/node_modules

# build steps
1. install node modules
2. 

# cmd line config options
* max running instances
* ttl per instance
* mem limit
* cpu limit
* custom var
* event server IP
* event server credentials

# package.json stuff
* 