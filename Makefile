create-cluster:
	kind create cluster --name kind --config cluster/cluster.yaml

get-network:
	docker network inspect kind | grep Subnet
