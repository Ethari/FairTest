var test_questions = [];
var questions_order = [];
var test_id = null;
var time_started;
$(document).ajaxStop(function () {

});


$(function() {
    test_id = $(".exam_id").attr('id');
    getQuestionsForTest(test_id);
    saveAnswers(test_id);

    $(".exam_id").on('click', '.next_question_btn', function(){
        console.log('click');
        $('#pagination-container').pagination('next')
    });


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

function saveAnswers(test_id){
    $(".exam_id").on('change', '.true_false_answer', function(){
        var answer = $(this).val();
        var question_id = $(this).attr('question_id');
        var answer_id = $(this).attr('answer_id');

        var data = {
            answer: answer,
            question_id: question_id,
            subquestion_id: answer_id,
            scheduled_test_id: test_id
        };

        saveAnswerAjax(data);
    });

    $(".exam_id").on('click', '.mc_checkbox_answer', function(){
        var answer = $(this).prop('checked');
        var question_id = $(this).attr('question_id');
        var answer_id = $(this).attr('answer_id');

        var data = {
            answer: answer,
            question_id: question_id,
            subquestion_id: answer_id,
            scheduled_test_id: test_id
        };
        saveAnswerAjax(data);
    });

}

function saveAnswerAjax(answer){
    var ajax = $.ajax({
        method: "POST",
        url: BASE_URL + "exams/saveTestAnswer",
        data: answer
    });

    ajax.done(function() {
    });

    // callback handler that will be called on failure
    ajax.fail(function(jqXHR) {
        console.log(jqXHR);
    });

}

function startClock(time){
    var clock = $('.your-clock').FlipClock(5,{
        autoStart: false,
        countdown: true,
        callbacks: {
            start: function() {
                console.log("Start");
            },
            stop: function() {
                console.log("Stop");
            },
        }
    });

    clock.start();
    clock.setTime(time);
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

function generateQuestionPage(test_questions, page){

    var pagination = $('#pagination-container').pagination({
        dataSource: test_questions,
        pageSize: 1,
        pageNumber: page,
        className: '',
        afterPreviousOnClick: function(){
            console.log("Render");
        },
        afterPageOnClick: function(data){
            var pageNumber = data.currentTarget.dataset.num;
            //console.log(this('go', 2));
            //getQuestionsForTest(test_id, pageNumber);
        },
        afterNextOnClick: function(){
            console.log("Render");
        },
        callback: function(data, pagination) {
            // template method of yourself
            console.log("Come on");
            var html = questionList(data);
            $('#data-container').html(html);
            Prism.highlightAll();
        }
    });
  /*
    var pagination = $('#pagination-container').pagination({
        dataSource: function(done) {
            $.ajax({
                method: 'POST',
                url: BASE_URL + 'exams/getGeneratedTestContent',
                data: {
                    id: test_id
                },
                success: function(response) {
                    console.log(response);
                    done(response);
                }
            });
        },
        locator: 'test',
        totalNumber: 10,
        pageSize: 1,
        ajax: {
            beforeSend: function() {
                $('#data-container').html('Loading data from flickr.com ...');
            }
        },
        callback: function(data, pagination) {
            // template method of yourself
            var html = questionList(data);
            $('#data-container').html(html);
            Prism.highlightAll();
        }
    })*/
}

function questionList(data) {
    var html;
    var id = data[0][1];
    //var test = getSpecificQuestion(id);
    $.each(data, function(index, item){
        html += getSpecificQuestion(id);
    });
    return html;
}

function getQuestionsForTest(test_id, page_number){
    var request = $.ajax({
        method: "POST",
        url: BASE_URL + "exams/getGeneratedTestContent",
        data: {
            id: test_id
        }
    });

    request.done(function (response, textStatus, jqXHR) {
        console.log(response);
        if(response === 'exam_error'){
            window.location.replace(BASE_URL + 'exams');
        }

        var questions = JSON.parse(response);
        startClock(questions.time_left);
        delete(questions.time_left);
        $.each(questions, function(key, value) {
            var type = value.type;
            var id = value.question_id;
            questions_order.unshift(id);

            console.log(questions);

            if(type === "true_false"){
                generateTrueFalseQuestion(value);
            } else if(type === "multiple_choice"){
                generateMultipleChoiceQuestion(value);
            } else if(type === "open_question"){
                generateOpenQuestion(value);
            }
        });

        sortQuestions();
        console.log(test_questions);
        generateQuestionPage(test_questions, page_number);
        //startClock(10);
    });

    // callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR);
    });

}

function getSpecificQuestion(question_id){
    var request = $.ajax({
        method: "POST",
        url: BASE_URL + "exams/getQuestionContent",
        data: {
            question_id: question_id,
            test_id: test_id
        }
    });

    request.done(function (response, textStatus, jqXHR) {
        var question = JSON.parse(response);
        var type = question.type;
        var question_html;

        if(type === "true_false"){
            question_html = generateTrueFalseQuestion(question, 'return');
        } else if(type === "multiple_choice"){
            question_html = generateMultipleChoiceQuestion(question, 'return');
        } else if(type === "open_question"){
            question_html = generateOpenQuestion(question, 'return');
        }
        console.log("MAAAAAM");
        console.log(question_html);
        return question_html;
    });

    // callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown) {
        console.log(jqXHR);
    });
}

