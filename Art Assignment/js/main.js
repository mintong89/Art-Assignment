function dropdownOnclick() {
    e = $(this)

    let dd = $(".dropdown-cont", e);
    if (dd.css("top") == "0px") {
        dd.css("display", "flex");
        dd.css("top", `calc(${e.css("height")} + .5rem)`);
        dd.css("opacity", 1);
    } else {
        dd.animate({
            top: 0,
            opacity: 0
        },
        100,
        function () {
            dd.css("display", "none");
        })
    }
}

$(function () {
    // Register all dropdowns
    $(".dropdown-menu-item").on("click", dropdownOnclick)
});