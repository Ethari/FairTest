$(function() {

    $('#new_test').click(function(){
        var request = $.ajax({
            method: "POST",
            url: BASE_URL + "tests/new_test"
        });

        request.done(function (data, textStatus, jqXHR) {
            window.location.href = BASE_URL + "tests/create_test/" + data;
        });

        // callback handler that will be called on failure
        request.fail(function (jqXHR, textStatus, errorThrown) {
            // log the error to the console
            alert(
                "The following error occured: " + textStatus, errorThrown);
        });

    });


    var testTable = $('#test_table').DataTable( {
        "columns": [
            null,
            null,
            null,
            { "orderable": false },
            { "orderable": false },
            { "orderable": false }
        ]
    } );

    $("#test_table").on("click", ".deleteTest", function(){
        if (confirm('Are you sure you want to delete this test?')) {
            var id = $(this).attr("id");
            console.log(id)
            var thisRow = $(this);
            $(this).parent().parent().addClass("del_selected");
            testTable.row('.del_selected').remove().draw( false );

            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "tests/delete_test",
                data: {
                    id: id
                }
            });

            request.done(function (response, textStatus, jqXHR) {

            });

            // callback handler that will be called on failure
            request.fail(function (jqXHR, textStatus, errorThrown) {
                alert("Failed to delete test.");
            });
        } else {
            // Do nothing!
        }
    });


    $('#wrapper').on("click", ".deletTest" ,function(){
        if (confirm('Are you sure you want to delete this test?')) {
            var id = $(this).attr('id');
            $.ajax({
                method: "POST",
                url: BASE_URL + "groups/deleteTest",
                data: { student_id: id,
                    group_id: $(".group_id_header").attr('id')}
            })

                .done(function(id) {
                    location.reload();
                })

                .fail(function(id){
                    alert("FAIL: " + id);
                });
        }
    });

    $('#add_students_button').click(function(){
        var tbl = $('#students_to_add_table').DataTable();
        var rows = tbl.$(".student-checkbox:checked", {"page": "all"});

        var student_ids = [];
        rows.each(function(index,elem){
            student_ids.push($(elem).val());
        });

        if(student_ids.length != 0){

            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "groups/addStudentsToGroup",
                data: {
                    data: JSON.stringify(student_ids),
                    group_id: $(".group_id_header").attr('id')
                }
            });

            request.done(function (data, textStatus, jqXHR) {
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

    $( "#myform" ).validate({
        rules: {
            csv_file: {
                required: true,
                extension: "csv"
            }
        }
    });



    $('.timepicker').wickedpicker();

    $('#wrapper').on("click", "#new_group" ,function(){
        $( "#group_error" ).hide();
    });

    $('#wrapper').on("click", ".deleteGroup" ,function(){
        if (confirm('Do you really want to delete this group?')) {
            var el = $(this);
            var id = $(this).attr('id');
            $.ajax({
                method: "POST",
                url: BASE_URL + "groups/deleteGroup",
                data: { group_id: id}
            })

                .done(function(id) {
                    $(el).parent().parent().remove();

                })

                .fail(function(id){
                    alert("FAIL: " + id);
                });
        }
    });

    $("#new_group_form").validate({
        rules: {
            name: {
                required: true
            }
        },
        messages: {
            name: {
                required: "Group must have a name!"
            }
        },
        submitHandler: function (form) {
            var name = $( "#group_name" ).val();
            var course = $( "#group_course option:selected" ).text();
            var day = $( "#group_day" ).val();
            var hour = $( "#group_hour" ).val();
            var form_data = $('#new_group_form').serialize();

            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "groups/newGroup",
                data: form_data
            });

            request.done(function (id, textStatus, jqXHR) {
                if(id != -1){
                    $('#group_table > tbody:last-child').append('<tr><td>'+name+'</td><td>'+course+'</td><td>'+day+'</td><td>'+hour+'</td><td>0</td>' +
                        '<td><a href = "'+BASE_URL+'groups/students/'+id+'"><button id = "'+id+'"  class="btn btn-primary viewStudents">Students</button></a></td>' +
                        '<td><button id = "'+id+'"  class="btn btn-danger deleteCourse">Delete</button></td></tr>');
                    $('#newGroupModal').modal('hide');
                    $('#group_name').val('');
                    $('#group_success').show();
                } else{
                    $( "#group_error" ).show();
                }
            });

            // callback handler that will be called on failure
            request.fail(function (jqXHR, textStatus, errorThrown) {
                // log the error to the console
                alert(
                    "The following error occured: " + textStatus, errorThrown);
            });
        }
    });

    $('.modal').on('hidden.bs.modal', function(e)
    {
        $(this).removeData();
    }) ;


});