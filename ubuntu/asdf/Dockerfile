FROM toddg/ubuntu-tools:18.04

# asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2
RUN echo '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
RUN echo '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# no idea why the '-l' flag isn't working, referencing asdf by fqpath

# update
RUN /root/.asdf/bin/asdf update

# asdf common plugins
RUN /root/.asdf/bin/asdf plugin-add erlang 	https://github.com/asdf-vm/asdf-erlang.git
RUN /root/.asdf/bin/asdf plugin-add golang 	https://github.com/kennyp/asdf-golang
RUN /root/.asdf/bin/asdf plugin-add haskell 	https://github.com/vic/asdf-haskell
RUN /root/.asdf/bin/asdf plugin-add rust 	https://github.com/code-lever/asdf-rust
RUN /root/.asdf/bin/asdf plugin-add rebar 	https://github.com/Stratus3D/asdf-rebar
RUN /root/.asdf/bin/asdf plugin-add python 	https://github.com/danhper/asdf-python
RUN /root/.asdf/bin/asdf plugin-add elixir 	https://github.com/asdf-vm/asdf-elixir
