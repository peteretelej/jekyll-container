# Jekyll Docker Container

An optimized [jekyll]("http://jekyllrb.com") docker image ([etelej/jekyll](https://hub.docker.com/r/etelej/jekyll/)) for building Jekyll containers. Helpful in manually developing [Github Pages]("https://pages.github.com") without much overhead or having to install Jekyll's multiple depencies.  

## Creating the Jekyll container: 

Run this command from within your githubpages directory. Your githubpages **Gemfile** should be in the directory as it is required by the bundler.

```bash
docker run --rm -it -p 4000:4000 -v "$PWD":/app -w /app etelej/jekyll bundle exec jekyll serve
```

This creates a disposable container (`--rm`), emulates an interactive terminal (`-it`), forwards host's port 4000 to container's port 4000 (`-p 4000:4000 `), maps working directory on host to a read-write volume in container (`-v "$PWD":/app`), sets the mapped volume as the working directory (`-w /app`), creates container from the docker [image](https://hub.docker.com/r/etelej/jekyll/) (`etelej/jekyll`) and starts the jekyll server as the main docker process (`bundle exec jekyll serve`).


## Method 2: Compose Usage (using **docker-compose**) 

To use `docker-compose` via the repo's `docker-compose.yml`, edit the `docker-compose.yml` file to replace my jekyll site directory with yours (absolute path preferable):

From:

```yml
volumes:
    - /home/chief/workspaces/github.com/etelej.github.io:/code
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


