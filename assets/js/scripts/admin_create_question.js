$(function() {

    tinymce.init({
        selector: '#tf_question_name',
        height: 100,
        theme: 'modern',
        plugins: [
            'advlist autolink lists link image charmap print preview hr anchor pagebreak',
            'searchreplace wordcount visualblocks visualchars code fullscreen',
            'insertdatetime media nonbreaking save table contextmenu directionality',
            'emoticons template paste textcolor colorpicker textpattern imagetools codesample toc help'
        ],
        toolbar1: 'undo redo | insert | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
        toolbar2: 'print preview media | forecolor backcolor emoticons | codesample help',
        image_advtab: true,
        templates: [
            { title: 'Test template 1', content: 'Test 1' },
            { title: 'Test template 2', content: 'Test 2' }
        ],
        content_css: [
            '//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
            '//www.tinymce.com/css/codepen.min.css'
        ]
    });

    $(".parametric").on("click", ".parameter_value_checkbox", function(){
        var param = $(this).attr('param_id');
        if($(this).prop("checked") === true){
            $("#"+param).prop("disabled", true);
        } else{
            $("#"+param).prop("disabled", false);
        }
    });

    $(".parametric").on("click", "#test_parametric_answer", function(){
        var php_formula = $("#php_formula").val();
        var question_params = [];
        var values_filled = true;

        $( ".test_answer_input" ).each(function(){
            var id = $(this).attr('id');
            var id_split = id.split('_');
            var answer_id = id_split[0];
            var answer_value = $(this).val();

            if(answer_value === ""){
                values_filled = false;
            }


            var element = {};
            element.param = answer_id;
            element.value = answer_value;

            question_params.push(element);
        });

        console.log(question_params);

        if(!values_filled){
            alert("Some of the values are missing");
        } else{
            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "questions/test_parametric_formula",
                data: {
                    php_formula: php_formula,
                    question_params : question_params
                }
            });

            request.done(function (result) {
                console.log(result);
                $(".result_text").html(result);
            });

            // callback handler that will be called on failure
            request.fail(function (jqXHR) {
                alert(jqXHR.responseText);
            });
        }

    });

    $("#search_parameters").click(function(){
        var content = tinyMCE.activeEditor.getContent({format: 'text'});
        console.log(content);
        var reg = /{{([^\)])}}/g;
        var matches = content.match(reg);

        var list_content = "";
        var test_values = '<tr>'+
                            '<td>' +
                                '<div class = "col-sm-10">' +
                                    '<input class = "form-control" id = "php_formula" value = "return(Your PHP code here);">' +
                                '</div>' +
                                '<div class = "col-sm-2">' +
                                    '<button class = "btn btn-primary" id = "test_parametric_answer">Test</button>' +
                                '</div>' +
                            '</td>' +
                          '</tr>';
        if(matches != null){
            var number_of_params = matches.length;
            for (var i = 0; i < number_of_params; i++)
            {
                var param = matches[i].replace(/[{}]+/g, '');
                list_content += "<tr>" +
                                    "<td>"+param+"</td>"+
                                    "<td>" +
                                        "<input id = '"+param+"' class = 'form-control parameter_values' placeholder = 'e.g. 1,2,3'>" +
                                    "</td>"+
                                    "<td class = 'text-center'>" +
                                        "<input type = 'checkbox' param_id = '"+param+"' class = 'parameter_value_checkbox'>" +
                                    "</td>"+
                                "</tr>";
                test_values += "<tr>" +
                                    "<td>" +
                                        "<div class = 'col-sm-1 tex-center'>"+
                                            param+
                                        "</div>" +
                                        "<div class = 'col-sm-2'>" +
                                            "<input id = '"+param+"_test' class = 'test_answer_input form-control'>" +
                                        "</div>"+
                                    "</td>"+
                                "</tr>";
                console.log(param);
            }
            test_values += "<tr><td>Result: <strong class = 'result_text'></strong></td></tr>"
        } else{
            list_content += "<tr><td class = 'text-center'>No parameters detected.</td><td></td><td></td></tr>"
        }

        $("#parameters_table").html(list_content);
        $("#parametric_answer").html(test_values);

    });

    $("#true_false_form").validate({
        submitHandler: function (form) {
            var form = $("#true_false_form").serializeArray();
            form.push({name: 'description', value: tinymce.activeEditor.getContent()});
            form.push({name: 'tags', value: $("#question_tags").val()});
            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "questions/create_tf_question",
                data: form
            });

            request.done(function (id, textStatus, jqXHR) {
                window.location.replace(BASE_URL + "questions");
            });

            // callback handler that will be called on failure
            request.fail(function (jqXHR, textStatus, errorThrown) {
                console.log(jqXHR + textStatus + errorThrown)
            });
        }
    });

    $('#submit_question').click(function() {

        var type = $( "#question_type_select" ).find('option:selected').attr('id');

        if(type == 'open_question'){
            submitOpenQuestion();
        }
        else if(type == 'parametric'){
            submitParametricQuestion();
        }
        else{
            if(type == 'true_false'){
                var $form = $('#true_false_form');
            } else if(type == 'multiple_choice'){
                var $form = $('#multiple_choice_form');
            } else {

            }

            if($form.valid()){
                $form.submit();
            }
        }

    });


    $( "#question_type_select" ).change(function() {
        var section = $(this).find('option:selected').attr('id');
        if(section != "none"){
            console.log("OK")
            $('#submit_question').prop('disabled', false);
        } else{
            $('#submit_question').prop('disabled', true);
        }

        //Hide all other types
        $( "#question_type_select option" ).each(function( index ) {
            $("."+$(this).attr("id")).hide();
        });

        console.log(section);

        if(section === 'parametric'){
            $("#search_parameters").click();
        }

        $("."+section).show();
    });

    $("#true_false_form").on('click', '.tf_answer', function(){

        var id = $(this).attr('name');
        console.log("value"+id);
        if ($(this).hasClass("true_answer")){
            $(this).removeClass("true_answer");
            $(this).addClass("false_answer");
            $("#value"+id).val("false");

            $(this).text("False");
        } else{
            $(this).removeClass("false_answer");
            $(this).addClass("true_answer");
            $(this).text("True");
            $("#value"+id).val("true");
        }
    });

    $("#multiple_choice_form").validate({
        submitHandler: function (form) {
            tinyMCE.triggerSave();
            var form = $("#multiple_choice_form").serializeArray();
            form.push({name: 'description', value: tinymce.activeEditor.getContent()});
            form.push({name: 'tags', value: $("#question_tags").val()});

            var request = $.ajax({
                method: "POST",
                url: BASE_URL + "questions/create_mc_question",
                data: form
            });

            request.done(function (id, textStatus, jqXHR) {
                window.location.replace(BASE_URL + "questions");
            });

            // callback handler that will be called on failure
            request.fail(function (jqXHR, textStatus, errorThrown) {
                // log the error to the console
                alert(
                    "The following error occured: " + textStatus, errorThrown);
            });
        }
    });

    $("#multiple_choice_form").on('click', '.mc_answer', function(){

        var id = $(this).attr('name');
        console.log("value"+id);
        if ($(this).hasClass("mc_yes")){
            $(this).removeClass("mc_yes");
            $(this).addClass("mc_no");
            $("#mc_value"+id).val("false");

            $(this).text("NO");
        } else{
            $(this).removeClass("mc_no");
            $(this).addClass("mc_yes");
            $(this).text("YES");
            $("#mc_value"+id).val("true");
        }
    });

    $(".mc_add_question").click(function(){

        console.log("ADD")
        var num_of_questions = $('#multiple_choice_form .mc_question').length;
        var q_number = Number($('#multiple_choice_form .mc_question input').last().attr('name')) + 1;

        var new_question =
            '<div class = "mc_question form-group" id = "mc_question_'+q_number+'">'+
                '<div class = "col-sm-10 nopadding">'+
                    '<input type = "hidden" name = "mc_value'+q_number+'" id = "mc_value'+q_number+'" value = "false">'+
                    '<input class = "form-control mc_question_text" name = "'+q_number+'" placeholder = "Answer description" required>'+
                '</div>'+
                '<div class = "col-sm-2 text-center">'+
                    '<label class = "form-control mc_answer mc_no" name = "'+q_number+'">NO</label>'+
                '</div>'+
            '</div>';


        if(num_of_questions < 6){
            $("#multiple_choice_form").append(new_question);

        }
    });

    $(".mc_remove_question").click(function(){

        var num_of_questions = $('#multiple_choice_form .mc_question').length;
        if(num_of_questions >= 2){
            $('#multiple_choice_form .mc_question').last().remove();
        }
    });

    $(".tf_add_question").click(function(){

        var num_of_questions = $('#true_false_form .tf_question').length;
        var q_number = Number($('#true_false_form .tf_question input').last().attr('name')) + 1;

        var new_question = '<div class = "tf_question" id = "tf_question_'+q_number+'">'+
                                '<div class = "col-sm-10 nopadding">'+
                                    '<input type = "hidden" name = "value'+q_number+'" id = "value'+q_number+'" value = "true">'+
                                    '<input class = "form-control" name = "'+q_number+'" placeholder = "Question description" required>'+
                                '</div>'+
                                '<div class = "col-sm-2 text-center">'+
                                    '<label class = "form-control tf_answer true_answer" name = "'+q_number+'">True</label>'+
                                '</div>'+
                            '</div>';

        if(num_of_questions < 10){
            $("#true_false_form").append(new_question);

        }
    });

    $(".tf_remove_question").click(function(){

        var num_of_questions = $('#true_false_form .tf_question').length;
        if(num_of_questions >= 2){
            $('#true_false_form .tf_question').last().remove();
        }
    })
});

