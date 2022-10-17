# Markdown Maths

Experimenting how to convert markdown files with inline and block equations to HTML.

## Convert Markdown

```
make run
```

> This assumes the `eunice-data` repo is checked out at `../eunice-data`

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
