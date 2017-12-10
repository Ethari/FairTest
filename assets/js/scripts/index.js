$(function() {

    $("#login-form").validate({
        submitHandler: function (form) {
            // setup some local variables
            var $form = $(form);
            var serializedData = $form.serialize();

            var request = $.ajax({
                url: BASE_URL + "login",
                type: "post",
                data: serializedData
            });

            request.done(function (response, textStatus, jqXHR) {
                console.log(response);
                if (response === "true") {
                    location.reload();
                } else {
                    $('#login_fail').show();
                }
            });

            // callback handler that will be called on failure
            request.fail(function (jqXHR, textStatus, errorThrown) {
                // log the error to the console
                console.error(
                    "The following error occured: " + textStatus, errorThrown);
            });
        }
    });

    $("#logout").click(function() {
        var request = $.ajax({
            url: BASE_URL + "login/logout"
        });

        request.done(function (response, textStatus, jqXHR) {
            location.reload();
        });

        // callback handler that will be called on failure
        request.fail(function (jqXHR, textStatus, errorThrown) {
            // log the error to the console
            console.error(
                "The following error occured: " + textStatus, errorThrown);
        });
    });
});
