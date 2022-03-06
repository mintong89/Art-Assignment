function dropdownOnclick(event) {
    e = $(this)

    let dd = $(".dropdown-cont", e);
    if (dd.css("top") == "0px") {
        // Prevent parents from firing their onclick event
        event.stopPropagation();
        // Close other dropdown first
        closeAllDropdown();
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

function closeAllDropdown() {
    let dds = $(".dropdown-cont")

    for (let i = 0; i < dds.length; i++) {
        let dd = $(dds[i]);
        dd.css("top", 0)
        dd.css("opacity", 0)
        dd.css("display", "none")
    }
}

$(function () {
    // Register all dropdowns
    $(document).on("click", closeAllDropdown)
    $(".dropdown-menu-item").on("click", dropdownOnclick)
});