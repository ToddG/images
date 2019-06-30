.PHONY: all
all: 
	# -------------------------------------------------------------------------------------------
	# Targets : 
	#
	#	ubuntu-tools :		build ubuntu with tools based on ubuntu 18.04
	#	ubuntu-asdf :		build ubuntu with asdf based on ubuntu-tools
	#	ubuntu-erlang : 	build erlang 22.0.4 based on ubuntu-asdf
	#	deploy-ubuntu-tools : 	deploy to public docker hub as envirosoftwaresolutions/ubuntu-tools:18.04 
	#	deploy-ubuntu-asdf : 	deploy to public docker hub as envirosoftwaresolutions/ubuntu-asdf:0.7.2
	#	deploy-ubuntu-erlang : 	deploy to public docker hub as envirosoftwaresolutions/ubuntu-erlang:22.0.4
	#
	# -------------------------------------------------------------------------------------------
	
.PHONY: ubuntu-tools
ubuntu-tools: 
	cd ubuntu && docker build -t toddg/ubuntu-tools:18.04 . 

.PHONY: ubuntu-asdf
ubuntu-asdf: 
	cd ubuntu/asdf && docker build -t toddg/ubuntu-asdf:0.7.2 .

.PHONY: ubuntu-erlang
ubuntu-erlang: 
	cd ubuntu/asdf/erlang && docker build -t toddg/ubuntu-erlang:22.0.4 .


.PHONY: deploy_ubuntu-tools
deploy-ubuntu-tools: 
	docker tag toddg/ubuntu-tools:18.04 envirosoftwaresolutions/ubuntu-tools:18.04 
	docker push envirosoftwaresolutions/ubuntu-tools:18.04

.PHONY: deploy_ubuntu-asdf
deploy-ubuntu-asdf: 
	docker tag toddg/ubuntu-asdf:0.7.2 envirosoftwaresolutions/ubuntu-asdf:0.7.2 
	docker push envirosoftwaresolutions/ubuntu-asdf:0.7.2

.PHONY: deploy_ubuntu-erlang
deploy-ubuntu-erlang: 
	docker tag toddg/ubuntu-erlang:22.0.4 envirosoftwaresolutions/ubuntu-erlang:22.0.4 
	docker push envirosoftwaresolutions/ubuntu-erlang:22.0.4
