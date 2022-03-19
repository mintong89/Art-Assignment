const UploadImage = {
    oldImageFileSrc: "",
    inputFileOnChange: function (evt) {
        const [file] = $("#imageInput").prop("files");
        if (file) {
            UploadImage.oldImageFileSrc = $("#displayImage").prop("src")
            $("#displayImage").prop("src", URL.createObjectURL(file))
        }
    },
    uploadImageOnClick: function (evt) {
        $("#imageInput").click();
    }
}

$(function () {
    $("#imageInput").on("change", UploadImage.inputFileOnChange);
    $(".upload-image-cont").on("click", UploadImage.uploadImageOnClick)
});