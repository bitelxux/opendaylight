# opendaylight

Deployes an OpenDayLight base on Docker

To show help:

```
make help
```

To create the Docker image and deploy the cluster:

```
make all
```

To login into the servers:

```
sudo docker exec -it <server> bash
```

To login into ODL console:

```
ssh -p 8101 karaf@<server>
```

password: `karaf`

To access to DLUX interface:

```
http://<server>:8181/index.html
```


