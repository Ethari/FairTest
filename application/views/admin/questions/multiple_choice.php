<div class = "row multiple_choice" style = "display: none;">

    <div class="row" style = "margin-top: 2%;">
        <div class="col-lg-12">
            <div class="alert alert-info">
                Use the <i class="fa fa-plus-circle" aria-hidden="true"></i> button to add up to 6 options.
            </div>
        </div>
    </div>
    <div class = "col-sm-12" style = "margin-bottom: 10px; padding-left: 0;">
        <button class = "btn btn-primary mc_remove_question" style = "float: right;"><i class="fa fa-minus-circle" aria-hidden="true"></i></button>
        <button class = "btn btn-danger mc_add_question" style = "float: right;"><i class="fa fa-plus-circle" aria-hidden="true"></i></button>
    </div>

    <div class = "col-sm-10 nopadding">
        <label>Answers</label>
    </div>
    <div class = "col-sm-2">
        <label>Correct answer</label>
    </div>

    <form id="multiple_choice_form" method = "POST" action = "<?php echo base_url() ?>questions/create_mc_question">
        <div class = "mc_question form-group" id = "mc_question_1">
            <div class = "col-sm-10 nopadding">
                <input type = "hidden" name = "mc_value0"  id = "mc_value0" value = "false">
                <input class = "form-control mc_question_text" name = "0" placeholder = "Answer description" required>
            </div>
            <div class = "col-sm-2 text-center">
                <label class = "form-control mc_answer mc_no" name = "0"> NO </label>
            </div>
        </div>
    </form>
</div>