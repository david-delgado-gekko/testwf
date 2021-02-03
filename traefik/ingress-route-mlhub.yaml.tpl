apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: "ingress-route-mlhub"
  namespace: "{{namespace}}"
spec:
  routes:
    - match: "Host(`mlhub-{{namespace}}.common-env.owkin.tech`)"
      kind: Rule
      services:
        - name: "proxy-public"
          namespace: {{namespace}}
          port: 80
  tls:
    certResolver: default
    options:
      name: mytlsoption
      namespace: default
