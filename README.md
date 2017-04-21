# octave-docker

## What
octave docker setup to work in my mac os x machine in order to follow the machine learning coursera course


## Prerequisistes

__*This was tested in macOS Sierra 10.12.4*__

### Docker

Figure out how to install [docker](https://docs.docker.com/get-started/) in your system. 

### Socat

`brew install socat`

### XQuartz

`brew cask install xquartz`

## Comands

### Build docker image

In the same directory as the Dockerfile run:

`docker build -t octave .`

### Open XQuartz

After the build run this command:

`open -a XQuartz`

This will open x11 application.

Go to the XQuartz preferences,then select the “Security” tab and enable the option **“Allow connections from network clients”**

![x11 preferences](https://i.imgur.com/KIhXOYB.png)

### Run Socat

Now, in *another* terminal window, run the following command:

`socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"`


### Enable connection

Run the following commands so you can figure out what is the ip that you can connect the docker image with the XQuartz display:

`ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')`

and then

`xhost + $ip`

this will output something like this:

`192.168.25.6 being added to access control list`

grab the ip address and use in the next command
### Run the docker image

Finally, run:

`docker run --rm -it -e DISPLAY=192.168.25.6:0 -v $(pwd):/source octave`


run :

`plot(eye(5))`

and see if a window with the plot appears, if so then everything is probably working fine.



## Credits

The commands are basically from [here](https://fredrikaverpil.github.io/2016/07/31/docker-for-mac-and-gui-applications/)

And the Dockerfile is forked from [here](https://github.com/schickling/dockerfiles/tree/master/octave)

There is also [this](https://www.youtube.com/watch?v=TRmgdda67u0) video



