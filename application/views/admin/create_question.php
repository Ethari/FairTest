<div class = "container-fluid">
    <div class = "row" style = "margin-bottom: 20px; ">
        <div class="col-lg-12 nopadding">
            <div class="alert alert-info">
                <strong>Create a new question</strong>
            </div>
        </div>
    </div>

    <div class = "row" style = "margin-bottom: 20px;">
        <label for = "question_name">Description</label>
        <textarea class = "form-control" type = "text" id = "tf_question_name"></textarea>
    </div>
    <div class = "row" style = "margin-bottom: 20px;">
        <label for = "question_tags">Tags</label>
        <input class = "form-control" type = "text" id = "question_tags" placeholder = "e.g. programming, oop, classes, inheritance">
    </div>
    <div class = "row">
        <div class="form-group">
            <label for="sel1">Select type of question:</label>
            <select class="form-control" id="question_type_select">
                <option id = "none">-select-</option>
                <?php
                foreach($question_types as $question_type){
                    echo "<option id = ".$question_type['page'].">".$question_type['name']."</option>";
                }
                ?>
            </select>
        </div>
    </div>

