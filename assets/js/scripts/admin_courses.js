$(function() {


    $('#course_table').DataTable( {
        "columns": [
            null,
            null,
            null,
            { "orderable": false }
        ]
    } );

    $('#wrapper').on("click", "#new_course" ,function(){
        $( "#course_error" ).hide();
    });

    $('#wrapper').on("click", ".deleteCourse" ,function(){
        if (confirm('Deleting this course will also delete all questions associated with this course.')) {
            var el = $(this);
            var id = $(this).attr('id');
            $.ajax({
                method: "POST",
                url: BASE_URL + "courses/deleteCourse",
                data: { course_id: id}
            })

            .done(function(id) {
                alert("ok");
                $(el).parent().parent().remove();

            })

            .fail(function(id){
                alert("FAIL: " + id);
            });
        }

    });


    $('#wrapper').on("submit", "#new_course_form" , function(){
        var course_name = $( "input:first" ).val();
        if(course_name){
            $.ajax({
                method: "POST",
                url: BASE_URL + "courses/newCourse",
                data: { name: course_name}
            })

                .done(function(id) {
                    if(id != -1){
                        console.log(id)
                        $('#course_table > tbody:last-child').append('<tr><td>'+course_name+'</td><td>0</td><td>0</td>' +
                            '<td><button id = "'+id+'"  class="btn btn-danger deleteCourse">Delete</button></td></tr>');
                        $('#newCourseModal').modal('hide');
                        $('#course_name').val('');
                        $('#course_success').show();
                    } else{
                        console.log("fail");
                        $( "#course_error" ).show();
                    }

                })

                .fail(function(id){
                    alert("FAIL: " + id);
                });
        } else{
            alert("Else");
        }
        event.preventDefault();
    });

    $('.modal').on('hidden.bs.modal', function(e)
    {
        $(this).removeData();
    }) ;


});