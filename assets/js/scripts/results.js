$(function(){
    var testTable = $('#test_table').DataTable({
        "ordering": false
    });


    $('.start_exam_btn').click(function(){
        var test_id = $(this).attr('id');
        var scheduled_test_id = $(this).closest('tr').attr('id');
        var request = $.ajax({
            method: "POST",
            url: BASE_URL + "exams/constructExam",
            data: {
                test_id: test_id,
                scheduled_test_id: scheduled_test_id
            }
        });

        request.done(function (id) {
            console.log("ID: " + id);
            window.location.href = BASE_URL + 'exams/take_exam/' + id;
        });

        // callback handler that will be called on failure
        request.fail(function (jqXHR, textStatus, errorThrown) {
            // log the error to the console
            alert(
                "The following error occured: " + textStatus, errorThrown);
        });

    });
});
