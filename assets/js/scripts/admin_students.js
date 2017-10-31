$(function() {

    var studentsTable = $('#students_table').DataTable( {
        "columns": [
            null,
            null,
            null,
            { "orderable": false },
            { "orderable": false }
        ]
    } );

    $("#students_table").on("click", ".deleteStudent", function(){
        if (confirm('Are you sure you want to delete this student?')) {
            var id = $(this).attr("id");
            var thisRow = $(this);
            $(this).parent().parent().addClass("del_selected");
            studentsTable.row('.del_selected').remove().draw( false );

            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "students/deleteStudent",
                data: {
                    id: id
                }
            });

            request.done(function (response, textStatus, jqXHR) {

            });

            // callback handler that will be called on failure
            request.fail(function (jqXHR, textStatus, errorThrown) {
                alert("Failed to delete student.");
            });
        } else {
            // Do nothing!
        }
    });

    $( "#new_student_form" ).validate({
        rules: {
            firstName: {
                required: true
            },
            lastName: {
                required: true
            },
            studentIndex:{
                required: true,
                minlength: 6,
                maxlength: 6,
                number: true,
                remote: {
                    url: BASE_URL + "students/studentExists",
                    type: "post",
                    data: {
                        studentIndex: function() {
                            return $( "#studentIndex" ).val();
                        }
                    }
                }
            }
        },

        messages: {
            studentIndex: {
                remote: "Student with {0} index number already exists."
            }
        },

        submitHandler: function (form) {
            var firstName = $( "#firstName" ).val();
            var lastName = $( "#lastName" ).val();
            var studentIndex = $( "#studentIndex" ).val();
            var form_data = $('#new_student_form').serialize();

            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "students/newStudent",
                data: form_data
            });

            request.done(function (id, textStatus, jqXHR) {
                $("#addStudent").modal('hide');
                $("#addStudent").removeData();
                $("#student_success").show();

                var newRow = ('<tr><td>'+firstName+'</td><td>'+lastName+'</td><td>'+studentIndex+'</td>' +
                    '<td><button id = "'+id+'"  class="btn btn-primary">Profile</button></td>' +
                    '<td><button id = "'+id+'"  class="btn btn-danger deleteStudent">Remove</button></td></tr>');

                studentsTable.row.add([
                    firstName,
                    lastName,
                    studentIndex,
                    '<button id = "'+id+'"  class="btn btn-primary">Profile</button> ',
                    '<button id = "'+id+'"  class="btn btn-danger deleteStudent">Remove</button>'
                ]).draw();
            });

            // callback handler that will be called on failure
            request.fail(function (jqXHR, textStatus, errorThrown) {
                $("#student_add_fail").show();
            });
        }
    });

    $('.modal').on('hidden.bs.modal', function(e)
    {
        $(this).removeData();
    }) ;
});