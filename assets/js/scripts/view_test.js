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
    gradeQuestion();
    $("#data-container").on('click', 'input:checkbox', function() {
        return false;
    });
    //saveQuestionDetails();

    $('#finish_grading').click(function(){
        var ajax = $.ajax({
            method: "POST",
            url: BASE_URL + "admin/finishGradingExam",
            data: {
                test_id: test_id
            }
        });

        ajax.done(function (response, textStatus, jqXHR) {
            window.location.href = BASE_URL + "admin";
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

function gradeQuestion(){
    $("#data-container").on('click', '.save_points', function(){
        var pageNum = $('#pagination-container').pagination('getSelectedPageNum');
        console.log(pageNum);

        var question_id = $(this).attr('id');
        var total_points = $('.question_points').val();
        var graded_test_id = test_id;


        var data = {
            total_points: total_points,
            question_id: question_id,
            graded_test_id: graded_test_id
        };

        console.log(data);
        gradeQuestionAjax(data, pageNum);
    });

}

function gradeQuestionAjax(data, pageNum){
    var ajax = $.ajax({
        method: "POST",
        url: BASE_URL + "admin/addQuestionPoints",
        data: data
    });

    ajax.done(function (response, textStatus, jqXHR) {
        window.location.href = BASE_URL + "admin/gradeTest/"+test_id+"?pageNum="+pageNum;
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
        url: BASE_URL + "results/viewGradedTest",
        data: {
            id: test_id
        }
    });

    request.done(function (response, textStatus, jqXHR) {
        var test= JSON.parse(response);

        console.log(test);
        var questions = test.result;
        $.each(questions, function(key, value) {
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
            } else if(type === "parametric"){
                generateParametricQuestion(value);
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
        var student_answer = (value.student_answer == 'true' ? "True": "False");
        if(value.answer == "true"){
            var correct = "correct_row";
        } else{
            var correct = "incorrect_row";
        }

        question_html +='<div class = "form-group tf_question">'+
            '<div class = "col-sm-2 text-center nopadding tf_question_selection">'+
            '<label class = "'+correct+' form-control">'+student_answer+'</label>' +
            '</div>'+
            '<div class = "col-sm-10 nopadding true_false_bottom">' +
            '<label class = "'+correct+' form-control tf_question_text" name = "0">'+description+'</label>'+
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
        case 'parametric':
            question_name = "Parametric question";
            break;
        case 'open':
            question_name = "Open question";

    }

    if(question.incorrect_answer_points < 0){
        var incorrect_question =
            '<div class="row">'+
            '<label class = "left exam_question_description"><strong class = "incorrect_answer_desc">'+ Math.abs(question.incorrect_answer_points)+' point(s) </strong> - incorrect answer.</label>'+
            '</div>';
    } else{
        var incorrect_question = "";
    }

    var question_html = '<div class="row create_row panel panel-default question_panel">' +
        '<div class="panel-heading clearfix"><strong>'+ question_name +'</strong><div class = "right">Your score: <strong class = "correct_answer_desc">'+question.total_points+'/'+question.correct_answer_points+' points</strong></div></div>'+
        '<div class="panel-body">'+
        '<div class="row">'+
        '<label class = "left exam_question_description"><strong class = "correct_answer_desc">'+question.correct_answer_points+' point(s) </strong> - correct answer</label>'+
        '</div>'+
        incorrect_question +
        '<div class="row">'+
        '<label class = "left exam_question_description">Description:</label>'+
        '</div>'+
        '<div class="panel panel-default">' +
        '<div class="panel-body">'+question.description+'</div>' +
        '</div>'+
        '<div class="row">'+
        '<label class = "left exam_question_description">Your answers:</label> '+
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
    question_html += "<textarea readonly question_id = '"+question.question_id+"' class = 'form-control open_question_answer' rows = '4' placeholder = 'Type your answer here...'>"+question.answer+"</textarea>";
    question_html += questionClose(question);
    //$(".questions_field").append(question_html);

    console.log("Pushing");
    console.log(question);
    test_questions.push([question_html, question.question_id]);
    console.log(test_questions);
}

function generateParametricQuestion(question){

    var question_html = generateQuestionHeading(question, 'parametric');
    question_html += "<textarea readonly question_id = '"+question.question_id+"' class = 'form-control parametric_question_answer' rows = '4' placeholder = 'Type your answer here...'>"+question.answer+"</textarea>";
    question_html +='<div class="row">';
    question_html +='<label class = "left exam_question_description" style = "margin-top: 10px;">Calculated answer: <strong style = "color: green;">'+question.calculated_result+'</strong></label>';
    question_html +='</div>';
    question_html += questionClose(question);
    //$(".questions_field").append(question_html);

    console.log("Pushing");
    console.log(question);
    test_questions.push([question_html, question.question_id]);
    console.log(test_questions);
}

function questionClose(question){

    var html =
        '</div>'+
        '<div class="panel-footer clearfix">' +
        '<label class = "left" style = "margin-right: 10px; margin-top: 5px;">Points received: '+question.total_points+' </label>'+
        '</div>' +
        '</div>';



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