function generateTrueFalseQuestion(question, action){
    var question_html = generateQuestionHeading(question, 'true_false');

    $.each(question.answers, function(key, value) {
        var description = value.description;
        var answer = value.selected_answer;
        var true_answer = '';
        var false_answer = '';
        if(answer != null){
            if(answer == 'true'){
                var true_answer = 'selected';
            } else{
                var false_answer = 'selected';
            }
        }

        question_html +='<div class = "form-group tf_question">'+
            '<div class = "col-sm-2 text-center nopadding" style = "padding-right: 20px;">'+
            '<select class = "form-control true_false_answer" question_id = "'+question.question_id+'" answer_id = "'+value.id+'">' +
                '<option value = "unknown"></option>' +
                '<option '+true_answer+' value = "true">True</option>' +
                '<option '+false_answer+' value = "false">False</option>' +
            '</select>'+
            '</div>'+
            '<div class = "col-sm-10 nopadding">' +
            '<label class = "form-control tf_question_text" name = "0">'+description+'</label>'+
            '</div>'+
            '</div>';
    });

    question_html += questionClose(question);

    if(action == 'return'){
        return question_html;
    } else{
        test_questions.push([question_html, question.question_id]);
    }
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

    var question_html = '<div class="row create_row panel panel-default question_panel">' +
        '<div class="panel-heading"><strong>'+ question_name +'</strong></div>'+
        '<div class="panel-body">'+
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

function generateMultipleChoiceQuestion(question, action){
    var question_html = generateQuestionHeading(question, 'multiple_choice');

    $.each(question.answers, function(key, value) {
        var description = value.description;
        if(value.selected_answer != null){
            console.log(value.selected_answer);
            var checked = 'checked';
        } else{
            var checked = '';
        }
        question_html +=
            '<div class = "mc_question form-group" style = "margin: 0 auto;">'+
                '<div class = "form-control">' +
                    '<input '+checked+' class = "mc_checkbox_answer" style = "float: left;" type = "checkbox" question_id = "'+question.question_id+'" answer_id = "'+value.id+'">'+
                    '<label class = "mc_question_text">'+description+'</label>'+
                '</div>'+
            '</div>';
    });

    question_html += questionClose(question);

    if(action == 'return'){
        return question_html;
    } else{
        test_questions.push([question_html, question.question_id]);
    }
}

function generateOpenQuestion(question, action){
    var question_html = generateQuestionHeading(question, 'open');
    question_html += "<textarea question_id = '"+question.question_id+"'class = 'form-control' rows = '4' placeholder = 'Type your answer here...'></textarea>";
    question_html += questionClose(question);
    //$(".questions_field").append(question_html);

    if(action == 'return'){
        return question_html;
    } else{
        test_questions.push([question_html, question.question_id]);
    }
}

function questionClose(question){
        var html =
                '</div>'+
            '<div class="panel-footer clearfix">' +
                '<button class = "btn btn-primary right next_question_btn">Next</button>' +
            '</div>' +
        '</div>';



    return html;
}
