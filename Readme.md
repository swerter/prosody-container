# Prosody Jabber container

A docker container to use [prosody](https://prosody.im/).

## Quickstart

Build the container

    docker build -t swerter/prosody -f Dockerfile .

and run it

    docker run -d \
         --name prosody \
         -p 5222:5222 \
         -p 5269:5269 \
         -p 5281:5281 \
         swerter/prosody


## Production use

For production use you probably want to use a volume for the user accounts and set the container to read-only.

    docker volume create --name prosody-data
    docker run -d \
         --name prosody \
         -p 5222:5222 \
         -p 5269:5269 \
         -p 5281:5281 \
         --read-only \
         --tmpfs=/var/run/prosody:rw,size=787448k,mode=1777,uid=100 \
         -v prosody-data:/var/lib/prosody/ \
         swerter/prosody
