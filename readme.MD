# Jekyll Docker Container

An optimized [jekyll]("http://jekyllrb.com") docker image for building containers for managing [Github Pages]("https://pages.github.com") 

## Usage - Simple (using **docker-compose**) 

Edit the `docker-compose.yml` file to replace my jekyll site directory with yours:

From:

```yml
volumes:
    - ../etelej.github.io:/code
```

To:

```yml
volumes:
    - /path/to/your/jekyllsite:/code
```

Run docker-compose:

```bash
docker-compose run --rm jekyll/container
```


## Usage - Advanced (working with image)
Building a your custom image from the Dockerfile (with any prefered tag)

```bash
docker build -t yourname/yourjekyll:yourtag . 
```

Or simply pull my image (`docker pull etelej/jekyll:latest`)


Running a **container** from the image
   - **Map** your githubpages to a volume in the localcontainer. (Note: Your Gemfile and Gemfile.lock 
   should be included in the files). Copying the directory instead of mapping a volume will not work
   as the webserver will require to rebuild files to the directory.

```bash
docker run --rm -it -name mycontainer -p 4000:4000 -v /path/to/githubpages:/volume/in/container etelej/jekyll bash
```

### Manually starting the webserver

1. Navigate to the volume mounted and work on project
2. To launch the Jekyll web server on port 4000

```bash
# Change in to the mounted directory
cd /volume/in/container
# Run web  server
bundle exec jekyll serve
```