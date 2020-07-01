# Docker Compose for Cuerre
## Author
Hello, developer!

I am Alby Hernández (alias @achetronic) and have done several projects for the cloud in my life. Hope you like it.

There is a good article (not mine) explaining some principles about containers: https://developers.redhat.com/blog/2016/02/24/10-things-to-avoid-in-docker-containers/

## Bugs
If you find some bug or something that can be improved, please, feel free to contact me at me@achetronic.com

## Using this tool
### Services integrated
* PHP + Laravel backend server
* Nginx frontend server

### Working
Just one command to dominate them all. Git Clone this project, go to the main folder (where docker-compose.yaml is)
and type the following:
```
docker-compose up -d
```

### Results
* Laravel working, configured with ENV vars and listening, internally, on port 9000. Exposed on port 80 by Nginx

## How to work and save the results
This is a tool made to demonstrate the ease of working with Docker and Laravel together. 
But it can be very useful for developing purposes, so there are several ways to make an app 
using this:
1.- Attaching your machine to the container
```
* docker ps
* docker attach backend
```
    
2.- Making changes directly on the real binded folder
```
* cd /var/lib/docker/volumes/backend/_data/
```