function submitParametricQuestion(){
    var form = [];
    form.push({name: 'description', value: tinymce.activeEditor.getContent()});
    form.push({name: 'tags', value: $("#question_tags").val()});

    var php_formula = $("#php_formula").val();

    var question_params = {};
    question_params.parameters = [];
    question_params.description = tinymce.activeEditor.getContent();
    question_params.tags = $("#question_tags").val();
    var values_filled = true;

    $(".parameter_values" ).each(function(){
        var answer_id = $(this).attr('id');

        var element = {};
        if($(this).prop("disabled") === true){
            element.param = answer_id;
            element.value = 'student_id';
        } else{
            var answer_values = $(this).val();
            var answer_values_cleaned = answer_values.split(',').map(function(item) {
                return item.trim();
            });

            if(answer_values === ""){
                values_filled = false;
            }

            element.param = answer_id;
            element.value = answer_values_cleaned;
            console.log(element);
        }
        question_params.parameters.push(element);
    });

    question_params.php_formula = php_formula;
    console.log(question_params);

    if(values_filled){
        var request = $.ajax({
            method: "POST",
            url: BASE_URL + "questions/create_parametric_question",
            data: question_params
        });

        request.done(function (id, textStatus, jqXHR) {
            window.location.replace(BASE_URL + "questions");
        });

        // callback handler that will be called on failure
        request.fail(function (jqXHR, textStatus, errorThrown) {
            // log the error to the console
            alert(
                "The following error occured: " + textStatus, errorThrown);
        });
    } else{
        alert("One or more parameters missing values");
    }
}

function submitOpenQuestion(){
    var form = [];
    form.push({name: 'description', value: tinymce.activeEditor.getContent()});
    form.push({name: 'tags', value: $("#question_tags").val()});

    var request = $.ajax({
        method: "POST",
        url: BASE_URL + "questions/create_open_question",
        data: form
    });

    request.done(function (id, textStatus, jqXHR) {
        window.location.replace(BASE_URL + "questions");
    });

    // callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown) {
        // log the error to the console
        alert(
            "The following error occured: " + textStatus, errorThrown);
    });
}