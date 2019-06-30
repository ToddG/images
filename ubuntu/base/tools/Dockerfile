FROM envirosoftwaresolutions/ubuntu-base:0.0.2

LABEL description="Add more common tools and tweaks"

# override ./profile (see notes in profile)
COPY profile /root/.profile
RUN cat /root/.profile

# use bash, not sh, and make this a 'login' shell with the '-l' flag
# which should cause the .profile to get sourced for subsequent RUN
# commands
SHELL ["/bin/bash", "-l", "-c"]
ENTRYPOINT ["/bin/bash"]
