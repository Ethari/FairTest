$(function() {
    $("#change_password_form").validate({
        rules: {
            repeat_new_password: {
                equalTo: "#new_password"
            },
            new_password: {
                required: true
            }
        },
        messages: {
            repeat_new_password: {
                equalTo: "Passwords do not match."
            },
            new_password: {
                required: "Insert your new password."
            }
        },
        submitHandler: function (form) {
            var form_data = $('#change_password_form').serialize();

            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "account/changePassword",
                data: form_data
            });

            request.done(function (id, textStatus, jqXHR) {
                window.location.replace(BASE_URL + 'exams');
            });

            // callback handler that will be called on failure
            request.fail(function (jqXHR, textStatus, errorThrown) {
                // log the error to the console
                alert(
                    "The following error occured: " + textStatus, errorThrown);
            });
        }
    });
});