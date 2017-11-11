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
            var test_id = $(".test_id").attr('id');
            var form_data = $('#create_exam_form').serialize() + group_table.$('input').serialize() + '&test_id=' + test_id;

            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "tests/save_schedule_test",
                data: form_data
            });

            request.done(function (id, textStatus, jqXHR) {
                window.location.replace(BASE_URL + "tests");
            });

            // callback handler that will be called on failure
            request.error(function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR);

                console.log(jqXHR.responseText);
            });
        }
    });



});

function initWidgets(){
    $( "#test_date" ).datepicker({ minDate: 0, dateFormat: 'dd/mm/yy'});
    $( "#result_date" ).datepicker({ minDate: 0, dateFormat: 'dd/mm/yy'});

    var wicked_options = {
        twentyFour: true,
        timeSeparator: ':'
    };

    $('#test_start_hour').wickedpicker(wicked_options);
    $('#test_end_hour').wickedpicker(wicked_options);
    $('#result_hour').wickedpicker(wicked_options);
}