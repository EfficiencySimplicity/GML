# GML basics

GML stands for Grid Markup Language. It represents the standard HTML box model as a series of grids, each object specifying the shape and number of its cells. Looking at [almost](https://www.amazon.com/) [any](https://proton.me/) [Web](https://louisvillezoo.org/) [site](https://www.drivecomic.com/), you can probably find a dividing line or series of dividing lines (either explicit or implied) going from one side of the screen to another, dividing it into two or more parts. This continues recursively down into individual elements, with the exception of absolutely-positioned elements, which probably, though, follow this grid model internally themselves.

GML (as opposed to HTML which was designed text-first) is intended to support UI layout as a base feature, with hopefully equally extensive support for text layout, all with a clean and intuitive design.

GML syntax follows a basic JSON-similar format, with elements defined by a name, attributes, and a set of braces with content of various forms within:


    body {
        elephant-picture (drop-shadow("5px")) {https://example.com/elephant-photo}

        button-holder {
            button {"↙️"}
            button {"🔄"}
            button {"↘️"}
        }

        github-link (link("https://github.com/EfficiencySimplicity)) {"Click here to visit my Github?"}
    }

GML files are meant to be fit into a box. If that box is the window of your browser, you have a Web page. If that box is a cell in a GML grid, you have a component. This means componentalization is a built-in feature of GML. BOOYAH. You can thus avoid heavy nesting by separating the components of your site into separate files.