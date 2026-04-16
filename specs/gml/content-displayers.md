# GML content displayers

Anything in GML that isn't *layout* is *content*. Content is rendered within a box and takes up the whole grid, no attention payed to the cell layout[^1], as there are no children of an element that only has content.

**Elements with children**

    element {
        child {...}
        child {...}
        child {
            grandchild {...}
            grandchild {...}
        }
    }

    
**Elements with content**

    element {"This has text content"}
    ...
    element {https://example.com/url-leading-to-image}
    ...
    element {https://example.com/url-leading-to-text}
    ...

The rendering of content is delegated to the specific browser; it is the browser's job to support as many types of content as it can; test, JSON, YAML, mp3, etc. The browser could choose, for example, to render JSON as plain text or as a list of expandable tabs.

Content that expands past the boundaries of its parent's cell is scrollable, or hidden, or whatever. The rendering shader decides, based on the style that sets variables, but you've heard enough of GATTR by now, I'm sure.

Content can affect its parents, but that is entirely the parent's decision. For example, a text content displayer field could be given the fixed width of its parent and then be asked to tell report its ideal height. If it has been a good content field, the parent will comply, fitting the content box's size.

This results in the parent not fitting its grid cell (really, any type of thing that expands the parent will do this, not just content fitting; you could have a style that makes every element a mile wide just for the fun of it), and it will be scrollable or hidden or whatever within its cell. (its content is not scrollable now as it is sized to fit the content; you scroll the parent now)

The *grandparent*, then, could have a style that asks the parent what size it wants to be (based on the child's content), and set the parent's holding cell to match. This probably makes the grandparent too big now and the scroll-cycle continues indefinitely.

Eventually the ancestors will reach the browser window (by then you're using *actual* scrolls), which will not expand unless you ask *reeeeally* nicely (i.e. hack the user's computer), upon which it will reach the bounds of the user's screen, and if you know the super-top-secret-code, you can bend the laws of physics to your will and expand the monitor until it's a black hole, in which case an out-of-bounds error should be returned by the browser.

## Notes:

[^1]: In fact, there might be a way to make it semantically impossible to even *define* the cell layout for an element that only has content. Maybe the layout must be defined inside the block, with layout children? Nah- ugly. Plus, how to stop scripts from setting the grid layout?... Best to have it defined [wherever you'd expect](https://en.wikipedia.org/wiki/Principle_of_least_astonishment) and just raise a warning.