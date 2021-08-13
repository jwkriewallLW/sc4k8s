
	echo ""
	echo "[1] Install Splunk Connect"
	echo "[2] Exit"
	echo ""
	read option

	if "$option"="1"
	then 

	echo "Please have the following pieces of information available: "
        echo "Host IP Address, port, token, index name, & cluster name"
	echo ""

		curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
		chmod 700 get_helm.sh
		./get_helm.sh

		helm repo add splunk https://splunk.github.io/splunk-connect-for-kubernetes/

		helm show values splunk/splunk-connect-for-kubernetes > values.yaml

		echo " "
		echo "Helm repo added. Please modify the values.yaml file."

	else 
		
		echo "Please try again."
		exit 0
	fi


