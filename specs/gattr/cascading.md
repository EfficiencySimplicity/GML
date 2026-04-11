# GATTR cascading

GATTR implements cascading in much the same way as CSS (that's *one* feature too good to do without), with some styles recursively applying to children (think text-color or something, but **NOT** of a pink elephant), and some not (think width).

To specify that a style applies recursively, you can use the # flag for now until something better's invented:

```
# celestial-glow {
    glow("lightblue" "5px")
}
```

Cascading is mostly only used for text-related styles, but in the name of simplicity and flexibility (and the no-special-cases theme of GML) any style is allowed to be cascading.

Since styles are functions, any cascading style calls itself on any children of any element it's applied to, thus:

- If a non-cascading style calls a cascading one (as will be the case most often), the cascading one gets called and applies on all children
- If a non-cascading style calls another non-cascading one, the child style is applied once on the selected element (of course if the child style contains a cascading style, than that gets called and recursively applied, etc etc etc)
- Anything called by a cascading style gets called recursively, as even a non-cascading style will still be forcibly called by the parent style on each child.

You can also specify substyles (i.e. styles that depend on their relative position to other elements) in this manner:

```
parent {
    child {
        // style goes here
    }
}
```

In this case you identify the parent and child by either their name or attribute, same as in the normal structure of GATTR.

```
card {
    /*
        Special styles inside cards, but without custom classes, I'm too lazy for custom classes. Plus you don't hafta specialize to the specific names the card uses. A benefit!
    */
    title {
        text-color("blue");
        font-weight("12");
    }
    (link) {
        text-color("lightgrey");
        font-weight("3");
    }
}
```

You can specify default styles for every element using the * keyword, same as in CSS:

```
// The text is red by default on this site (probably a scam site)
* {
    text-color("red");
}
```