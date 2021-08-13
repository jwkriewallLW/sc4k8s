function menu {
	echo ""
	echo "[1] Install Splunk Connect"
	echo "[2] Exit"

	read -p "Please select an option : " option

}


function input {
	echo "Please have the following pieces of information available: "
	echo "Host IP Address, port, token, index name, & cluster name"

	if [ -z "${type}=1"]
	then 
		curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
		chmod 700 get_helm.sh
		./get_helm.sh

		helm repo add splunk https://splunk.github.io/splunk-connect-for-kubernetes/

		helm show values splunk/splunk-connect-for-kubernetes > values.yaml

		echo " "
		echo "Helm repo added. Please modify the values.yaml file."

	else 
		end_script=1
		exit 0
	fi
}

end_script=0
while [ "${end_script}" != 1 ];do
    menu
    current_stage=${option}
    case ${option} in
        1)
            input
        ;;

        2) 
            start
        ;;

        3) 
            terminate
            exit 0
        ;;

        4)  
            catme
        ;;

        *)
            echo "unknown usage!"
        ;;
    esac



