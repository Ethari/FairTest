$(function() {

    var questionsTable = $('#questions_table').DataTable( {
        "columns": [
            null,
            null,
            null,
            null,
            { "orderable": false },
            { "orderable": false }
        ],
        "order": [[ 3, "desc" ]]

    } );

    $('#question_create').click(function () {
        $('.sidebar_active').removeClass("sidebar_active");
        $('.admin-panel').load(BASE_URL + "questions", "test");
        $(this).parent().addClass("sidebar_active");
    });
});