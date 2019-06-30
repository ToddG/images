# Images

Container images that I use for things like Docker, etc.

## Containers

```text
└── ubuntu
    └── base
        └── tools
            └── asdf
                └── erlang
                    └── rebar

```

## Help

```text

$ make

# -------------------------------------------------------------------------------------------
# make version={VERSION} nocache={true|false} TARGET
#
# Targets : 
#	
#	build : 		build all containers (except ubuntu-base)
#	deploy : 		deploy all containers
#	ubuntu-base :		build base ubuntu refreshed apt repos, based on 18.04
#	ubuntu-tools :		build ubuntu with common tools based on ubuntu-base
#	ubuntu-asdf :		build ubuntu with asdf based on ubuntu-tools
#	ubuntu-erlang : 	build erlang 22.0.4 based on ubuntu-asdf
#	ubuntu-rebar : 		build rebar 3.11.0 based on ubuntu-erlang
#	deploy-ubuntu-tools : 	deploy to public docker hub as envirosoftwaresolutions/ubuntu-tools:18.04 
#	deploy-ubuntu-asdf : 	deploy to public docker hub as envirosoftwaresolutions/ubuntu-asdf:0.7.2
#	deploy-ubuntu-erlang : 	deploy to public docker hub as envirosoftwaresolutions/ubuntu-erlang:22.0.4
#
# Examples :
#
# 	make version=0.0.1 build
# 		-> builds 'build' target with versions set as 0.0.1
#
# -------------------------------------------------------------------------------------------
```

## Gotchas

### Bash Sourcing

`asdf` is not getting sourced properly in the scripts necessitating a workaround from the 
commandline:

ubuntu/base/tools/Dockerfile:
```text
...
# use bash, not sh, and make this a 'login' shell with the '-l' flag
# which should cause the .profile to get sourced for subsequent RUN
# commands
SHELL ["/bin/bash", "-l", "-c"]
ENTRYPOINT ["/bin/bash"]
```

The `-l` in the command above ensures that subsequent Dockerfile `RUN` commands
will be invoked with the `--login` flag. Bash will start as a 'login' shell and
source the `$HOME/.profile` of the user, in this case `root`.

However, while this works well for Dockerfiles and Dockerfiles that inherit (via FROM) from
Dockerfiles, it does _not_ hold true for command line invocations like this:

```bash
$ docker run -it envirosoftwaresolutions/ubuntu-rebar:0.0.9
```

The above command will launch and b/c the ENTRYPOINT of an ancestor was set to be `/bin/bash`, 
bash will be invoked. But it will _not_ be invoked as a `login` shell, so `asdf` shell scripts
will not have been sourced. So, just add the `-l` flag and things will work as expected:


```bash
$ docker run -it envirosoftwaresolutions/ubuntu-rebar:0.0.9 -l
```
