# GMLOAD syntax

.gmload files are plain-text files that specify the loading of assets for a Web page. The syntax lets you control the order of loading and activation of assets, along with preloading assets and dynamic replacement of assets with different ones as the page loads. 

.gmload files consist of definition statements and blocks of definition statements. Blocks and statements load from the top-down, synchronously. Blocks define different loading patterns within them.

## Blocks

Blocks in .gmload files define the loading pattern of a set of URLs.

.gmload files support three different types of blocks.

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

## Naming

Normally, .gmload files preload assets from URLs, and whenever the URL is referenced in the page, it defaults to the preloaded asset.

```
// .gmload
{
    https://example.com/banner-image
}

```
```
// .gml
...
    // Defaults to preloaded asset
    banner {https://example.com/banner-image}
...
```

For convenience, you can name assets via this syntax:

```
// .gmload
{
    banner: https://example.com/banner-image
}
```

This both reduces needed characters and makes the usage of assets more clear to anyone reading the file.

As an additional benefit, changing the path to a resource becomes much easier, especially if that resource is used multiple times in the page;

Changing this:

```
// .gml
...
    // We will need to change this path
    button {https://example.com/button-image}
...
    // And this one, 1000 lines down,
    button {https://example.com/button-image}
...
    // And this one, TREE(3) (an impossibly large number) lines down:
    button {https://example.com/button-image}
...
```

Into this:

```
// .gmload
{
    // We simply must change this to point to a new URL and all buttons using this name update
    button-image: https://example.com/button-image
}
```

Note that the best way to do this in HTML is to either use autofill or, if you own the domain, make the URL point to the new image, but that may result in a naming discrepancy between the URL and what it actually points too, for example ```https://example.com/blue-button``` being changed to point to a red button (although that is pretty much your fault hard-coding the button's color into the URL, better to have it greyscale and change the color via styles)

Names also allow for dynamic replacement of default assets with larger files; naming two fields the same name will cause the later-loading field to replace the earlier-loading field.

```
// .gmload
{
    // This loads first, and quickly
    font: https://example.com/basic-tiny-font-file
}
...
{
    // This loads later and becomes the new value of the 'font' name
    font: https://example.com/large-advanced-font-file
}
```

Names are always optional, except in the case of parenthesis blocks, which must have a name applied to them

Names aren't affected by nesting; all that matters is the order things load in.

Full example of a .gmload file:

```
// We load a loading page first
https://example.com/loading-page

// This block loads second
{
    // We here load some basic assets
    https://example.com/page-source
    style: https://example.com/basic-style
    font: https://example.com/basic-font
}

// Third, we load whatever localized profile image is faster
profile-image: (
    https://example.com.uk/profile-image
    https://example.com.us/profile-image
    https://example.com.ch/profile-image
)

// Finally, we load a better font and style
[
    // These fields replace the old font and style fields
    font: https://example.com/better-font
    style: https://example.com/better-style
]
```