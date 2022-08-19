function orca {
  if [ -z $1 ]; then
    cd ~/code/orca
  else
    if [ $1 = "local" ]; then
      echo "=> local orca"
      php ~/code/orca/artisan tinker
    else
      pod=$(kubectl -n orca get pods -o custom-columns=NAME:.metadata.name | grep "orca-$1-workers" | head -n1)
      echo "=> $pod"
      kubectl -n orca -it exec $pod -- php artisan tinker
    fi
  fi
}

function pod-sh {
  choice=$(kubectl get pods -A -o custom-columns=NS:.metadata.namespace,NAME:.metadata.name | fzf)
  ns=$(echo $choice | awk '{print $1}')
  pod=$(echo $choice | awk '{print $2}')
  echo "=> $pod"
  kubectl -n $ns -it exec $pod -- /bin/sh
}
