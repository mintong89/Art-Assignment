const Artist = {
    cancelEditProfile: function (event) {
        // Stolen from https://stackoverflow.com/questions/37573608/how-to-make-modal-close-on-click-outside
        if (!$(event.target).closest('#artist-edit-profile-modal').length && !$(event.target).is('#artist-edit-profile-modal')) {
            // What gay shit is this
            window.location.href = $("#btnArtistProfileUpdateCancel").attr('href');
        }
    },
    oldImageFileSrc: "",
    inputFileOnChange: function (evt) {
        const [file] = $("#profilePicInput").prop("files");
        if (file) {
            Artist.oldImageFileSrc = $("#userProfileImg").prop("src")
            $("#edit_image_preview").prop("src", URL.createObjectURL(file))
        }
    },
    uploadImageOnClick: function (evt) {
        $("#profilePicInput").click();
    },
}

$(function () {
    $(".artist-edit-profile-bg-cont").on("mousedown", Artist.cancelEditProfile)
    $("#profilePicInput").on("change", Artist.inputFileOnChange);
    $(".artist-upload-image-cont").on("click", Artist.uploadImageOnClick)
});
