FROM envirosoftwaresolutions/ubuntu-erlang:latest

LABEL description="Install rebar for erlang development"

# asdf install latest rebar
RUN asdf install rebar 3.11.0

# set the rebar version globally
RUN asdf global rebar 3.11.0
