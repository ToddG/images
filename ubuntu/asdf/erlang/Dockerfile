FROM envirosoftwaresolutions/ubuntu-asdf:latest

LABEL description="Add Erlang runtime"
LABEL runtime="erlang"
LABEL runtime_version="22.0.4"

# deps specific for asdf-erlang. installed in ubuntu-base but documented here
#RUN apt-get -y install libxml2-utils build-essential autoconf m4 libncurses5-dev libwxgtk3.0-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop

# install latest erlang (right now) is 22.0.4) uses kerl to build the latest image from source
RUN asdf install erlang 22.0.4

# set the erlang version globally
RUN asdf global erlang 22.0.4
