# GMLOAD names

Normally, .gmload files preload assets from URLs, and whenever the URL is referenced in the page, it defaults to the preloaded asset.

    // .gmload
    {
        https://example.com/banner-image
    }
<!-- separator -->
    // .gml
    ...
        // Defaults to preloaded asset
        banner {https://example.com/banner-image}
    ...


For convenience, you can name assets via this syntax:

    // .gmload
    {
        banner: https://example.com/banner-image
    }

This both reduces needed characters and makes the usage of assets more clear to anyone reading the file.

As an additional benefit, changing the path to a resource becomes much easier, especially if that resource is used multiple times in the page;

Changing this:

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

Into this:

    // .gmload
    {
        // We simply must change this to point to a new URL and all buttons using this name update
        button-image: https://example.com/button-image
    }

Names also allow for dynamic replacement of default assets with larger files; naming two fields the same name will cause the later-loading field to replace the earlier-loading field.

    // This loads first, and quickly
    font: https://example.com/basic-tiny-font-file

    // This loads later and becomes the new value of the 'font' name
    font: https://example.com/large-advanced-font-file

Naturally, when a name has its value replaced, it affects everything that uses that name.

Names are always optional, except in the case of parenthesis blocks, which must have a name applied to them.

Names aren't affected by nesting; all that matters is the order things load in.

A few names have important meanings in GML. Any GML browser should supply defaults for these two names (as for the ```source``` field, supplying a default page may cause flicker, the browser is allowed to do whatever as long as it supplies an explanation for when a user specifies no source at all, as opposed to not supplying one immediately):

- ```source``` (for the page source; the default can be a basic "no-content-loaded: file)
- ```font``` (browser- or user-agent- specified default font)

The source field defines the GML file that will be embedded at the top level, in the browser window. You can load other GML files, too! This one is just the 'main' one, in a sense.

The ```font``` field defines the default font. Every piece of text on your page will, by default, have its font style set to the name 'font', which references this field. You can load other fonts, too, and set the font style for different pieces of text in your page to different fonts. This is just the default font-name.