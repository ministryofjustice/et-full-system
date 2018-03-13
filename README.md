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
