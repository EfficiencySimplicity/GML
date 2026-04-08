# Why HTML Is Ugly

Here we go through, one by one, the features of HTML and why they are inelegant.

### Each document starts out with ```<!DOCTYPE html>```.

This seems redundant. Why tell that a file is HTML when its extension is .html and you expect .html? Why not include it as metadata, if anything? [This article](https://www.tutorialspoint.com/article/Why-do-we-use-DOCTYPES-in-HTML-document) describes its use thus:

>The main reasons for using DOCTYPE are −
>
>    Browser Rendering Mode Control − DOCTYPE determines which rendering mode the browser uses. Without it, browsers enter "quirks mode" to maintain backward compatibility with old, non-standard websites. With a proper DOCTYPE, browsers use "standards mode" for consistent, predictable rendering.
>
>    HTML Validation − Markup validators use the DOCTYPE to check document syntax and structure against specific HTML rules. This helps identify coding errors and ensures compliance with web standards.
>
>    Cross-Browser Compatibility − A proper DOCTYPE ensures consistent rendering behavior across different browsers and versions, reducing layout discrepancies and display issues.

Backwards compatibility, syntax checkers, and somehow making it cross-compatible? All good uses, but not the best way to define the document type.

### Comments

Instead of the basic double-slash (//), HTML uses this mess: ```<!-- -->```. This is seven entire characters long. The absence of a double-slash may have been used to make it easier to write ```http://```, which is a valid decision, but a better alternative could have been chosen. Even a <! comment-goes-here> tag would have taken less characters along with being on-style with XML, no need for the hyphenation.

### Tags

In HTML, some tags have beginning and ending points (```<p></p>```) and some just have a single clause (```<input>```). This distinction tells you what tags can contain text content or not, a useful method. This does come with some problems, though.

First of all, since everything is a tag, metadata (```<head></head>```) is given the same styling as, and put in the same document as, actual page elements. This can cause some confusion as to what is a thing and what is data.

Additionally, this causes issues with tags given multiple uses. For example, the ```<script>``` tag is used to embed scripts directly into HTML (not really a good style choice, but it makes sense as to being a quick-and-dirty shortcut), for which is uses a start and end tag, but it is also (and more commonly) used to link to a script, for which the already-present ```<link>``` tag was not chosen, but the script tag repurposed (with both a start and end tag, masquerading as a single tag) to have a second usage.

And to fix the problem of needing to load after the HTML, the defer flag was added. Also there's an async flag, for if you need it to load async instead.

### Indexing

In HTML, you can search for things, apply styles to things, and identify things using either the element's type, the id attribute, or the class attribute. This is a pretty solid system, but GML does it better. The types really just make it more readable mostly; a ```<nav>``` is just a ```<div>``` with a specific name. Only some specific tags do special things, such as ```<form>``` or ```<style>```. (also, the text types have some different styling than normal divs, and of course the browser can specify different styles for specific element types)









```html
<!DOCTYPE html> // What does this even do?! The extension says .html!
// Plus, these aren't even HTML comments; those look like:
<!-- This weird and excessive syntax; 7 characters to define them -->

// Because we need to tell where the html is, as you can also
// embed css and JS into the document in more than one way; either referencing a 
// dedicated file or being lazy and just writing CSS/JS straight in the HTML file.
<html>// an excessive syntax again, patterned after XML, 
    // but good for looking at the end and telling what type of div it is

    // Metadata about the page goes in here; makes sense
    <head>
        <title>Ugly Html Document</script>
        // https://www.w3schools.com/tags/tag_head.asp
        <base href="https://www.w3schools.com/" target="_blank">
        // why put specific types of metadata inside a meta tag? Shouldn't these 
        // all be different tags?
        // For that matter, why have this in a tag, like a standard div? It seems
        // a bit confusing; these shouldn't be DOM elements.
        // Also tags vs normal <element></element>; why make a distinction?
        // Tags only difference is that they can contain no content; they shouldn't be
        // written the same as DOM elements.
        // Also, this content field really should be built in, there's no reason not to.
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        // Two different ways to import files; because we HAD to make the script tag
        // hold content and also import files, functioning like a tag AND a DOM element.
        <link rel="stylesheet" type="text/css" href="styles.css">
        <script src = "main.js"></script>
        // By the way, to make a script tag wait 'till the HTML loads to activate, you add defer,
        // which won't work for inline scripts, which must use a JS loader.

        <noscript> Ah, for when the browser doesn't support JS; again styled like a DOM element</noscript>
    </head>

    <body>// This automatically has padding, and doesn't tell you about it



    </body>

</html>
```

This is just the natural product of making a text layout document have to be backwards compatible through TODO years of web development by adding on bandages until you're left with a confusing mess. This is why we build frameworks upon frameworks to abstract away the HTML, when really the HTML should be designed better in the first place.