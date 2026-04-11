# GMLOAD syntax

.gmload files specify the loading and preloading of assets for a Web page. A .gmload file is the first thing sent over when you visit a site that uses GML.

GMLOAD consists of a list of URLS to be loaded in order:

    // Load this first

    https://example.com/source

    // This, second

    https://example.com/font

    // And this, third

    https://example.com/style

GMLOAD also supports types of blocks that define custom loading behavior within them:

    {
        // The assets in here load async and then activate one after the other
        https://example.com/asset-a
        https://example.com/asset-b
        https://example.com/asset-c
    }
<!-- separator -->
    [
        // The assets in here load async and each one activates once loaded
        https://example.com/asset-a
        https://example.com/asset-b
        https://example.com/asset-c
    ]
<!-- separator -->
    (
        // The assets in here load async and the block evaluates to whichever loads first
        https://example.com/asset-a
        https://example.com/asset-b
        https://example.com/asset-c
    )
    
GMLOAD assets can be named, both as a shortcut, and as a system to allow quick-loading simple assets to be replaced globally with better assets that take longer to load:

    // Load this first:

    profile-image: https://example.com/profile-16px

    // Load this later, replacing all references to profile-image in the page:

    profile-image: https://example.com/profile-1024px