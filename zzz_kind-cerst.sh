# Get the name of the kind control plane container
KIND_CONTAINER=$(docker ps --filter name=kind-control-plane --format "{{.Names}}")

# Copy the certificates from the kind container to the host
docker cp $KIND_CONTAINER:/etc/kubernetes/pki/apiserver.crt .
docker cp $KIND_CONTAINER:/etc/kubernetes/pki/apiserver.key .

APISERVER_CRT=$(cat apiserver.crt | base64 | tr -d '\n')
APISERVER_KEY=$(cat apiserver.key | base64 | tr -d '\n')

kubectl delete secret gatekeeper-webhook-server-cert -n gatekeeper-system

kubectl create secret tls gatekeeper-webhook-server-cert \
    --cert=apiserver.crt \
    --key=apiserver.key \
    --namespace=gatekeeper-system \
    --dry-run=client -o yaml | kubectl apply -f -

kubectl edit validatingwebhookconfigurations.admissionregistration.k8s.io gatekeeper-validating-webhook-configuration

kubectl delete pods -n gatekeeper-system -l control-plane=controller-manager


openssl req -x509 -newkey rsa:2048 -keyout gatekeeper.key -out gatekeeper.crt -days 365 -nodes -subj "/CN=gatekeeper-webhook-service.gatekeeper-system.svc"

CA_BUNDLE=$(cat gatekeeper.crt | base64 | tr -d '\n')
kubectl patch validatingwebhookconfiguration gatekeeper-validating-webhook-configuration -p "{\"webhooks\":[{\"name\":\"validation.gatekeeper.sh\",\"clientConfig\":{\"caBundle\":\"${CA_BUNDLE}\"}}]}"

