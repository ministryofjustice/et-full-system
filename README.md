# Experiment - DO NOT USE

This project groups together all the components of the employment tribunal
system for development purposes and to perform end to end tests on them 
whilst developing the jadu replacement system.

# Cloning

This project is an umbrella project using git submodules.  This is for convenience so that all developers have the
same structure, meaning that docker-compose files etc.. can be setup to span across projects.

So, to clone - do 

```

git clone --recursive git@github.com:ministryofjustice/et-full-system.git

```

or if you already have cloned but forgot the '--recursive'

```

git submodule update --init

```


# Using The Docker Setup

See below for details, but there are scripts in bin/dev to run this stuff - so to fire up the servers do :-


```

./bin/dev/test_servers up

```

to start them - and if ctrl-c doesn't kill them you may occasionally need to do :-

```

./bin/dev/test_servers down

```

In the docker folder, there are a few folders each with at least a docker-compose.yml file in

Here are what they are for :-

## docker/test_servers

Will run all of the servers to run tests against or to manually test against

### Environment Variables

There are some special environment variables too :-

#### ETAPI_DB_PORT

If specified then the db port will be forwarded to the specified port on the local machine for use in development so another rails instance can share it.
If not specified, port 0 is used which means 'a random port' - use 'docker ps' to see where the ports are forwarded

e.g

```
ETAPI_DB_PORT=5433

```

#### ETAPI_REDIS_PORT

If specified, then the redis port for the API server will be forwarded to the specified port on the local machine for use in development so another rails instance can share it.
If not specified, port 0 is used which means 'a random port' - use 'docker ps' to see where the ports are forwarded.

e.g.

```

ETAPI_REDIS_PORT=6379

```

#### ETAPI_PORT

If specified then the API port will be forwarded to the specified port.
As above, if not specified, a random port is assigned and you will have to use 'docker ps' to find out which

e.g.

```

ETAPI_PORT=3200

```

#### ET1_PORT

If specified then the ET1 server port will be forwarded to the specified port.
As above, if not specified, a random port is assigned and you will have to use 'docker ps' to find out which

```

ET1_PORT=3300

```

#### JADU_API

If specified (see example) then an external JADU API is used by ET. As standard, this points to the internal 'etapi' service in the docker-compose file.  This is only overriden in development if you want to develop using an external rails instance instead of the docker container.
Only valid for the ET1 system

Example to use port 3000 on your local machine

```
JADU_API=http://host.docker.internal:3000/api/v1/
```

note that because ET1 is a docker container, you must use the ip or hostname of your machine or host.docker.internal and NOT localhost.


## docker/test_framework

Used to run the test suite - generally you would grab a bash session using

```
docker-compose run test bash
```

and then do normal ruby stuff such as bundle exec rspec

