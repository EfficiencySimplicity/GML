# GATTR syntax

GATTR is a powerful multi-purpose attribute language. Its closest counterpart in the HTML canon is CSS, but GATTR is much more powerful, flexible, and simple.

The main source of GATTR's utility is that it is an *attribute* language, as opposed to a *stylesheet*. GATTR is not a language that sets styles of an element, it is a language that attaches *scripts* to *elements*. That distinction opens up a world of possibilities.

The basic syntax of GATTR looks like this:

```
body {
    background-color("blue");
}

(card) {
    drop-shadow("5px");
    border-color("grey");
    background-color("white");
}
```

While CSS represents styles as fields in an element, with more added over time to give developers new features, GATTR completely removes this inertia. What you think of styles in css are represented in GATTR as *scripts* which can set *variables* that are used by *shaders*. You can surely imagine creating a 'shimmer' style, for instance, that controls the shimmer color of the shimmer shader you've attached to every element in your Web page just because you could.

If you've ever checked out [ShaderToy](https://shadertoy.com) you probably know how powerful shaders are. By giving developers such low-level access to the rendering system, GATTR completely removes the need for a standard style system patterned after CSS. Any style you can imagine, you can make.

The benefits don't stop there, though. 



You can call styles within other styles: