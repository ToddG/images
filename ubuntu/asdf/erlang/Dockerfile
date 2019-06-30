FROM toddg/ubuntu-asdf:0.7.2

#LABEL maintainer="----"
#LABEL base_os="----"
#LABEL base_os_version="----"
LABEL runtime="erlang"
LABEL runtime_version="22.0.4"
#LABEL application="----"
#LABEL application_version="----"

# install erlang (latest right now is 22.0.4)
RUN /root/.asdf/bin/asdf install erlang 22.0.4
RUN /root/.asdf/bin/asdf global erlang 22.0.4
