const Artist = {
    cancelEditProfile: function (event) {
        // What gay shit is this
        window.location.href = $("#btnArtistProfileUpdateCancel").attr('href');
    }
}

$(function () {
    $(".artist-edit-profile-bg-cont").on("click", Artist.cancelEditProfile)
});