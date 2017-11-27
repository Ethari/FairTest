<div class = "test_id" id = "<?php echo $test['id']?>"></div>

<div class="row">
    <button id = "add_question" class="pull-right btn btn-primary button-right fa fa-plus-circle" data-toggle="modal" data-target="#addQuestion" style = "width: 130px; margin: 20px;">&emsp;Add question </button>
</div>
    <div class = "container-fluid">
        <div class = "row create_row">
            <label for = "test_name">Name</label>
            <input class = "form-control" type = "text" id = "test_name" value = "<?php echo $test['name'];?>">
        </div>
        <div class = "row create_row">
            <label for = "test_topic">Topic</label>
            <input class = "form-control" type = "text" id = "test_topic" value = "<?php echo $test['topic'];?>">
        </div>
        <div class = "row create_row">
            <button class = "btn btn-primary" id = "save_test" style = "float: right;">Save</button>
        </div>
        <div class = "row create_row">
            <label>Questions</label>
        </div>
        <div class = "row create_row">
            <div id="pagination-container" style = "margin-bottom: 10px;"></div>
            <div id="data-container"></div>
        </div>
    </div>
</div>

<div id="addQuestion" class="modal fade" role="dialog">
    <div class="modal-dialog" style = "width: 80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Select questions</h4>
            </div>
            <div class="modal-body">
                <div style = " overflow: scroll;">
                    <table id = "questions_table" class="table table-striped table-bordered table-hover text-center">
                        <thead>
                        <tr>
                            <th>Description</th>
                            <th>Type</th>
                            <th>Tags</th>
                            <th>Date added</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach($questions as $question){
                            echo "
                                <tr>
                                    <td class = 'col-md-3' style = 'overflow: scroll;'><div class = 'questions_row'>".$question['description']."</div></td>
                                    <td class = 'col-md-3'>".$question['question_type_name']."</td>
                                    <td class = 'col-md-3'>".$question['tags']."</td>
                                    <td class = 'col-md-2'>".$question['date_added']."</td>
                                    <td class = 'col-md-1'><button id = ".$question['id']." class='btn btn-primary addQuestion'>Add</button></a></td>
                                </tr>";
                        }
                        ?>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class = "modal-footer">
                <button id = "add_question_button" class="btn btn-primary">Submit</button>
            </div>

        </div>
    </div>
</div>


<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/admin_create_test.js"); ?>"></script>