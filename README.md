# Markdown Maths

THIS WAS ALL WORKING FINE, THEN SUDDENLY IT ALL WENT WRONG:

```
digitalronin/markdown-maths npx mpx build --input src --output docs
Created new directory at src/.mpx containing config and layouts
Converting src to docs
Wrote 0 files in 0.27 seconds
make[1]: Leaving directory '/home/david/markdown-maths'
```

I HAVE NO IDEA WHY IT STOPPED WRITING ANY FILES.
------------------------------------------------------------

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
