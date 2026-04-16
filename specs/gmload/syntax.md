# GMLOAD syntax

.gmload files are plain-text files, with a line-based structure.

GMLOAD is made out of statements, which take up a single line. Statements can be of these forms:

- The start or end of a brace or bracket block
- A named or unnamed URL
- A named start of a parenthesis block
- The end of a parenthesis block

Lines may also be blank. Any line may have any amount of whitespace / indentation between the various semantic elements it contains. Additionally, any line may end with a single- or multi- line comment, and the end of a multi-line comment may extend into the beginning of a new line before terminating.

Here is a demonstration of comments intersecting with statements:

    // Here is a simple single-line comment
                // Here is a single-line comment with whitespace before and after   
      name: https://example.com/data?id=2344324&data=5 /* Here is a multi-line comment. Note how the multi line comment has a space between it and the URL. This is mandatory as a URL must have whitespace between it and any semantic elements on the same line. Also notice the name field. This is a valid GML name as defined in the general spec. The colon doesn't have to touch it, but it's cleaner. Note also the indentation of the statement. This doesn't matter at all. It could have no indentation or a mile; it's just to make it look good. Now this comment must'nt have anything on the same line it ends on, see? It's semantically equivalent to a single space, really, and so we do need a newline after it...*/ 
      https://example.com/banner-image

    https://example.com/index // The spaces-around-URLs rule helps differentiate a single-line comment which uses a double-slash from the double-slash in the URL; otherwise the body of the URL would be counted as a comment.

Besides the standard url-with-optional name statement, you also define the start and end of a bracket or brace block in a single line:

    // Here goes a bracket block:
        [ // Nothing but whitespace and comments on a line that defines part of a block's boundary
            /* This is a bracket block; named fields can go inside with the same rules as top-level URL statements. You can also nest blocks, but must terminate the blocks in the reverse order you start them in; no "([)]" going on here */

            name1: https://example.com // Here, an in-block statement.
    name2: https://example.com // Indentation don't matter here

    /* Just to prove it to ya, here's a nested block:*/ [
        // Bracket and Brace blocks can be empty
    ] // here we terminate the block

     /* bye-bye brace block */   ]

    // bracket blocks work the same way, here's an empty one:

    {  }// If a block is empty, you can start and terminate it on the same line

Parenthesis blocks differ from brace and bracket blocks as they must not be empty, cannot contain named fields, and must be named themselves:

    // Here is a parenthesis block
    name  :      (/* Lots of spacing just to prove you can
    also multi-line intrusion just to prove a point */ https://example.com/data-1
       https://example.com/data-2



       http://example.com/data-3 // ooooh, http.....

    )