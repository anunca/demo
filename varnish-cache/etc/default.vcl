vcl 4.0;

backend apache {
  .host = "apache:80";
}

backend nginx {
  .host = "nginx:80";
}

sub vcl_recv {
    if (req.http.host ~ "apache.local") {
        set req.backend_hint = apache;
    } elsif (req.http.host ~ "nginx.local") {
        set req.backend_hint = nginx;
    }
}