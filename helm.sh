curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

helm repo add splunk https://splunk.github.io/splunk-connect-for-kubernetes/

helm show values splunk/splunk-connect-for-kubernetes > values.yaml

echo " "
echo "Helm repo added. Please modify the values.yaml file."
