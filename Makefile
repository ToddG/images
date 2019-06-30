.PHONY: all
all: 
	# -------------------------------------------------------------------------------------------
	# Targets : 
	#
	#	ubuntu-tools :		build ubuntu with tools based on ubuntu 18.04
	#	ubuntu-asdf :		build ubuntu with asdf based on ubuntu-tools
	#	ubuntu-erlang : 	build erlang 22.0.4 based on ubuntu-asdf
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
