FROM debian:buster-20191224-slim

RUN apt-get update -qq\
  && apt-get install -y curl gnupg gnupg2 gnupg1 nmap sudo\
  && rm -rf /var/lib/apt/lists/*

RUN curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall\
    && chmod +x msfinstall\
    && ./msfinstall\
    && rm msfinstall

# hadolint ignore=DL4006
RUN echo "root:root" | chpasswd

# hadolint ignore=DL4006
RUN useradd -s /bin/bash -d /home/metasploit/ -m -G sudo metasploit\
    && echo "metasploit:metasploit" | chpasswd

USER metasploit

WORKDIR /home/metasploit

CMD [ "/bin/bash" ]
