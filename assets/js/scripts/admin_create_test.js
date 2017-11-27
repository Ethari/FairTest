var test_questions = [];
var questions_order = [];
var test_id;

$(document).ajaxStop(function () {
    sortQuestions();
    generateQuestionPage(test_questions);
});


$(function() {
    test_id = $(".test_id").attr('id');
    getQuestionsForTest();
    saveQuestionDetails();

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

function saveQuestionAjax(data, pageNum){
    var ajax = $.ajax({
        method: "POST",
        url: BASE_URL + "tests/update_question_points",
        data: data
    });

    ajax.done(function (response, textStatus, jqXHR) {
        window.location.href = BASE_URL + "tests/create_test/"+test_id+"?pageNum="+pageNum;
    });

    // callback handler that will be called on failure
    ajax.fail(function (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR);
    });
}

function saveQuestionDetails(){
    $("#data-container").on('click', '.saveQuestionBtn', function(){
        var pageNum = $('#pagination-container').pagination('getSelectedPageNum');
        console.log(pageNum);

        var question_id = $(this).attr('id');
        var points_correct_answer = $("#data-container .correct_answer").val();
        var points_incorrect_answer = $("#data-container .incorrect_answer").val();
        var automatic_eval = $("#data-container .automatic_eval").prop('checked');

        if(automatic_eval == null){
            automatic_eval = false;
        }


        var data = {
            type: 'correct_answer_points',
            correct_answer_points: points_correct_answer,
            incorrect_answer_points: points_incorrect_answer,
            automatic_eval: automatic_eval,
            question_id: question_id,
            test_id: test_id
        };

        console.log(data);
        saveQuestionAjax(data, pageNum);
    });

}

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
    var pageNum = getParameterByName('pageNum');
    console.log(pageNum);
    if(pageNum == null){
        pageNum = 1;
    }
    $('#pagination-container').pagination({
        dataSource: test_questions,
        pageSize: 1,
        pageNumber: pageNum,
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
        console.log(questions);
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
            } else if(type === "4"){
                generateParametricQuestion(id);
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
            id: id,
            test_id: test_id
        }
    });

    request.done(function (response) {
        question = JSON.parse(response);

        question_html = '<div class="row create_row panel panel-default question_panel">' +
            '<div class="panel-heading clearfix">' +
            'True False Question' +
            '<button class = "btn btn-danger deleteQuestionBtn right" id = "'+question.id+'">Delete</button>' +
            '</div>'+
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
            id: id,
            test_id: test_id
        }
    });

    request.done(function (response) {
        question = JSON.parse(response);

        var question_html = '<div class="row create_row panel panel-default question_panel">' +
            '<div class="panel-heading clearfix">' +
            'Multiple Choice Question' +
            '<button class = "btn btn-danger deleteQuestionBtn right" id = "'+question.id+'">Delete</button>' +
            '</div>'+
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
            id: id,
            test_id: test_id
        }
    });

    request.done(function (response, textStatus, jqXHR) {
        question = JSON.parse(response);

        var question_html = '<div class="row create_row panel panel-default question_panel">' +
            '<div class="panel-heading clearfix">' +
            'Open Question' +
            '<button class = "btn btn-danger deleteQuestionBtn right" id = "'+question.id+'">Delete</button>' +
            '</div>'+
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

function generateParametricQuestion(id){
    var question;

    var request = $.ajax({
        method: "POST",
        url: BASE_URL + "questions/get_question_details",
        data: {
            id: id,
            test_id: test_id
        }
    });

    request.done(function (response, textStatus, jqXHR) {
        question = JSON.parse(response);

        var question_html = '<div class="row create_row panel panel-default question_panel">' +
            '<div class="panel-heading clearfix">' +
            'Parametric Question' +
            '<button class = "btn btn-danger deleteQuestionBtn right" id = "'+question.id+'">Delete</button>' +
            '</div>'+
            '<div class="panel-body">'+ question.description +
            '<div class="row" style = "padding-left: 15px;"> Parametric formula: <strong>'+ question.parametric_formula + '</strong></div>';

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
    console.log(question);
    if(question.type != 3){
        var html =
            '<div class = "col-sm-3 nopadding" style = "margin-top: 20px !important;"><label>Points for correct answer</label>' +
            '<input class = "questionPoints correct_answer form-control" style = "width: 150px;" id = "'+question.id+'" value = "'+question.correct_answer_points+'"></div>' +
            '<div class = "col-sm-3 nopadding" style = "margin-top: 20px !important;"><label>Points for incorrect answer</label>' +
            '<input class = "questionPoints incorrect_answer form-control" style = "width: 150px;" id = "'+question.id+'" value = "'+question.incorrect_answer_points+'"></div>' +
            '<div class = "col-sm-3 nopadding" style = "margin-top: 20px !important;"><label>Automatic evaluation</label><br>' +
            '<input '+(question.automatic_eval == true ? "checked" : "")+' class = "automatic_eval" type = "checkbox" id = "'+question.id+'"></div>' +
            '<div class = "col-sm-3 nopadding text-center"><button class = "btn btn-info saveQuestionBtn" id = "'+question.id+'">Save</button></div>' +
            '</div>'+
            '</div>';
    } else{
        var html =
            '<div class = "col-sm-4 nopadding" style = "margin-top: 20px !important;"><label>Points for correct answer</label>' +
            '<input class = "questionPoints correct_answer form-control" style = "width: 150px;" id = "'+question.id+'" value = "'+question.correct_answer_points+'"></div>' +
            '<div class = "col-sm-4 nopadding" style = "margin-top: 20px !important;"><label>Points for incorrect answer</label>' +
            '<input class = "questionPoints incorrect_answer form-control" style = "width: 150px;" id = "'+question.id+'" value = "'+question.incorrect_answer_points+'"></div>' +
            '<div class = "col-sm-4 nopadding text-center">' +
            '<button class = "btn btn-info saveQuestionBtn" id = "'+question.id+'">Save</button></div>' +
            '</div>'+
            '</div>';
    }


    return html;
}

function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}