# GATTR abstraction

In CSS, we can give multiple tag names / ids the same style using this syntax:

```css
div nav .master-control .cheesecake #card #floating {
    background-color: red;
    border-color: blue;
}
```

In GATTR, we opt to use a different approach. Since GATTR styles are basically functions, you can reference styles within other styles, thus eliminating the need for CSS's syntax choice.

Say we have a setup like this:

```
// .gml
...
title-card {...}
...
button (menu-button) {...}
button (menu-button) {...}
button (menu-button) {...}
...
post {...}
post {...}
...
```
```
// .gattr
title-card {
    background-color("red");
    border-color("blue");
    ...
}

(menu-button) {
    background-color("red");
    border-color("blue");
    ...
}

post {
    background-color("red");
    border-color("blue");
    ...
}
```

We want to follow the elegant standard of D.R.Y., and so this repetition of background- and border- colors must be abstracted away somehow.

There are two different things we can do (but really only 1).

1. We can separate these features into their own separate style and give it to all the elements that use it
2. We can separate these features into their own separate style and reference it in all these elements' styles

### 1:

```
// .gml
...
title-card (rb) {...}
...
button (rb menu-button) {...}
button (rb menu-button) {...}
button (rb menu-button) {...}
...
post (rb) {...}
post (rb) {...}
...
```
```
// .gattr
rb {
    background-color("red");
    border-color("blue");  
}

title-card {...}

(menu-button) {...}

post {...}
```

### 2:

```
// .gml
...
title-card {...}
...
button (menu-button) {...}
button (menu-button) {...}
button (menu-button) {...}
...
post {...}
post {...}
...
```
```
// .gattr
rb {
    background-color("red");
    border-color("blue");  
}

title-card {
    rb;
}

(menu-button) {
    rb;
}

post {
    rb;
}
```

Both of these are ok, but #2 is overall preferred.

## Notes

The syntax choice for styles-in-styles needs to be better written, if we use Rust, then
```
example {
    rb;
}
```

sort of looks like a variable. We could have it mandatory that you always use parentheses when referencing styles in-styles, and have it not mandatory in GML, but that inconsistency could expand over time.

An earlier idea before the styles-as-functions breakthrough was to have the syntax like this:

```
// .gattr
(box) (rb mod cake) {
    // code goes here
}
```

But that just raises more inconsistencies along with making it so you can't dynamically calculate the values for styles before passing them.

But maybe that only has to be the case for non-argument styles, and also makes it more consistent with GML syntax...

Still a grey area, unfortunately.
