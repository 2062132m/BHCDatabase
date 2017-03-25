# BHCDatabase

[![build status](http://localhost:8080/DaBrown95/BHCDatabase/badges/master/build.svg)](http://localhost:8080/DaBrown95/BHCDatabase/commits/master)

To access our GitLab from a machine other than the lab machines, you should configure your .ssh/config file to look something like this,

    Host sibu
        HostName sibu.dcs.gla.ac.uk
        User {INSERT YOUR USERNAME ex. 12345678a}
        LocalForward 8080 130.209.251.105:80
        LocalForward 8081 130.209.251.105:81
        
You can obviously change the ports to suit your personal requirements. If you followed the config above, when you access localhost:8080 you will arrive at our GitLab. If you go to localhost:8081, you will arrive at the live, production, version of our website.

To allow Git access, add something like this to your config file,

    Host lucky13
            HostName 130.209.251.105
            User {YOUR USERNAME ON LUCKY13 SERVER}
            ProxyCommand ssh {INSERT YOUR USERNAME ex. 12345678a}@sibu nc %h %p
            
Once your conifg is configured, cloning the repo will be as simple as running the command,

    git clone git@lucky13:DaBrown95/BHCDatabase.git
            
Once you have the source cloned, you can set up the app by running...

    bundle install --without production
    rails db:steup
    rails server
    
