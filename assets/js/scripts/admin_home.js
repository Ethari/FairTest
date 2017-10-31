$(function() {

    $('#home').click(function () {
        $('.sidebar_active').removeClass("sidebar_active");
        $('.admin-panel').load(BASE_URL + "courses", "test");
        $(this).parent().addClass("sidebar_active");
    });
});