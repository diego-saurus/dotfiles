glog(){
  git log ${1:-$(git rev-parse --abbrev-ref HEAD)} --decorate --oneline --graph
}

gitex(){
  GitExtensions.exe browse --path ${1:-'\\wsl.localhost\Manjaro\'$(pwd)}
  exit
}

oc_cimb_login(){
  oc login https://ocp-console.mylab.local:8443 --token=$(curl.exe -v --insecure --user ${1:-'devcimb:dev123'} --header "X-CSRF-Token: xxx" --url "https://ocp-console.mylab.local:8443/oauth/authorize?response_type=token&client_id=openshift-challenging-client" 2>&1 | grep -oP "access_token=\K[^&]*")
}

gitignore(){
  curl https://www.toptal.com/developers/gitignore/api/${1}
}
