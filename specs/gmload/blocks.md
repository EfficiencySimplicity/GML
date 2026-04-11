# GMLOAD blocks

Blocks in GMLOAD files define the loading pattern of a set of URLs.

GMLOAD supports three different types of blocks.

### Brace blocks

Brace blocks load the URLs asynchronously, and once all the files are loaded, it, in one tick, activates them in order, one after the other.

```
{
    // This is a brace block
    https://example.com/a    // This will be activated first
    b: https://example.com/b // This second
    https://example.com/c    // This third
}
```

### Bracket blocks

Bracket blocks load the URLs asynchronously, activating each file instantly once it loads.

```
[
    // This is a bracket block
    https://example.com/a     // This is a big file and loads / activates third
    b: https://example.com/b  // This is tiny and loads / activates first
    https://example.com/c     // This is medium-sized and loads / activates second

]
```

### Parenthesis blocks

Parenthesis blocks load the URLs asynchronously, resolving to whichever loads first.

```
profile-image: (
    // This is a parenthesis block
    https://example.com/16-by-16-image
    https://example.com/32-by-32-image
    https://example.com/64-by-64-image
)
```

Parenthesis blocks are slightly different than the other two as they cannot contain named fields within themselves, and must themselves be named.