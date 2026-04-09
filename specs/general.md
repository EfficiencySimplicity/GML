# General specs

Comments in all GML-adjacent languages are defined by a standard double slash (//), and multi-line comments are defined by a /* and */

Languages in the GML suite are all encoded using a standard plain-text encoding.[^1].

Whitespace (tabs, newlines, spaces), overall, does not affect anything and is ignored. This allows you to format files using whitespace to make them more visually appealing. [^2]

Names in the GML suite consist of any Unicode letter character (a-z, A-Z, letters with diacritics, numbers), along with the underscore (_) and dash (-) [^3]. The following are valid names:

- name
- long-name
- super_long-name
- 9am3-w1th_9-u-M-BRZZZ
- --stop_all_and_dance--
- \__________

However it is recommended to use kebab-case and refrain from using numbers.

The basic structure of loading a GML page is as follows:

1. The client sends a HTTP request (GMLTP? ooooooh) to the server, which sends back a .gmload file
2. The client loads and activates the assets in the .gmload file according to [the spec for .gmload](gmload/syntax.md)

Pretty simple, amirite?

## Notes

[^1]: What encoding? Does it matter? I'd just rename a .txt file and go with that. HTML has that charset-encoding feature...
[^2]: What about as spacing in GML (```name (attr attr attr(arg arg arg))```)? Should commas be used?...
[^3]: Are these the correct names? Is this clear enough? commas also ain't supported, as are periods.