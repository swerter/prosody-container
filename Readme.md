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

## Very short intro to prosody
Prosody is a jabber server. For the configuration, see [here](https://prosody.im/doc/configure). In short it boils down to 1) add a host (and its certificates) and 2) add users.

### Add a host
For testing you can use the commands that are provided by `prosodyctl`:

    prosodyctl cert generate example.com

### Add users

Per default there are two users added to the docker container (see folder accounts where you find alice.dat and bob.dat) both with the password `abc`. If you want additional users you can for example run

    prosodyctl adduser john@example.com

and add the password twice.

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
