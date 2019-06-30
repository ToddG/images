# An ubuntu with all the build tools I commonly want available
FROM ubuntu:18.04

LABEL maintainer="Todd Greenwood-Geer"
LABEL base_os="ubuntu"
LABEL base_os_version="18.04"
#LABEL runtime="erlang"
#LABEL runtime_version="22.0.4"
#LABEL application="----"
#LABEL application_version="----"

# install working tools
RUN apt-get update
RUN apt-get upgrade -y

# asdf deps : https://github.com/asdf-vm/asdf-erlang
RUN apt-get -y install \
			autoconf \
			automake \
			build-essential \
			curl \
			fop \
			git\
			libffi-dev \
			libgl1-mesa-dev \
			libglu1-mesa-dev \
			libncurses5-dev \
			libncurses-dev \
			libpng-dev \
			libreadline-dev \
			libssh-dev \
			libssl-dev \
			libtool \
			libwxgtk3.0-dev \
			libxslt-dev \
			libyaml-dev \
			m4 \
			unixodbc-dev \
			unzip \
			openssl1.0\
			xsltproc 
