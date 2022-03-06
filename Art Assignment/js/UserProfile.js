const UserProfile = {
    submenuOnclick: function () {
        let submenu = $($(this).next());
        if (submenu.length != 0 && submenu.hasClass("user-profile-sidebar-submenu")) {
            if (submenu.css("display") == "none") {
                submenu.show()
            } else {
                submenu.hide()
            }
        }
    }
}
$(function () {
    $(".user-profile-sidebar-item").on("click", UserProfile.submenuOnclick);
});