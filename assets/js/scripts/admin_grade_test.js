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
    $("#data-container").on('click', 'input:checkbox', function() {
        return false;
    });
    //saveQuestionDetails();

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

function saveQuestionAjax(data){
    var ajax = $.ajax({
        method: "POST",
        url: BASE_URL + "tests/update_question_points",
        data: data
    });

    ajax.done(function (response, textStatus, jqXHR) {
        location.reload();
    });

    // callback handler that will be called on failure
    ajax.fail(function (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR);
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
        url: BASE_URL + "admin/getUngradedTest",
        data: {
            id: test_id
        }
    });

    request.done(function (response, textStatus, jqXHR) {
        console.log(response);
        var test= JSON.parse(response);

        var questions = test.result;
        $.each(questions, function(key, value) {
            if(value.automatic_eval != 0){
                return;
            }

            console.log("QUESTION: " );
            console.log(value);
            var type = value.type;
            var id = value.question_id;
            questions_order.push(id);

            console.log(value);

            if(type === "true_false"){
                generateTrueFalseQuestion(value);
            } else if(type === "multiple_choice"){
                generateMultipleChoiceQuestion(value);
            } else if(type === "open_question"){
                generateOpenQuestion(value);
            }
        });

        console.log(questions_order);
    });

    // callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR);
    });

}


function generateTrueFalseQuestion(question){
    var question_html = generateQuestionHeading(question, 'true_false');

    $.each(question.answers, function(key, value) {
        var description = value.description;
        var answer = value.selected_answer;
        var true_answer = '';
        var false_answer = '';
        if(answer != null){
            if(answer == 'true'){
                true_answer = 'selected';
            } else{
                false_answer = 'selected';
            }
        }

        question_html +='<div class = "form-group tf_question">'+
            '<div class = "col-sm-2 text-center nopadding tf_question_selection">'+
            '<select class = "form-control true_false_answer" question_id = "'+question.question_id+'" answer_id = "'+value.id+'">' +
            '<option value = "unknown">-</option>' +
            '<option '+true_answer+' value = "true">True</option>' +
            '<option '+false_answer+' value = "false">False</option>' +
            '</select>'+
            '</div>'+
            '<div class = "col-sm-10 nopadding true_false_bottom">' +
            '<label class = "form-control tf_question_text" name = "0">'+description+'</label>'+
            '</div>'+
            '</div>';
    });

    question_html += questionClose(question);

    test_questions.push([question_html, question.question_id]);
}

function generateQuestionHeading(question, type){
    var question_name;

    switch (type){
        case 'multiple_choice':
            question_name = "Multiple choice question";
            break;
        case 'true_false':
            question_name = "True or False question";
            break;
        case 'open':
            question_name = "Open question";

    }

    if(question.incorrect_answer_points < 0){
        var incorrect_question =
            '<div class="row">'+
            '<label class = "left exam_question_description">Student shoud lose <strong class = "incorrect_answer_desc">'+ Math.abs(question.incorrect_answer_points)+' point(s) </strong>for incorrect answer.</label>'+
            '</div>';
    } else{
        var incorrect_question = "";
    }

    var question_html = '<div class="row create_row panel panel-default question_panel">' +
        '<div class="panel-heading clearfix"><strong>'+ question_name +'</strong><button class = "btn btn-info right" id = "finish_test" data-toggle="modal" data-target="#finish_test_modal">Finish test</button></div>'+
        '<div class="panel-body">'+
        '<div class="row">'+
        '<label class = "left exam_question_description">Student should receive <strong class = "correct_answer_desc">'+question.correct_answer_points+' point(s) </strong>for answering correctly.</label>'+
        '</div>'+
        incorrect_question +
        '<div class="row">'+
        '<label class = "left exam_question_description">Description:</label>'+
        '</div>'+
        '<div class="panel panel-default">' +
        '<div class="panel-body">'+question.description+'</div>' +
        '</div>'+
        '<div class="row">'+
        '<label class = "left exam_question_description">Answer:</label>'+
        '</div>';
    ;
    return question_html;
}

function generateMultipleChoiceQuestion(question){
    var question_html = generateQuestionHeading(question, 'multiple_choice');

    $.each(question.answers, function(key, value) {
        var description = value.description;
        console.log(value);
        if(value.student_answer == 'true'){
            console.log(value.student_answer);
            var checked = 'checked';
        } else{
            var checked = '';
        }

        if(value.answer == "true"){
            var correct = "correct_row";
        } else{
            var correct = "incorrect_row";
        }

        question_html +=
            '<div class = "mc_question form-group">'+
            '<div class = "form-control '+correct+'">' +
            '<input '+checked+' class = "mc_checkbox_answer" style = "float: left;" type = "checkbox" question_id = "'+question.question_id+'" answer_id = "'+value.id+'">'+
            '<label class = "mc_question_text">'+description+'</label>'+
            '</div>'+
            '</div>';
    });

    question_html += questionClose(question);


    test_questions.push([question_html, question.question_id]);
}

function generateOpenQuestion(question){

    var question_html = generateQuestionHeading(question, 'open');
    question_html += "<textarea readonly question_id = '"+question.question_id+"'class = 'form-control open_question_answer' rows = '4' placeholder = 'Type your answer here...'>"+question.answer+"</textarea>";
    question_html += questionClose(question);
    //$(".questions_field").append(question_html);

    console.log("Pushing");
    console.log(question);
    test_questions.push([question_html, question.question_id]);
    console.log(test_questions);
}

function questionClose(){
    var html =
        '</div>'+
        '<div class="panel-footer clearfix">' +
        '<label class = "left" style = "margin-right: 10px; margin-top: 5px;">Points: </label>'+
        '<input class = "left form-control question_points" style = "width: 200px;" placeholder = "Number of points">' +
        '<button class = "btn btn-primary right save_points">Save</button>' +
        '</div>' +
        '</div>';



    return html;
}
