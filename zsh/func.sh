glog(){
  git log ${1:-$(git rev-parse --abbrev-ref HEAD)} --decorate --oneline --graph
}

gitex(){
  GitExtensions.exe browse --path ${1:-'\\wsl.localhost\Manjaro\'$(pwd)}
  exit
}
