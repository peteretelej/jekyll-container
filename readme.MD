# Jekyll Docker Container

A [jekyll]("http://jekyllrb.com") docker container for [Github Pages]("https://pages.github.com")


## Usage
Building an image from the Dockerfile (with prefered tag)

```bash
docker build -t etelej/jekyll . 
```

Running a **container** from the image
   - Map your githubpages to a volume in the localcontainer. (Note: Your Gemfile and Gemfile.lock 
   should be included in the files)

```bash
docker run --rm -it -name mycontainer -p 4000:4000 -v /path/to/githubpages:/volume/in/container etelej/jekyll bash
```

## Working on your github pages

- Navigate to the volume mounted and work on project.
- To launch the Jekyll web server on port 4000

```bash
#Inside the container and inside mapped githubpages directory
bundle exec jekyll serve
```