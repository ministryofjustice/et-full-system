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

In the docker folder, there are a few folders each with at least a docker-compose.yml file in

Here are what they are for :-

## docker/test_servers

Will run all of the servers to run tests against or to manually test against

## docker/test_framework

Used to run the test suite - generally you would grab a bash session using

```
docker-compose run test bash
```

and then do normal ruby stuff such as bundle exec rspec