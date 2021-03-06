poddeploy=$(oc get pods | grep mapit-deploy-pipelinerun | cut -d " " -f 1)
echo $poddeploy
containersourcecopy=$(oc get pod ${poddeploy} -o jsonpath='{.spec.containers[*].name}'|  cut -d " " -f 5)
echo $containersourcecopy
oc set  volume pod/${poddeploy} --add --name=camelsap --claim-name=sapdata --type pvc --claim-size=1G --mount-path /workspace
oc rsync /root/podmancamelsap/podmancamelsap ${poddeploy}:/workspace -c $containersourcecopy

#oc logs mapit-build-pipelinerun-fszzj-build-app-q9kfg-pod-a35205 -c step-build

#oc rsh -c step-source-copy-mapit-git-sp4b4 pod/mapit-deploy-pipelinerun-zq7z8-build-app-cjx2v-pod-f02535
#oc rsync /root/podmancamelsap/podmancamelsap pod/mapit-deploy-pipelinerun-zq7z8-build-app-cjx2v-pod-f02535:/workspace -c step-source-copy-mapit-git-sp4b4

# oc rsync /root/podmancamelsap/podmancamelsap pod/mapit-deploy-pipelinerun-zq7z8-build-app-cjx2v-pod-f02535:/workspace -c step-source-copy-mapit-git-sp4b4
#WARNING: cannot use rsync: rsync not available in container
#podmancamelsap/.containerenv
#podmancamelsap/SAPConnectionInfo.jcoDestination
#podmancamelsap/camelsapdemo-0.0.1-SNAPSHOT.jar
#podmancamelsap/conversion.xml
#podmancamelsap/libsapjco3.so
#podmancamelsap/sapidoc3.jar
#podmancamelsap/sapjco3.jar
