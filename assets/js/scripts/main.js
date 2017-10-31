$(function() {
    $("#register_form").validate({
        rules: {
            password: "required",
            password_repeat: {
                equalTo: "#password"
            },
            student_id: {
                required: true,
                number: true,
                minlength: 6
            }
        },
        messages: {
            password_repeat: {
                equalTo: "Passwords must be the same!"
            },
            student_id: {
                number: "StudentID can only contain numbers",
                minlength: "StudentID must be at least 6 numbers long."
            }
        }
    });
    $.validator.addMethod("checkUserName",
        function(value, element) {
            var result = false;
            $.ajax({
                type:"POST",
                async: false,
                url: BASE_URL + "register/checkUsername", // script to validate in server side
                data: {username: value},
                success: function(data) {
                    result = (data == true) ? true : false;
                }
            });
            // return true if username is exist in database
            return result;
        },
        "This username is already taken! Try another."
    );

});



