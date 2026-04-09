/*
    This is a general-purpose post component
    Styles are supplied by the page the post is embedded in, thus
    making it general purpose and componentalizable
*/

post (padding("5px")) {

    title-box (padding("2px")) {
        title {"DEFAULT TITLE"}
        subtitle {"0000-00-00"}
    }

    text {
        "Lorem ipsum dolor sit amet..."
    }

    image-holder {"https://example.com/default-image}
}