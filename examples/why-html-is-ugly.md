# Why HTML Is Ugly

Here we go through, one by one, the features of HTML and why they are inelegant.

## Each document starts out with ```<!DOCTYPE html>```.

This seems redundant. Why tell that a file is HTML when its extension is .html and you expect .html? Why not include it as metadata, if anything? [This article](https://www.tutorialspoint.com/article/Why-do-we-use-DOCTYPES-in-HTML-document) describes its use thus:

>The main reasons for using DOCTYPE are −
>
>    Browser Rendering Mode Control − DOCTYPE determines which rendering mode the browser uses. Without it, browsers enter "quirks mode" to maintain backward compatibility with old, non-standard Websites. With a proper DOCTYPE, browsers use "standards mode" for consistent, predictable rendering.
>
>    HTML Validation − Markup validators use the DOCTYPE to check document syntax and structure against specific HTML rules. This helps identify coding errors and ensures compliance with Web standards.
>
>    Cross-Browser Compatibility − A proper DOCTYPE ensures consistent rendering behavior across different browsers and versions, reducing layout discrepancies and display issues.

Backwards compatibility, syntax checkers, and somehow making it cross-compatible? All good uses, but not the best way to define the document type.

## Comments

Instead of the basic double-slash (//), HTML uses this mess: ```<!-- -->```. This is seven entire characters long. The absence of a double-slash may have been used to make it easier to write ```http://```, which is a valid decision, but a better alternative could have been chosen. Even a <! comment-goes-here> tag would have taken less characters along with being on-style with XML, no need for the hyphenation.

## Tags

In HTML, some tags have beginning and ending points (```<p></p>```) and some just have a single clause (```<input>```). This distinction tells you what tags can contain text content or not, a useful method. This does come with some problems, though.

First of all, since everything is a tag, metadata (```<head></head>```) is given the same styling as, and put in the same document as, actual page elements. This can cause some confusion as to what is a thing and what is data.

Additionally, this causes issues with tags given multiple uses. For example, the ```<script>``` tag is used to embed scripts directly into HTML (not really a good style choice, but it makes sense as to being a quick-and-dirty shortcut), for which is uses a start and end tag, but it is also (and more commonly) used to link to a script, for which the already-present ```<link>``` tag was not chosen, but the script tag repurposed (with both a start and end tag, masquerading as a single tag) to have a second usage.

And to fix the problem of needing to load after the HTML, the defer flag was added. Also there's an async flag, for if you need it to load async instead.

## Indexing

In HTML, you can search for things, apply styles to things, and identify things using either the element's type, the id attribute, or the class attribute. This is a pretty solid system, but GML does it better. The types really just make it more readable mostly; a ```<nav>``` is just a ```<div>``` with a specific name. Only some specific tags do special things, such as ```<form>``` or ```<style>```. (also, the text types have some different styling than normal divs, and of course the browser can specify different styles for specific element types)

## Shortcuts

HTML was designed to be easy, which includes adding shortcuts in many places. These shortcuts certainly do make things quicker, but encourage lazy design. Think lazy- versus strict- typing. Lazy typing is faster but if you're making anything that will have a practical use, anything that needs to be reliable, you need a solid foundation you can trust.

Some shortcuts in HTML include:

- Styling
    - Styles can be applied via a stylesheet, which itself can be defined in 2 ways:
        - As an external file, linked to via the ```<link>``` tag
        - Via a hard-coded stylesheet built in to the HTML
    - Alternatively, styles can be applied directly to an element:
        ```<div width="50%" color = red>...</div>```

- Scripts
    - Same as styles, scripts in html can be hard-coded (via the ```<script>``` tag), or linked to externally. The script tag is also, oddly enough, used to link to external scripts instead of using the ```<link>``` tag. This means its functionality is partway between an element and a tag.

    