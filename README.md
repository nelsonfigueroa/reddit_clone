# Forum

A Ruby on Rails application inspired by Reddit. Created to showcase my development abilities. A Dockerfile is included to make development and previewing more easy.

To preview yourself using docker:

Build the image

```sh
docker build . -t forum
```

Then run the image specifying port 3000

```sh
docker run -p 3000:3000 forum
```

Then browse to `localhost:3000` in your browser.
