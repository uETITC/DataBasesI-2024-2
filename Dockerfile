FROM ubuntu/mysql:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Set the default user for the MySQL image
USER mysql

RUN apt update 
# RUN&& apt -y upgrade \
RUN apt install -y python3-pip unzip 

# Set environment variables for the new user
ENV MYSQL_USER=dba\
    MYSQL_PASSWORD=$123456789\
    MYSQL_DATABASE=Universidad

# add requirements.txt, written this way to gracefully ignore a missing file
COPY requirements.tx[t] .
RUN ([ -f requirements.txt ] \
      && pip3 install --no-cache-dir -r requirements.txt) \
      || pip3 install --no-cache-dir jupyter jupyterlab 
      # pip3 install git+git://github.com/Hourout/mysql_kernel.git \
      # python3 -m mysql_kernel.install
    #   pip3 install sqlalchemy pandas ipython-sql \
    #   pip3 install jupyterlab_sql \
    #   jupyter serverextension enable jupyterlab_sql --py --sys-prefix \
    #   jupyter lab build \

RUN pip3 install mysql_kernel \
    && python3 -m mysql_kernel.install

# Run the following commands to create the new user and grant them the necessary permissions
# RUN mysql -u root -p -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
# RUN mysql -u root -p -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
# RUN mysql -u root -p -e "FLUSH PRIVILEGES;"

# Expose port 3306 to allow connections to the database
EXPOSE 3306

# Set up the user environment
ENV NB_USER=saguileran\
    NB_UID=1000\
    HOME=/home/$NB_USER

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid $NB_UID \
    $NB_USER

COPY . $HOME
RUN chown -R $NB_UID $HOME

USER $NB_USER

# Launch the notebook server
WORKDIR $HOME
# CMD ["mysqld"]
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser"]