for i in 1 2 3;
do
  sudo docker run -h server-0${i} --name server-0${i} --net 10.100.100.0 --ip 10.100.100.10${i} --add-host dockerhost:10.100.100.1 -itd \
                  --security-opt seccomp=unconfined --cap-add=SYS_ADMIN -e "container=docker" -v /sys/fs/cgroup:/sys/fs/cgroup \
                  --privileged opendaylight_${i} bash -c "/usr/sbin/init"
done;
