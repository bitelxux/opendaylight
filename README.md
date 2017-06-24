# opendaylight

1- The repo does not contain the OpenDayLight distribution.
You have to download it from

https://nexus.opendaylight.org/content/repositories/public/org/opendaylight/integration/distribution-karaf/0.6.0-Carbon/distribution-karaf-0.6.0-Carbon.tar.gz

to the same directory you are building the image.

2- Build the image

```
sudo docker build -t=opendaylight .
```

3- Deploy the instances

```
sh deploy.sh
```

4- To delete the instances

```
sh delete_deployment.sh
```
