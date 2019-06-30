FROM ubuntu:18.04

# documentation
LABEL description="Add common build tools"
LABEL maintainer="Todd Greenwood-Geer"
LABEL company="Enviro Software Solutions, LLC"
LABEL repo="github.com/toddg/images/"
LABEL dockerfile="ubuntu/Dockerfile"
LABEL base_os="ubuntu"
LABEL base_os_version="18.04"

# install working tools
RUN apt-get update
RUN apt-get upgrade -y

# common asdf erlang deps
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
                        libxml2-utils \ 
			libyaml-dev \
			m4 \
			unixodbc-dev \
			unzip \
			openssl1.0 \
			vim \
			xsltproc 

ONBUILD RUN uname -a

ENTRYPOINT ["/bin/bash"]

# Notes:
# 1) Unless there's a really good reason, like a bunch of missing apt  libraries need to be installed, this image can stay the same.
# 2) The next library in the chain is ../tools and additions can be put there.
# 3) If we need a slimmed down image, then start with base ubuntu or alpine or whatever...these are intentionally fat
