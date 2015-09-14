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
Running a **container** from the image
   - **Map** your githubpages to a volume in the localcontainer. (Note: Your Gemfile and Gemfile.lock should be included in the files). Mounting as *read-only will not work* as the webserver will require to rebuild files to the directory

   - Run this command from within your project directory

```bash
docker run --rm -it -p 4000:4000 -w /jekyll-app -v "$PWD":/jekyll-app etelej/jekyll bundle exec jekyll serve
```