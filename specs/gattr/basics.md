# GATTR syntax

GATTR is a powerful multi-purpose attribute language. Its closest counterpart in the HTML canon is CSS, but GATTR is much more powerful, flexible, and simple.

The main source of GATTR's utility is that it is an *attribute* language, as opposed to a *stylesheet*. GATTR is not a language that sets styles of an element, it is a language that attaches *scripts* to *elements*. That distinction opens up a world of possibilities.

The basic syntax of GATTR looks like this:

```
// Any element named 'body' gets this style
body {
    background-color("blue");
}

// Any element with the 'card' attribute gets this style
(card) {
    drop-shadow("5px");
    border-color("grey");
    background-color("white");
}

// This attribute takes in a single argument
(full-color(color)) {
    background-color(color);
    border-color(color);
    text-color(color);
}
```

While CSS represents styles as fields in an element, with more added over time to give developers new features, GATTR completely removes this inertia. What you think of styles in CSS are represented in GATTR as *scripts* which can set *variables* that are used by *shaders*. You can surely imagine creating a 'shimmer' style, for instance, that controls the shimmer color of the shimmer shader you've attached to every element in your Web page just because you could.

If you've ever checked out [ShaderToy](https://shadertoy.com) you probably know how powerful shaders are. By giving developers such low-level access to the rendering system, GATTR completely removes the need for a standard style system patterned after CSS. Any style you can imagine, you can make.

This also means that you don't need to worry too much about each browser's support for different styles; if a specific browser doesn't include the same set of built-ins, you can specify a tailored expansion pack in your GMLOAD file.

The benefits don't stop there, however. GATTR scripts are not limited to setting variables; they are also the way you attach functionality to components in your site, aided by separately loaded script files in the ~~language of your choice~~ RUST. You choose Rust.

The styles-as-functions paradigm also naturally leads to style referencing; calling styles from other styles for efficiency and simplicity. GATTR could alternatively be called Linked Style Sheets, that's how useful this feature is. In fact, in the examples above, all the styles are referencing other styles.

```
(full-color(color)) {
    background-color(color);// this is a style that sets a variable for a shader
    border-color(color);// so is this
    text-color(color);// so is this
}
```