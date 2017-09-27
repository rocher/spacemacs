(setq url-proxy-services
      '(("http" . "proxy.indra.es:8080")
        ("https" . "proxy.indra.es:8080")))
(setenv "no_proxy" "localhost,.indra.es")
