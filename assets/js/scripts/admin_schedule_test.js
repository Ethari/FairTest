$(function() {
    initWidgets();
    var group_table = $('#group_table').DataTable( {
        "columns": [
            { "orderable": false },
            null,
            null,
            null,
            null,
            null
        ]
    } );

    $("#result_presentation_type").change(function() {
        if($(this).val() === "specify_time"){
            $(".results_options").show();
        } else{
            $(".results_options").hide();
        }
    });

    $("#create_exam_form").validate({
        rules: {
            start_date: {
                required: true
            },
            start_time: {
                required: true
            },
            test_time: {
                required: true
            },
            end_time: {
                required: true
            },
            result_date: {
                required: function() {
                        return $("#result_presentation_type").val() === "specify_time";
                    }
            },
            result_time: {
                required: function() {
                    return $("#result_presentation_type").val() === "specify_time";
                }            }
        },
        messages: {
            name: {
                required: "Group must have a name!"
            }
        },
        submitHandler: function() {
            var form_data = $('#create_exam_form').serialize() + group_table.$('input').serialize();


            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "tests/save_schedule_test",
                data: form_data
            });

            request.done(function (id, textStatus, jqXHR) {

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

function initWidgets(){
    $( "#test_date" ).datepicker({ minDate: 0});
    $( "#result_date" ).datepicker({ minDate: 0});
    $('#test_start_hour').wickedpicker();
    $('#test_end_hour').wickedpicker();
    $('#result_hour').wickedpicker();
}