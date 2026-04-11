## Structure

A good repository, like its contents, should have a standard structure.

The main structure for this repository is as such:

[/examples](/examples) - code snippets demonstrating features of the languages, for standalone use and reference in other files

[/specs](/specs) - basic syntax and features of each language. Each subfolder has a basics.md file describing (the basics of course), along with more detailed Markdown files describing each feature thoroughly.

## Style

These words are always, in the specs, docs, comments, etc, capitalized this way: HTML, CSS, JS, JavaScript, Rust, GML, .gml, GMLOAD, .gmload, GATTR, .gattr, Web, Internet, Markdown.

Be careful not to do a blind find-and-replace, there are examples, such as in tags (```<html>```), where you do not wanna capitalize it.

Any Markdown file within this repo should (but not *must*, see this one for example (should this one be split into different Markdown files?)) have a one-octothorpe (#) title at the top, and double-octothorpe subheaders, including an optional ## Notes section at the end.

Scripts linked to in /examples (as Markdown does not support embeds, as far as I know), when changed, must have all their references changed; i.e. do a search and replace 'em.