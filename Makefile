.PHONY: all
all: help 

.PHONY: help
help: 
	# -------------------------------------------------------------------------------------------
	# make version={VERSION} TARGET
	#
	# Targets : 
	#	
	#	build : 		build all containers
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

.PHONY: build
build:	ubuntu-base ubuntu-tools ubuntu-asdf ubuntu-erlang ubuntu-rebar

.PHONY: deploy
build:	deploy-ubuntu-base deploy-ubuntu-tools deploy-ubuntu-asdf deploy-ubuntu-erlang

.PHONY: ubuntu-base
ubuntu-base:
	cd ubuntu/base && docker build -t envirosoftwaresolutions/ubuntu-base:$(version) .
	docker tag envirosoftwaresolutions/ubuntu-base:$(version) envirosoftwaresolutions/ubuntu-base:latest

.PHONY: ubuntu-tools
ubuntu-tools:
	cd ubuntu/tools && docker build -t envirosoftwaresolutions/ubuntu-tools:$(version) .
	docker tag envirosoftwaresolutions/ubuntu-tools:$(version) envirosoftwaresolutions/ubuntu-tools:latest

.PHONY: ubuntu-asdf
ubuntu-asdf: 
	cd ubuntu/asdf && docker build -t envirosoftwaresolutions/ubuntu-asdf:$(version) .
	docker tag envirosoftwaresolutions/ubuntu-asdf:$(version) envirosoftwaresolutions/ubuntu-asdf:latest

.PHONY: ubuntu-erlang
ubuntu-erlang: 
	cd ubuntu/asdf/erlang && docker build -t envirosoftwaresolutions/ubuntu-erlang:$(version) .
	docker tag envirosoftwaresolutions/ubuntu-erlang:$(version) envirosoftwaresolutions/ubuntu-erlang:latest

.PHONY: ubuntu-rebar
ubuntu-rebar: 
	cd ubuntu/asdf/rebar && docker build -t envirosoftwaresolutions/ubuntu-rebar:$(version) .
	docker tag envirosoftwaresolutions/ubuntu-rebar:$(version) envirosoftwaresolutions/ubuntu-rebar:latest


.PHONY: deploy_ubuntu-base
deploy-ubuntu-base: 
	docker push envirosoftwaresolutions/ubuntu-base:$(version)
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
