## Elements

A GML element consists of a name, attributes, and a set of braces:

    name (attr attr(arg arg) attr attr(arg arg arg)) {
        "Content goes here"//Yes it does
    }

Contrary to HTML, GML elements can have any name, there are no special reserved names to do special reserved things:

    body {}
    ...
    OOGABOOGADOOGAAAAABOO {}
    ...
    main-canvas {}

The reason for this is for simplicity; only the very basic functionality is built into GML; instead, the GML suite is used to supply its own functionality via attributes, scripts, and shaders.

GML elements can either contain other GML elements:

    card-content {
        title {...}
        link-to-site {...}
    }

or alternatively contain content of the various types:

1. A string
    ```
    title {"Hello, World"}
    ```
    
2. A URL pointing to an asset
    ```
    banner-image {https://example.com/banner-image}
    ```
    Various types of assets include:
    - Images
    - Text files
    - Markdown files
    - .gmload files (for embeds)
    - .gml files (as components, oooooooh)

    In the end, it is the browser's job to support the different types of asset files in its implementation of GML; For example, one browser may choose to use an extension marketplace to download dynamic asset displayers such as YAML, TIFF, JSON, etc.

The whole GML file must always be wrapped in a global block, named whatever. This makes it easier for componentalization later, and also helps tie all the elements together in a neat li'l wrapper:

    // .gml

    // This block contains all the internals, and can function as a recording-booth component later
    recording-booth {
        screen {...}
        button-holder {
            rewind-button {...}
            play-button {...}
            fastforward-button {...}
        }
    }