# Markdown Maths

Experimenting how to convert markdown files with inline and block equations to HTML.

## Convert Markdown

```
make run
```

> This assumes the `eunice-data` repo is checked out at `../eunice-data`

This creates a `docs` directory tree of HTML files, suitable for serving via GitHub Pages.

## Warning

Do not call the source directory `src` (even though that's the default expected by `mpx`). If the source directory is named `src` zero files will be written to the destination directory. The same source directory renamed to `source` works fine.

I have no idea why this happens.

## Run HTTP server

```
cd html
npx static-server
```

The rendered HTML can now be viewed at `http://buildvm.spikesolution.com:9080`

## TODO

- [ ] Using build seems to have broken the footnotes :(
- [ ] Create a github pages site
- [ ] Build a workflow to auto-publish documentation changes
