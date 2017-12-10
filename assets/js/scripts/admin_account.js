$(function() {
    $("#change_admin_account").validate({
        rules: {
            fName: {
                required: true
            },
            lName: {
                required: true
            },
            repeat_new_password: {
                equalTo: "#new_password"
            },
            current_password: {
                required: true
            }
        },
        messages: {
            fName: {
                required: "First name is required!"
            },
            lName: {
                required: "Last name is required!"
            },
            current_password: {
                required: "Your current password is required!"
            },
            repeat_new_password: {
                equalTo: "Passwords do not match."
            }
        },
        submitHandler: function (form) {
            var form_data = $('#change_admin_account').serialize();

            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "account/changeAccount",
                data: form_data
            });

            request.done(function (id, textStatus, jqXHR) {
               location.reload();
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