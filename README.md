# Reddit Clone

[![Github Actions](https://github.com/nelsonfigueroa/reddit_clone/workflows/CI/badge.svg)](https://github.com/nelsonfigueroa/reddit_clone/actions?workflow=CI)

My own take on Reddit. Created to showcase my development abilities. Built on Ruby on Rails. A Dockerfile is included to make development and previewing more easy.

To preview yourself using docker:

Build the image

```sh
docker build . -t reddit
```

Then run the image specifying port 3000

```sh
docker run -p 3000:3000 reddit
```

Then browse to `localhost:3000` in your browser.
