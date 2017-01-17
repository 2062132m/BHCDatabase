# BHCDatabase

"The following presentation presents a case study of building a database for the public health program "Building Healthy Communities". By the expression "case study" we mean the investigation of a person, group of people or a situation. The following report investigates the situation of creating a database. The team that is involved in this case study is "Team N" which consists of six, third year colleagues studying Computing Science in the University of Glasgow."

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

    rails db:create
    rails db:migrate
    (can instead run rails db:setup which will migrate but also populate the db with the 4 initial areas and 6 user accounts for each developer. Email: forename@forename.com. Password: forename123).
    rails start
    
Following the link provided you will come to our web app! Please don't look directly at the bugs.
        