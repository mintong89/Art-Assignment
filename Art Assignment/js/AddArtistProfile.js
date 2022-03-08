const AddArtistProfile = {
    oldImageFileSrc: "",
    inputFileOnChange: function (evt) {
        const [file] = $("#profilePicInput").prop("files");
        if (file) {
            AddArtistProfile.oldImageFileSrc = $("#profile-pic-img").prop("src")
            $("#profile-pic-img").prop("src", URL.createObjectURL(file))
        }
    },
    uploadImageOnClick: function (evt) {
        $("#profilePicInput").click();
    }
}

$(function () {
    $("#profilePicInput").on("change", AddArtistProfile.inputFileOnChange);
    $(".user-profile-upload-image-cont").on("click", AddArtistProfile.uploadImageOnClick)
});