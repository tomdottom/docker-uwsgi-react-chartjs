# docker-uwsgi-react-chartjs

## Using a virtualenv

To develop using a virtualenv install python and pip and then:

    pip install virtualenv
    virtualenv .venv
    source .venv/bin/activate

Then install and run package:

    pip install -e . 

Then to run the sample app:

    uwsgi --http :9090 --master -w "hello_world.hello_world:application"

And check it works (in another terminal):

     curl http://localhost:9090/
     > Hello World
    
## Using docker
 
### Build and run as an appliance

Build container with:

    docker build -t uwsgi-react-chartjs .

Run container deamon with

    docker run -it -p 9090:9090 uwsgi-react-chartjs

And check it works:

     curl http://localhost:9090/
     > Hello World

Or run container as a deamon with:

    docker run -d -p 9090:9090 uwsgi-react-chartjs

### Run as a developement instance using local files

You can mount your local folder with:

    docker run -it -p 9090:9090 -v $(pwd)/hw:/hello_world  uwsgi-react-chartjs

after which modification to files in the local folder `./hw` will be persisted to the container

To enable uwsgi reloading

    docker run -it -p 9090:9090 -v $(pwd)/hw:/hello_world  uwsgi-react-chartjs ---touch-reload=/tmp/reload

and then run the following to restart the server

    docker exec $(docker ps --filter="ancestor=uwsgi-react-chartjs" --format='{{ .Names }}' -n=1) touch /tmp/reload
