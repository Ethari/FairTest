<div class = "test_id" id = "<?php echo $test['id']?>"></div>
<div></div>

<form id = "create_exam_form">
    <div class = "panel panel-default">
        <div class="panel-heading">Scheduling <strong><?php echo $test['name']?></strong></div>
        <div class = "panel-body" style = "max-height: 75vh; overflow: scroll;">
            <div class="panel panel-default">
                <div class="panel-heading">Exam times</div>
                <div class="panel-body">
                    <div class = "row create_row">
                        <div class = "col-md-6">
                            <label for = "test_date">Date</label>
                            <input name = "start_date" class = "form-control" type="text" id="test_date" placeholder = "Date when the exam starts">
                        </div>
                        <div class = "col-md-6">
                            <label for = "test_hour">Starting time</label>
                            <input name = "start_time" class = "form-control" type="text" id="test_start_hour">
                        </div>
                    </div>
                    <div class = "row create_row">
                        <div class = "col-md-6">
                            <label for = "test_date">Time to complete</label>
                            <input name = "test_time" class = "form-control" type="text" id="test_date" placeholder = "Number of minutes">
                        </div>
                        <div class = "col-md-6">
                            <label for = "test_hour">Closing time</label>
                            <input name = "end_time" class = "form-control" type="text" id="test_end_hour">
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Results</div>
                <div class="panel-body">
                    <label for = "result_presentation_type">When should the results be presented?</label>
                    <select name = "result_presentation_type" class = "form-control" id = "result_presentation_type" style = "margin-bottom: 15px;">
                        <option value = "end_of_exam">End of the exam</option>
                        <option value = "manual">Manual</option>
                        <option value = "specify_time">Specify time</option>
                    </select>

                    <div class = "results_options" style = "display: none;">
                        <div class = "row create_row">
                            <div class = "col-md-6">
                                <label for = "test_date">Date</label>
                                <input name = "result_date" class = "form-control" type="text" id="result_date" placeholder = "Date when the results are presented">
                            </div>
                            <div class = "col-md-6">
                                <label for = "test_hour">Time</label>
                                <input name = "result_hour" class = "form-control" type="text" id="result_hour">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">Groups</div>
                <div class="panel-body">
                    <div id="groups_list">
                        <div id = "group_success" class="alert alert-success alert-dismissible" role="alert" style = "display:none;">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <strong>Success!</strong> Course added.
                        </div>
                        <table id = "group_table" class="table table-striped table-bordered table-hover text-center">
                            <thead>
                            <tr>
                                <th class="col-xs-2"></th>
                                <th class="col-xs-3">Name</th>
                                <th class="col-xs-2">Course</th>
                                <th class="col-xs-2">Day</th>
                                <th class="col-xs-2">Hour</th>
                                <th class="col-xs-1">Students</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            foreach($groups as $group){
                                echo "
                        <tr>
                            <td><input name = 'group_".$group['id']."' type = 'checkbox' id = ".$group['id']."></td>
                            <td>".$group['name']."</td>
                            <td>".$group['course_name']."</td>
                            <td>".$group['day']."</td>
                            <td>".$group['hour']."</td>
                            <td>".$group['num_of_studs']."</td>
                        </tr>
                    ";}
                            ?>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class = "panel-footer">
            <button class = "btn btn-primary" type = "submit" id = "create_test_button" style = "float:right;">Create test</button>
            <div class="clearfix"></div>
        </div>
    </div>
</form>

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
                                    <td class = 'col-md-3'>".$question['type']."</td>
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


<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/admin_schedule_test.js"); ?>"></script>