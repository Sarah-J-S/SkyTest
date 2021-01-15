# SkyTest
Bare bones http test service

Written as example code for Sky TV.

Written in PERL to be run under Linux.

You will need the simple HTTP server package installed 
    yum install perl-HTTP-Server-Simple

Copy the sjstestserver.pl and sjstest.t files to a suitable directory, then give them execute permissions
    chmod +x sjstestserver.pl sjstest.t
    
Run the module to start the service
    ./sjstestserver.pl
    
Navigate to the service in the browser of your choice
   http://<servername>:8080/hello
    
or run the sjstest.t test script
    ./sjstest.t
  
