const PurchaseHistory = {
    collapseTagOnClick: function (e) {
        e = e.currentTarget
        let open = $(e).data("open")
        if (!open) {
            $(e).next().css("max-height", '')
            $(e).next().css("overflow", "hidden")
            $(".collapse-tag", e).addClass("rotate-90");
            $(e).data("open", 1)
        } else {
            $(e).next().css("max-height", 0)
            $(e).next().css("overflow", "hidden")
            $(".collapse-tag", e).removeClass("rotate-90");
            $(e).data("open", 0)
        }
    }
}


$(function () {
    $(".ph-order-row").on("click", PurchaseHistory.collapseTagOnClick)
});