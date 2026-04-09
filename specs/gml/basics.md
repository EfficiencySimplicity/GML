# GML syntax

GML stands for Grid Markup Language. It represents the standard HTML box model as a series of grids, each object specifying the shape and number of its cells. Looking at [almost](https://www.amazon.com/) [any](https://proton.me/) [Web](https://louisvillezoo.org/) [site](https://www.drivecomic.com/), you can probably find a dividing line or series of dividing lines (either explicit or implied) going from one side of the screen to another, dividing it into two or more parts. This continues recursively down into individual elements, with the exception of absolutely-positioned elements, which probably, though, follow this grid model internally themselves.

GML (as opposed to HTML which was designed text-first) is intended to support UI layout as a base feature, with hopefully equally extensive support for text layout, all with a clean and intuitive design.

GML syntax goes like this:

```
body {

}

```


## Elements

A GML element consists of a name and a set of braces. Contrary to HTML, GML elements can have any name:

```
body {}
...
OOGABOOGADOOGAAAAABOO {}
...
main-canvas {}
```

It is recommended that names be capitalized in the kebab-case format.

GML elements can either contain other GML elements:

```
card-content {
    title {}
    link-to-site {}
}
```

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

## Attributes

Attributes are used both for indexing the element and applying styles to it using GATTR.

Elements can have any number of attributes, and the attributes are applied in the order they are written in.

GML elements can be given attributes via this syntax:

```
...
title-card (half-size border-color(grey) card) {...}
...
```

Attributes can either be basic words or take in any number of arguments. It is unsure as of yet the style of these arguments, be they numbers or strings, and this is probably the only place you'll see this notice.

```
...
// a basic no-argument attribute
title (blue-background) {...}
...
// a 1-argument attribute
element (link("https://example.com")) {...}
...
```