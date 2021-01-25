auth-google:
	gcloud auth login ; \
    gcloud auth application-default login
ssh-bastion:
	gcloud compute start-iap-tunnel bastion 8118 --local-host-port="localhost:8118" --project census-ci --zone europe-west2-a\n

set-pipline:
 	set-global echo HTTPS_PROXY="localhost:8118" fly login -t eq-dev -c "https://$${consourcestring}" -n eq-dev 

set-global:
	export consourcestring=concourse.census-gcp.onsdigital.uk

test-var:
	echo "https://$${consourcestring}"