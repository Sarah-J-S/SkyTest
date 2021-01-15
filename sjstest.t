#!/usr/bin/perl
#
#   SJSTest.t
#
#   Barest possible test of the bare bones http server
#
#   Get the html for each test case - landing page, root page error case and successful processing
#
#   Author:   Sarah Skelding
#   Version:  0001
#   Date:     2001-01-15
#

print "\n>>>> Get the landing page\n\n";
system "curl -4  http://127.0.0.1:8080/hello";

print "\n\n>>>> Get the root page - failure case\n\n";
system "curl -4  http://127.0.0.1:8080/";

print "\n\n>>>> Supply a name\n\n";
system "curl -4  http://127.0.0.1:8080/hello?name=Sarah";



