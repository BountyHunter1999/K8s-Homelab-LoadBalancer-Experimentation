# Metallb

## "Problem"

- Using Metallb as load balancer for the whoami application.
- With just the configuration from manifests, we get something like this:

```bash
NAME                          TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
kubernetes                    ClusterIP      10.96.0.1      <none>        443/TCP        19d
whoami-loadbalancer-metallb   LoadBalancer   10.96.88.156   <pending>     80:30763/TCP   7s
```

## Adding Metallb to the cluster

- `kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.8/config/manifests/metallb-native.yaml`

### Configure IP Address Pool for MetalLB to use

```yaml
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: metallb-ip-pool
  namespace: metallb-system
spec:
  addresses:
    # https://metallb.io/configuration/#defining-the-ips-to-assign-to-the-load-balancer-services
    - 10.0.50.64/28
    - 172.19.216.44/20
```

### Configure L2Advertisement for MetalLB to use

````yaml
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: metallb-l2-advertisement
  namespace: metallb-system
spec:
  ipAddressPools:
    - metallb-ip-pool
```



## After Adding Metallb to the cluster

Output:
```bash
NAME                          TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE
kubernetes                    ClusterIP      10.96.0.1      <none>        443/TCP        19d
whoami-loadbalancer-metallb   LoadBalancer   10.96.88.156   10.0.50.64    80:30763/TCP   7m7s
````
