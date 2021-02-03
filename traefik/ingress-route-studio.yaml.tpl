apiVersion: traefik.containo.us/v1alpha1
kind: IngressRoute
metadata:
  name: "ingress-route-studio"
  namespace: "{{namespace}}"
spec:
  routes:
    - match: "Host(`studio-{{namespace}}.common-env.owkin.tech`)"
      kind: Rule
      services:
        - name: "kong"
          namespace: {{namespace}}
          port: 80
  tls:
    certResolver: default
    options:
      name: mytlsoption
      namespace: default
