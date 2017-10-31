<div class = "row true_false" style = "display: none;">

    <div class="row" style = "margin-top: 2%;">
        <div class="col-lg-12">
            <div class="alert alert-info">
                Use the <i class="fa fa-plus-circle" aria-hidden="true"></i> button to add up to 10 questions.
            </div>
        </div>
    </div>
    <div class = "col-sm-12" style = "margin-bottom: 10px; padding-left: 0;">
        <button class = "btn btn-primary tf_remove_question" style = "float: right;"><i class="fa fa-minus-circle" aria-hidden="true"></i></button>
        <button class = "btn btn-danger tf_add_question" style = "float: right;"><i class="fa fa-plus-circle" aria-hidden="true"></i></button>
    </div>

    <div class = "col-sm-10 nopadding">
        <label>Questions</label>
    </div>
    <div class = "col-sm-2">
        <label>Correct answer</label>
    </div>

    <form id="true_false_form" method = "POST" action = "<?php echo base_url() ?>questions/create_tf_question">
        <div class = "form-group tf_question">
            <div class = "col-sm-10 nopadding">
                <input type = "hidden" name = "value0"  value = "true">
                <input class = "form-control tf_question_text" name = "0" placeholder = "Question description" required>
            </div>
            <div class = "col-sm-2 text-center">
                <label class = "form-control tf_answer true_answer" name = "0">True</label>
            </div>
        </div>
    </form>
</div>