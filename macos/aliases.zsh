function reset-vpn-connection {
    if [ "$1" ]; then
        en="$1"
    else
        en="en0"
    fi
    
   echo "resetting $en connection" 

    sudo ifconfig $en down \
        && sudo route flush \
        && sudo ifconfig $en up
}

