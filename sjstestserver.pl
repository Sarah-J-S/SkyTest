#!/usr/bin/perl
#
#   SJSTestServer.pl
#
#   Bare bones http server as an example for Sky TV
#
#   Author:   Sarah Skelding
#   Version:  0001
#   Date:     2001-01-15
#

{
package SJSTestServer;

use HTTP::Server::Simple::CGI;
use base qw(HTTP::Server::Simple::CGI);

my %dispatch = (
    '/hello' => \&resp_hello,
    # ...
);

sub handle_request {
    my $self = shift;
    my $cgi  = shift;

    my $path = $cgi->path_info();
    my $handler = $dispatch{$path};

    if (ref($handler) eq "CODE") {
        print "HTTP/1.0 200 OK\r\n";
        $handler->($cgi);
        } 
    else {
        print "HTTP/1.0 404 Not found\r\n";
        print $cgi->header,
              $cgi->start_html('Not found'),
              $cgi->h1('Not found'),
              $cgi->end_html;
        }
    }

sub resp_hello {
    my $cgi  = shift;   # CGI.pm object
    return if !ref $cgi;
 
    my $who = $cgi->param('name');

    print $cgi->header,
          $cgi->start_html("Hello");

    if ( $who eq "" ) {
        # Get the name to be printed

        print $cgi->start_form(-method=>'get',
                -action=>'/hello');

        print $cgi->textfield(-name=>'name',
                            -default=>$who,
                            -override=>1,
                            -size=>50,
                            -maxlength=>80);

        print $cgi->p;
        print $cgi->submit('submit','Send me your name');
        print $cgi->end_form;
        }
    else
        {
        # Print the name supplied

        print $cgi->h1("Hello $who!");
        };
   
    print $cgi->end_html;    
    }
 
} 

# start the server on port 8080
my $pid = SJSTestServer->new(8080)->background();
print "Use 'kill $pid' to stop server.\n";

#
#    End SJSTestServer.pl
#

