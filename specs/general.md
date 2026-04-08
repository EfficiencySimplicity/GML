# General specs

Comments in all GML-adjacent languages are defined by a standard double slash (//), and multi-line comments are defined by a /* and */

The basic structure of loading a GML page is as follows:

1. The client sends a HTTP request (GMLTP? ooooooh) to the server, which sends back a .gmload file
2. The client loads and activates the assets in the .gmload file according to [the spec for .gmload](gmload/syntax.md)

Pretty simple, amirite?

These words are always, in the specs, docs, comments, etc, capitalized this way: HTML, CSS, JS, JavaScript, Rust, GML, .gml, GMLOAD, .gmload, GATTR, .gattr, Web, Internet.

Be careful not to do a blind find-and-replace, there are examples, such as in tags (```<html>```), where you do not wanna capitalize it.