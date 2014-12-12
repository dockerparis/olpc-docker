FROM     base/archlinux:latest

RUN yes | pacman -Syy
RUN yes | pacman -S gcc nodejs openssh mongodb supervisor nginx git

COPY authorized_keys /root/.ssh/authorized_keys
COPY supervisord.conf /etc/supervisor.d/supervisord.ini
COPY nginx.conf /etc/nginx/nginx.conf

RUN ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

RUN cd /opt; git clone https://github.com/llaske/sugarizer.git
RUN cd /opt/sugarizer/server; npm install
RUN mkdir /opt/sugarizer/db

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]
