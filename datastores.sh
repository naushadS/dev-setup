#!/usr/bin/env bash

#Installing datastores

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#repo's root path
repoWorkingDirectory=$(pwd)

####################################### REDIS #######################################

read -p "Install Redis? " -n 1;
echo "";

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "";
    echo "#######################################################";
    echo "### Redis                                           ###";
    echo "#######################################################";
    echo "";
    
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Installing Redis<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
    
    
    #Since we won't need to keep the source code that we'll compile long term (we can always re-download it), we will build in the /tmp directory. Let's move there now:
    cd /tmp
    
    #Now, download the latest stable version of Redis. This is always available at a stable download URL:
    curl -O http://download.redis.io/redis-stable.tar.gz
    
    #Unpack the tarball by typing:
    tar xzvf redis-stable.tar.gz
    
    #Move into the Redis source directory structure that was just extracted:
    cd redis-stable
    
    #Build and Install Redis
    #Now, we can compile the Redis binaries by typing:
    make
    
    #After the binaries are compiled, run the test suite to make sure everything was built correctly. You can do this by typing:
    make test
    
    #This will typically take a few minutes to run. Once it is complete, you can install the binaries onto the system by typing:
    sudo make install
    
    echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Configuring Redis<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<";
    
    
    #Now that Redis is installed, we can begin to configure it.
    
    #To start off, we need to create a configuration directory. We will use the conventional /etc/redis directory, which can be created by typing:
    sudo mkdir /etc/redis
    
    #Now, copy over the sample Redis configuration file included in the Redis source archive:
    sudo cp /tmp/redis-stable/redis.conf /etc/redis
    
    #Since we are running an operating system that uses the systemd init system, we can change this to systemd
    sudo sed -i 's/^supervised no/supervised systemd/g' /etc/redis/redis.conf
    
    #Next, find the dir directory. This option specifies the directory that Redis will use to dump persistent data. We need to pick a location that Redis will have write permission and that isn't viewable by normal users.
    sudo sed -i 's/^dir.*/dir \/var\/lib\/redis/g' /etc/redis/redis.conf
    
    #Next, we can create a systemd unit file so that the init system can manage the Redis process.
sudo sh -c "cat >/etc/systemd/system/test.t" <<EOL
[Unit]
Description=Redis In-Memory Data Store
After=network.target

[Service]
User=redis
Group=redis
ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
ExecStop=/usr/local/bin/redis-cli shutdown
Restart=always

[Install]
WantedBy=multi-user.target
EOL
    
    # Create the Redis User, Group and Directories
    #Now, we just have to create the user, group, and directory that we referenced in the previous two files.
    #Begin by creating the redis user and group. This can be done in a single command by typing:
    sudo adduser --system --group --no-create-home redis
    
    # Now, we can create the /var/lib/redis directory by typing:
    sudo mkdir /var/lib/redis
    
    # We should give the redis user and group ownership over this directory:
    sudo chown redis:redis /var/lib/redis
    
    # Adjust the permissions so that regular users cannot access this location:
    sudo chmod 770 /var/lib/redis
    
    #Start the Redis Service
    sudo systemctl start redis
    
    #Check that the service had no errors by running:
    sudo systemctl status redis

    #Enable Redis to Start at Boot
    sudo systemctl enable redis
    
    echo "";
    
    ###########################################FINISHING STEPS####################################
    
    #restore current working directory to repo's root path
    cd ${repoWorkingDirectory}
    
fi