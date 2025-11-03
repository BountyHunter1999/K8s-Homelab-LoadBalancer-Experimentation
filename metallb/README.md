# Metallb

## "Problem"

- Using Metallb as load balancer for the whoami application.
- With just the configuration from manifests, we get something like this:

```bash
NAME                          TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
kubernetes                    ClusterIP      10.96.0.1      <none>        443/TCP        19d
whoami-loadbalancer-metallb   LoadBalancer   10.96.88.156   <pending>     80:30763/TCP   7s
```
