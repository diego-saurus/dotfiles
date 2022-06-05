glog(){
  git log ${1:-$(git rev-parse --abbrev-ref HEAD)} --decorate --oneline --graph
}
