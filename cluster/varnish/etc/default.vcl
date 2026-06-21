vcl 4.1;

backend apache {
  .host = "haproxy:80";
}
backend nginx {
  .host = "haproxy:80";
}
backend django {
  .host = "haproxy:80";
}
backend rails {
  .host = "haproxy:80";
}
backend react {
  .host = "haproxy:80";
}
backend default {
  .host = "haproxy";
  .port = "80";
}

sub vcl_recv {
  if (req.method != "GET" && req.method != "HEAD") {
    return (pass);
  }

  if (req.http.host ~ "apache.app.internal") {
    set req.backend_hint = apache;
  } elsif (req.http.host ~ "nginx.app.internal") {
    set req.backend_hint = nginx;
  } elsif (req.http.host ~ "django.app.internal") {
    set req.backend_hint = django;
  } elsif (req.http.host ~ "rails.app.internal") {
    set req.backend_hint = rails;
  } elsif (req.http.host ~ "react.app.internal") {
    set req.backend_hint = react;
  } else {
    return (pass);
  }
}

sub vcl_deliver {
  if (obj.hits > 0) {
    set resp.http.X-Cache = "HIT";
  } else {
    set resp.http.X-Cache = "MISS";
  }
  set resp.http.X-Cache-Hits = obj.hits;
  return (deliver);
}
