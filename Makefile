.PHONY: all
all: help 

.PHONY: help
help: 
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

# variables that can be overridden by the command line
version := 0.0.1
ubuntu_base_version := 0.0.2
nocache := false

.PHONY: prune
prune:	
	docker system prune -a -f

.PHONY: expand-templates
expand-templates:
	rm -rf ./target
	mkdir target
	cp -rv ubuntu/ target/
	find target/ -type f -exec sed -i "s/__VERSION__/$(version)/g" {} \;

.PHONY: test
test:	expand-templates ubuntu-tools ubuntu-asdf

.PHONY: build
build:	expand-templates ubuntu-tools ubuntu-asdf ubuntu-erlang ubuntu-rebar
	# building entire tool-chain, except ubuntu-base, which shouldn't need
	# to be rebuilt. if it does need to be built, then do that manually via
	# `make version=... nocache=true ubuntu-base` and then build the rest of
	# the tool-chain.

.PHONY: deploy
deploy:	deploy-ubuntu-base deploy-ubuntu-tools deploy-ubuntu-asdf deploy-ubuntu-erlang
	# deploying entire tool-chain

.PHONY: ubuntu-base
ubuntu-base:
	# FROM pinned to 18.04
	cd target/ubuntu/base && docker build -t envirosoftwaresolutions/ubuntu-base:$(ubuntu_base_version) . --no-cache=$(nocache)
	docker tag envirosoftwaresolutions/ubuntu-base:$(ubuntu_base_version) envirosoftwaresolutions/ubuntu-base:latest

.PHONY: ubuntu-tools
ubuntu-tools:
	# FROM pinned to ubuntu-base:0.0.2
	cd target/ubuntu/base/tools && docker build -t envirosoftwaresolutions/ubuntu-tools:$(version) . --no-cache=$(nocache)
	docker tag envirosoftwaresolutions/ubuntu-tools:$(version) envirosoftwaresolutions/ubuntu-tools:latest

.PHONY: ubuntu-asdf
ubuntu-asdf:
	# FROM templated to __VERSION__
	cd target/ubuntu/base/tools/asdf && docker build -t envirosoftwaresolutions/ubuntu-asdf:$(version) . --no-cache=$(nocache)
	docker tag envirosoftwaresolutions/ubuntu-asdf:$(version) envirosoftwaresolutions/ubuntu-asdf:latest

.PHONY: ubuntu-erlang
ubuntu-erlang: 
	# FROM templated to __VERSION__
	cd target/ubuntu/base/tools/asdf/erlang && docker build -t envirosoftwaresolutions/ubuntu-erlang:$(version) . --no-cache=$(nocache)
	docker tag envirosoftwaresolutions/ubuntu-erlang:$(version) envirosoftwaresolutions/ubuntu-erlang:latest

.PHONY: ubuntu-rebar
ubuntu-rebar: 
	# FROM templated to __VERSION__
	cd target/ubuntu/base/tools/asdf/erlang/rebar && docker build -t envirosoftwaresolutions/ubuntu-rebar:$(version) . --no-cache=$(nocache)
	docker tag envirosoftwaresolutions/ubuntu-rebar:$(version) envirosoftwaresolutions/ubuntu-rebar:latest


.PHONY: deploy_ubuntu-base
deploy-ubuntu-base: 
	docker push envirosoftwaresolutions/ubuntu-base:$(ubuntu_base_version)
	docker push envirosoftwaresolutions/ubuntu-base:latest

.PHONY: deploy_ubuntu-tools
deploy-ubuntu-tools: 
	docker push envirosoftwaresolutions/ubuntu-tools:$(version)
	docker push envirosoftwaresolutions/ubuntu-tools:latest

.PHONY: deploy_ubuntu-asdf
deploy-ubuntu-asdf: 
	docker push envirosoftwaresolutions/ubuntu-asdf:$(version)
	docker push envirosoftwaresolutions/ubuntu-asdf:latest

.PHONY: deploy_ubuntu-erlang
deploy-ubuntu-erlang: 
	docker push envirosoftwaresolutions/ubuntu-erlang:$(version)
	docker push envirosoftwaresolutions/ubuntu-erlang:latest

.PHONY: deploy_ubuntu-rebar
deploy-ubuntu-rebar: 
	docker push envirosoftwaresolutions/ubuntu-rebar:$(version)
	docker push envirosoftwaresolutions/ubuntu-rebar:latest
