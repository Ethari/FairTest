$(function(){
    var testTable = $('#test_table').DataTable({});
    var gradeTable = $('#grade_test_table').DataTable({
        "columns": [
            null,
            null,
            null,
            null,
            { "orderable": false }
        ],
        "order": [[ 3, "desc" ]]
    });
});
