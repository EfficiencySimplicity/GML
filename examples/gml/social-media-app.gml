/* 
    The body is split vertically into a nav bar at the top and the page content at 
    the bottom
*/
body {
    // Nav bar split into 4 segments
    nav-bar {
        nav-button {"Home"}
        nav-button {"Profile"}
        nav-button {"Discover"}
        nav-button {"About"}
    }

    /*
        this 9-slices the page-content grid and the post box
        is placed in the center cell
    */
    page-content (padding("20px")) {
        // Dynamically loaded posts go here
        post-box {
            post {https://socialsite.com/posts/2132fdg23fsf}
            post {https://socialsite.com/posts/j45k5345jh43}
            post {https://socialsite.com/posts/kjn432oi3n23}
            post {https://socialsite.com/posts/xcnv7rewhs73}
            post {https://socialsite.com/posts/safsh2983sdh}
        }

        subtitle {"Copywrong 1995 CoolCorp"}
    }
}