FROM ubuntu/mysql:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Set the default user for the MySQL image
USER mysql

RUN apt-get update \
    && apt-get install -y python3-pip unzip \
    && apt-get -yq install mysql-server \
    rm -rf /var/lib/apt/lists/*
    #apt-get install telnet iputils-ping  mysql-client -y

# Change mysql to listen on 0.0.0.0
ADD bind_0.cnf /etc/mysql/conf.d/bind_0.cnf

# setup our entry point
# ADD init.sh /init.sh
# RUN chmod 755 /*.sh
# ENTRYPOINT ["/init.sh"]

# Set environment variables for the new user
ENV MYSQL_USER=dba
ENV MYSQL_PASSWORD=$123456
ENV MYSQL_DATABASE=Universidad

# add requirements.txt, written this way to gracefully ignore a missing file
COPY requirements.tx[t] .
RUN ([ -f requirements.txt ] \
      && pip3 install --no-cache-dir -r requirements.txt) \
      || pip3 install --no-cache-dir jupyter jupyterlab \
      # pip3 install git+git://github.com/Hourout/mysql_kernel.git \
      # python3 -m mysql_kernel.install
      pip3 install sqlalchemy pandas ipython-sql \
      pip3 install jupyterlab_sql \
      jupyter serverextension enable jupyterlab_sql --py --sys-prefix \
      jupyter lab build \
      pip3 install mysql_kernel

# Run the following commands to create the new user and grant them the necessary permissions
RUN mysql -u root -p -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
RUN mysql -u root -p -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
RUN mysql -u root -p -e "FLUSH PRIVILEGES;"

# Expose port 3306 to allow connections to the database
EXPOSE 3306

# # Set up the user environment
# ENV NB_USER saguileran
# ENV NB_UID 1000
# ENV HOME /home/$NB_USER

# RUN adduser --disabled-password \
#     --gecos "Default user" \
#     --uid $NB_UID \
#     $NB_USER

# COPY . $HOME
# RUN chown -R $NB_UID $HOME

# USER $NB_USER

# # Launch the notebook server
# WORKDIR $HOME
CMD ["mysqld"]
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser"]