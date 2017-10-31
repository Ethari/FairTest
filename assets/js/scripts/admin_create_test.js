var test_questions = [];
var questions_order = [];
$(document).ajaxStop(function () {
    sortQuestions();
    generateQuestionPage(test_questions);
});


$(function() {
    var test_id = $(".test_id").attr('id');
    getQuestionsForTest();

    $("#save_test").click(function(){
        var test_name = $("#test_name").val();
        var test_topic = $("#test_topic").val();

        var ajax = $.ajax({
            method: "POST",
            url: BASE_URL + "tests/saveTestParams",
            data: {
                test_name: test_name,
                test_id: test_id,
                test_topic: test_topic
            }
        });

        ajax.done(function() {
            location.reload();
        });

        // callback handler that will be called on failure
        ajax.fail(function(jqXHR) {
            console.log(jqXHR);
        });
    });

    $(".addQuestion").click(function () {
        var question_id = $(this).attr('id');
        var ajax = $.ajax({
            method: "POST",
            url: BASE_URL + "tests/add_question_to_test",
            data: {
                question_id: question_id,
                test_id: test_id
            }
        });

        ajax.done(function (response, textStatus, jqXHR) {
            location.reload();
        });

        // callback handler that will be called on failure
        ajax.fail(function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
        });
    });

    $("#wrapper").on('click', '.deleteQuestionBtn',function () {
        var id = $(this).attr('id');
        var ajax = $.ajax({
            method: "POST",
            url: BASE_URL + "tests/delete_question",
            data: {
                question_id: id,
                test_id: test_id
            }
        });

        ajax.done(function (response, textStatus, jqXHR) {
            location.reload();
        });

        // callback handler that will be called on failure
        ajax.fail(function (jqXHR, textStatus, errorThrown) {
            console.log(jqXHR);
        });
    });


    $('#questions_table').DataTable( {
        "pageLength": 5,
        "bLengthChange": false,
        "columns": [
            null,
            null,
            null,
            null,
            { "orderable": false }
        ]
    } );
});

function sortQuestions(){
    var orderedQuestions = new Array(test_questions.length);

    $.each(test_questions, function(index, item){
        var element = item[1];
        $.each(questions_order, function(key, value){
            if(element == value){
                orderedQuestions[key] = item;
            }
        });
    });

    orderedQuestions.reverse();
    test_questions = orderedQuestions;
}

function generateQuestionPage(test_questions){
    $('#pagination-container').pagination({
        dataSource: test_questions,
        pageSize: 1,
        className: '',
        callback: function(data, pagination) {
            // template method of yourself
            var html = questionList(data);
            $('#data-container').html(html);
            Prism.highlightAll();
        }
    });
}

function questionList(data) {
    var html = "";
    $.each(data, function(index, item){
        html += item[0];
    });
    return html;
}

function getQuestionsForTest(){
    var test_id = $(".test_id").attr('id');
    var request = $.ajax({
        method: "POST",
        url: BASE_URL + "tests/get_test_questions",
        data: {
            id: test_id
        }
    });

    request.done(function (response, textStatus, jqXHR) {
        var questions = JSON.parse(response);
        $.each(questions, function(key, value) {
            var type = value.type;
            var id = value.question_id;
            questions_order.push(id);

            console.log(questions);

            if(type === "1"){
                generateTrueFalseQuestion(id);
            } else if(type === "2"){
                generateMultipleChoiceQuestion(id);
            } else if(type === "3"){
                generateOpenQuestion(id);
            }
        });
    });

    // callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR);
    });

}

function generateTrueFalseQuestion(id){

    var question;
    var question_html;

    var request = $.ajax({
        method: "POST",
        url: BASE_URL + "questions/get_question_details",
        data: {
            id: id
        }
    });

    request.done(function (response) {
        question = JSON.parse(response);

        question_html = '<div class="row create_row panel panel-default question_panel">' +
            '<div class="panel-heading">True False Question</div>'+
            '<div class="panel-body">' + question.description;


        $.each(question.questions, function(key, value) {
            var answer = value.answer;
            var description = value.description;
            question_html +='<div class = "form-group tf_question">'+
                '<div class = "col-sm-10 nopadding">' +
                '<label class = "form-control tf_question_text" name = "0">'+description+'</label>'+
                '</div>'+
                '<div class = "col-sm-2 text-center">'+
                '<label class = "form-control tf_answer '+answer+'_answer" name = "0">'+answer+'</label>'+
                '</div>'+
                '</div>';
        });

        question_html += questionClose(question);
        test_questions.push([question_html, id]);
    });

    // callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR);
    });
}

function generateMultipleChoiceQuestion(id){

    var question;

    var request = $.ajax({
        method: "POST",
        url: BASE_URL + "questions/get_question_details",
        data: {
            id: id
        }
    });

    request.done(function (response, textStatus, jqXHR) {
        question = JSON.parse(response);

        var question_html = '<div class="row create_row panel panel-default question_panel">' +
            '<div class="panel-heading">Multiple Choice Question</div>'+
            '<div class="panel-body">'+  question.description;



        $.each(question.questions, function(key, value) {
            var answer;
            var description = value.description;
            if(value.answer === "true"){
                answer = "yes";
            } else{
                answer = "no";
            }

            question_html +='<div class = "mc_question form-group">'+
                '<div class = "col-sm-10 nopadding">' +
                '<label class = "form-control mc_question_text" name = "0">'+description+'</label>'+
                '</div>'+
                '<div class = "col-sm-2 text-center">'+
                '<label class = "form-control mc_answer mc_'+answer+'" name = "0">'+answer+'</label>'+
                '</div>'+
                '</div>';
        });

        question_html += questionClose(question);

        test_questions.push([question_html, id]);
    });

    // callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR);
    });
}

function generateOpenQuestion(id){
    var question;

    var request = $.ajax({
        method: "POST",
        url: BASE_URL + "questions/get_question_details",
        data: {
            id: id
        }
    });

    request.done(function (response, textStatus, jqXHR) {
        question = JSON.parse(response);

        var question_html = '<div class="row create_row panel panel-default question_panel">' +
            '<div class="panel-heading">Open Question</div>'+
            '<div class="panel-body">'+ question.description;

        question_html += questionClose(question);
        //$(".questions_field").append(question_html);

        test_questions.push([question_html, id]);

    });

    // callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR);
    });
}

function questionClose(question){
    if(question.type != 3){
        var html =
            '<div class = "col-sm-4 nopadding" style = "margin-top: 20px !important;"><label>Points for correct answer</label>' +
            '<input class = "questionPoints form-control" style = "width: 150px;" id = "'+question.id+'" value = "1"></div>' +
            '<div class = "col-sm-4 nopadding" style = "margin-top: 20px !important;"><label>Points for incorrect answer</label>' +
            '<input class = "questionPoints form-control" style = "width: 150px;" id = "'+question.id+'" value = "0"></div>' +
            '<div class = "col-sm-4 nopadding" style = "margin-top: 20px !important;"><label>Automatic evaluation</label><br>' +
            '<input type = "checkbox" id = "'+question.id+'"></div>' +
            '<button class = "btn btn-danger deleteQuestionBtn" id = "'+question.id+'">Delete</button>' +
            '</div>'+
            '</div>';
    } else{
        var html =
            '<button class = "btn btn-danger deleteQuestionBtn" id = "'+question.id+'">Delete</button>' +
            '</div>'+
            '</div>';
    }


    return html;
}
