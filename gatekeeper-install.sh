# helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
# helm repo update
# helm install gatekeeper gatekeeper/gatekeeper --namespace gatekeeper-system --create-namespace
# kubectl get pods -n gatekeeper-system
kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml