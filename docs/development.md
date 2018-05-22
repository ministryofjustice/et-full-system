# Developing Using This Framework

First of all, it is worth pointing out that this framework as standard runs as close to production as it
can, so trying to develop by just changing files within the systems directory will soon become painful as
you will have to keep restarting.  You can, however, 'touch tmp/restart.txt' from a sub project
and the rails app will restart - this is a 'passenger' gem feature - or you can isolate parts of the system
and run them yourself.
Obviously if you are working on many parts of the system, it might not be of benefit using this 
framework for the server itself, but if you are just working on one part of the system and
cannot be bothered with setting up the rest then this will save you some time.

The framework provides both a web server to host all of the projects as different subdomains
and also it runs sidekiq on projects that need it (et1 and api so far).

## Isolating Parts Of The System

### Running your own ET3 as an example

Lets say you are a developer and you want to run the ET3 system yourself so you can do all of your
normal debugging tricks.  When you start the test server, just tell it about your instance of
ET3 by specifying its URL in the 'MY_ET3' environment variable as shown below.
Whilst not in the case of ET3, you will often need to consider sharing the database server and the
redis server from the framework - in which case specify DB_PORT=5432 and/or REDIS_PORT=6379 so 
the ports are available for your app to use.

If you don't need to do that and have your own DB server then just use that.

So, here is an example of how to inform the test server that you are hosting ET3 locally
 - note the special host.docker.internal domain name - this is because the nginx server
is inside the docker network and your local machine isn't, it saves using the ip address.

```
MY_ET3=http://host.docker.internal:3000 ./bin/dev/test_server up

```

and of course you need to run the ET3 project, but will need to set the environment variables
accordingly.  For example :-

```

ET_API_URL=http://api.et.127.0.0.1.nip.io:3100/api bundle exec rails s

```

