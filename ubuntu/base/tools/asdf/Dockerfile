FROM envirosoftwaresolutions/ubuntu-tools:__VERSION__

# documentation
# not installing the actual asdf components, as this is to be done in descendent dockerfiles.

LABEL description="Add asdf plugins"

# asdf
# the -l flag above causes subsequent RUN commands to use a login shell,
# which means the ~/.profile is sourced. even though .profile sources
# the ~/.bashrc, I have had better luck sourcing asdf from .profile
# than from .bashrc.
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2 && \
    echo "# appending sourcing asdf to .profile instead of bashrc" >> ~/.profile && \
    echo ". $HOME/.asdf/asdf.sh" >> ~/.profile && \
    echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.profile

# update
RUN asdf update

# asdf common plugins
RUN asdf plugin-add erlang 	https://github.com/asdf-vm/asdf-erlang.git
RUN asdf plugin-add golang 	https://github.com/kennyp/asdf-golang
RUN asdf plugin-add haskell 	https://github.com/vic/asdf-haskell
RUN asdf plugin-add rust 	https://github.com/code-lever/asdf-rust
RUN asdf plugin-add rebar 	https://github.com/Stratus3D/asdf-rebar
RUN asdf plugin-add python 	https://github.com/danhper/asdf-python
RUN asdf plugin-add elixir 	https://github.com/asdf-vm/asdf-elixir

ONBUILD RUN asdf plugin-list
