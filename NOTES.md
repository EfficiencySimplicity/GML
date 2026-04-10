- If we reference/call styles within styles, how and what are name-styles working? Can we reference a name style, like for 'post' in other styles?
    - We need a standard for these things, is it 'referencing' or 'calling'? are they 'styles' or 'attributes'?

- How does the scripting work? How do we add on-hover triggers, etc etc etc?
    - I imagined:
    ```
    (expand) {
        [tick] {
            // .quantity 'cuz width is a struct w/ units (px, %, etc) and quantity,
            // just an idea...
            this.width.quantity *= 1.05
        }
    }
    ```

    And some way to make custom triggers...

    This language compiles to Rust, perhaps; at least what parts that ain't Rust already.

    'this' seems like a good way to go.

- How do we specify grid cells How do we specify what cell a child goes into? 
    - Wherever they're specified, I want it to look something like this:
    ```
    [10% 3.5px ; ;]
    ```
    with ';' meaning 'fill up all the remaining space' and variants like 3; 5; divvying up the space between 'em accordingly.

    - Overall, a paradigm is that parents should control their children. A child being used as a component that specifies which parent cell it goes into is a problem; its parent might be anything. (although I guess we always embed into a single element... -- but that element might have a grid layout!--- or maybe just ignore that and all is ok? It'd add another level of nesting...)

    - Maybe something like this?
        ```
        // assume specifying here for now
        parent [5px ; 5px][5px ; 5px] {
            [0,0] child {}
            [0,2] child {}
            [2,1] child {}
        }
        ```

        But if we're embedding, we can only do that by making the embed the whole content; and there's no need to do padding or anything; if the element's got no blocks inside, it ain't a grid, just a single cell. Does mean we've got a conceptual wasted layer of nesting, but that's ok.
    
- Imagine a blur style, this wouldn't be recursive (or extra blur on children), but all the layers compile to a single one in-shader which then has blur on it. This has promise...

- How are we gonna attach triggers to objects? Either with that above syntax or with something like:
    ```rust
    element {
        this.onhover.addfunction({
            //code here
        })
    }
    ```

    But these scripts are gonna dynamically load, and Rust is a compiled language...

- Should all this be in Discussions? This file seems redundant.