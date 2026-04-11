# GML componentalization

As GML is not restricted to using a single file as the layout, componentalization (such as that used in React, or somewhat similar) can be achieved by separating the main layout elements of your Web page into different files / strings, such as this:

    /components
    |-/posts
    | |-image-post.gml
    | |-test-post.gml
    |-button.gml
    |-info-box.gml
    |-source.gml

You can embed a GML file into another GML file via this syntax:

    ...
    post-box {
        post {/path-to-gml-file-or-url}
    }
    ...

As for controlling the content of an embedded GML component (which naturally people would want to do), you can have it dynamically created via url, such as, for example, getting a specific post from a database:

[ref]: examples/gml/social-media-app.gml
    ...
    // Dynamically loaded posts go here
    post-box {
        post {https://socialsite.com/posts/2132fdg23fsf}
        post {https://socialsite.com/posts/j45k5345jh43}
        post {https://socialsite.com/posts/kjn432oi3n23}
        post {https://socialsite.com/posts/xcnv7rewhs73}
        post {https://socialsite.com/posts/safsh2983sdh}
    }
    ...

Here we imagine the server assembles a GML string out of the SQL data and sends it over. Another example is perhaps for a component-delivery server, you could pass basic arguments in via the URL (no idea how plausible this is, though...)

    ...
    ad-banner {https://example.com/ads?bannermessage=look%20at%20these%20cool%20ads}
    ...

An alternative way to control the content is to have an attribute that applies to the component that sets its content once it's loaded.

The GML file embedded will depend on the parent file for its style; it cannot supply styles of its own as it is a standalone GML file. This ensures consistent styling across a page, and reusability of components.

If you need a more dynamic embed, you can embed a whole Web page by linking to a GMLOAD file:

    ...
        map-box {
            post {https://maps.example.com/embed}
        }
    ...