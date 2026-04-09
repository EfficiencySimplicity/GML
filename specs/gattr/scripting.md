# GATTR scripting

GATTR attaches scripts to components. These scripts are called the first time an element the script matches is detected; i.e. when the script loads or an element changes so that the script matches it.[^1]

GATTR can reference functions and variables from scripts loaded from GMLOAD.

A basic GATTR script looks like this:

    (random-color) {
        background-color(//[random element from list of colors])
    }

This script will, on activation, sniff out every element with the (random-color) attribute and run itself, setting each one to a random color. If any element is later given the random-color attribute, this script will run on it.[^2]

## Notes

[^1]: this is true for 'styles' too, even tho everything is a function in GATTR. doesn't seem right to make any distinction. But maybe this is just a reiteration.
[^2]:  It makes sense that to add a attribute to an element we should use a function like:

    add_attribute("random-color")

Although we now have to decide how args are supplied, how to deal with adding the same attribute twice, etc...

