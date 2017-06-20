for i in 1 2 3;
do
  sudo docker rm -f server-0${i}
done;
