FROM mysql:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Set the default user for the MySQL image
USER mysql


RUN apt-get update
RUN apt-get install -y python3-pip unzip

# add requirements.txt, written this way to gracefully ignore a missing file
COPY requirements.tx[t] .
RUN ([ -f requirements.txt ] \
      && pip3 install --no-cache-dir -r requirements.txt) \
      || pip3 install --no-cache-dir jupyter jupyterlab

# USER root
RUN pip install git+git://github.com/Hourout/mysql_kernel.git \
    python -m mysql_kernel.install  --sys-prefix
# # Download the kernel release
# RUN curl -L https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip > ijava-kernel.zip

# # Unpack and install the kernel
# RUN unzip ijava-kernel.zip -d ijava-kernel \
#   && cd ijava-kernel \
#   && python3 install.py --sys-prefix

# Set environment variables for the new user
ENV MYSQL_USER=dba
ENV MYSQL_PASSWORD=123456
ENV MYSQL_DATABASE=Universidad

# Run the following commands to create the new user and grant them the necessary permissions
RUN mysql -u root -p -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
RUN mysql -u root -p -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';"
RUN mysql -u root -p -e "FLUSH PRIVILEGES;"

# Expose port 3306 to allow connections to the database
EXPOSE 3306

# Set up the user environment

ENV NB_USER saguileran
ENV NB_UID 1000
ENV HOME /home/$NB_USER

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid $NB_UID \
    $NB_USER

# COPY . $HOME
# RUN chown -R $NB_UID $HOME

# USER $NB_USER

# # Launch the notebook server
# WORKDIR $HOME
CMD ["mysqld"]
CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser"]