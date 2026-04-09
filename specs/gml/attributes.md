# GML attributes

Attributes are used both for indexing elements and applying styles to it using GATTR.

Elements can have any number of attributes, and the attributes are applied in the order they are written in.

Attributes consist of a name, and some have a set of parenthesis where you can supply required arguments, separated by any amount of whitespace (but there must be *some* whitespace).

Examples of attributes:

- red-background
- elephant-colored
- drop-shadow("45px")
- width-height("20%" "30px")

GML elements are given attributes via this syntax:

    ...
    title-card (half-size border-color(grey) card) {...}
    ...

Here we define 3 attributes:

- A half-size attribute which (allegedly, we'll never know for sure) sizes the title-card to be half the size of its grid cell

- A border-color attribute which takes in a single argument, a string naming the color of the border (well don't that make sense?)

- A card attribute (which I assume helps with indexing and maybe adds a drop shadow too)

Attributes are designed so you won't need a massive list of styles anywhere for a single element; attributes can be abstracted away and used all around in GML and GATTR, simplifying your files quite a lot.