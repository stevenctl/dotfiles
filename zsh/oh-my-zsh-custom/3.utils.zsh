

# For some reason, sometimes this is needed to make KinD work
ufw-stop () {
        sudo ufw disable
        sudo iptables-save | grep '^\-A' | grep ufw | cut -c 4- | xargs -r -L 1 sudo iptables -D
        sudo iptables-save | grep ^:ufw | cut -c 2- | cut -d' ' -f1 | xargs -r -L1 sudo iptables -X
        sudo sysctl -w net.bridge.bridge-nf-call-iptables=0
        sudo sysctl net.ipv4.conf.all.forwarding=1
        sudo sysctl net.ipv6.conf.all.forwarding=1
        sudo iptables -P FORWARD ACCEPT
        sudo update-alternatives --set iptables /usr/sbin/iptables-legacy
        sudo update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy
}

docker_cleanup() {
  docker ps -a | grep Exited | tr -s ' ' | cut -d ' ' -f1 | xargs -n1 docker rm -f
  docker ps -a | grep Created | tr -s ' ' | cut -d ' ' -f1 | xargs -n1 docker rm -f
  docker images | grep 'none' | tr -s ' ' | cut -d' ' -f3 | xargs -n1 docker image rm
}

