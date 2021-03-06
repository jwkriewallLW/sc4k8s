	echo ""
	echo "[1] Install Helm and Splunk Chart"
	echo "[2] Install Splunk Connect for Kubernetes"
	echo "[3] Exit"
	echo ""
	read option
	if [ $option -eq 2 ];
		then echo "--------------------------------------"
		echo "Would you like to install Splunk Connect?"
		echo "Make sure to update your values.yaml file with host, IP Address, port, HEC token, index name and cluster name."
		echo "Check documentation if you need help."
		echo ""
		echo "[1] Yes, install Splunk Connect for Kubernetes"
		echo "[2] No, exit installation"
		echo ""
		read sc4k8s
			if [ $sc4k8s -eq 1 ];
				then helm install my-splunk-connect -f values.yaml splunk/splunk-connect-for-kubernetes
				echo ""
				echo "------------------------------------------"
				echo "| Splunk Connect Successfully Installed! |"
				echo "------------------------------------------"
				echo ""
				exit 0

			elif [ $sc4k8s -eq 2 ];
				then echo "Splunk Connect for Kubernetes installation has not been completed."
				echo ""
				exit 0
			fi
	elif [ $option -eq 3 ];
		then echo "Exiting installation"
		echo ""
		exit 0
	elif [ $option -eq 1 ];
		then echo "Please have the following pieces of information available: "
        	echo "host, IP Address, port, token, index name, & cluster name"
		echo ""

		curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
		chmod 700 get_helm.sh
		./get_helm.sh

		helm repo add splunk https://splunk.github.io/splunk-connect-for-kubernetes/

		helm show values splunk/splunk-connect-for-kubernetes > values.yaml

		echo ""
		echo "Helm repo added. Please modify the values.yaml file and continue with installation."
		echo ""
		echo "--------------------------------------------------"
		echo "Have you modified the yaml file to include host, IP address, port, HEC token, etc?"
			echo ""
			echo "[1] I have completed the values.yaml file set up."
			echo "[2] I still need to input values to values.yaml."
			echo ""
			read updated
				if [ $updated -eq 2 ];
					then echo "-----------------------------------------"
					echo "Would you like to open the values.yaml file?"
					echo "[1] Yes, let's do it now"
					echo "[2] No, I'll do it later"
					read values
					echo ""
					if [ $values -eq 2 ];
						then echo "Please make sure to edit the values.yaml file before completing installation!"
						exit 0

					elif [ $values -eq 1 ];
						then nano values.yaml
					fi
				elif [ $updated -eq 1 ];
					then echo "--------------------------------------"
					echo "Would you like to install Splunk Connect?"
					echo "Make sure to update your values.yaml file with host, IP Address, port, HEC token, index name and cluster name. Check documentation for more help."
					echo ""
					echo "[1] Yes, install Splunk Connect for Kubernetes"
					echo "[2] No, exit installation"
					echo ""
                			read yn
					echo ""
				if [ $yn -eq 2 ];
					then echo "Splunk Connect for Kubernetes installation has not been completed."
					exit 0
                        	elif [ $yn -eq 1 ];
                        		then helm install my-splunk-connect -f values.yaml splunk/splunk-connect-for-kubernetes
                                	echo ""
					echo "------------------------------------------"
                                	echo "| Splunk Connect Successfully Installed! |"
					echo "------------------------------------------"
                		else
                        		echo "Please try again."
					echo ""
                        		exit 0
        	        fi
		fi
	fi
fi
