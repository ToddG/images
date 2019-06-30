FROM envirosoftwaresolutions/ubuntu-base:latest

LABEL description="Add more common tools and tweaks"

# override ./profile (see notes in profile)
COPY profile /root/.profile
RUN cat /root/.profile

# use bash, not sh, and make this a 'login' shell with the '-l' flag
SHELL ["/bin/bash", "-l", "-c"]
