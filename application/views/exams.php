<!-- Page Content -->
<div id="page-content-wrapper">
    <div class = "container-fluid exam_page">
        <div class = "row">
            <?php
            if($this->session->flashdata('test_error') != null){
                echo  '<div class="alert alert-danger alert-dismissable">
              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
              <strong>Error!</strong> This test has ended.
            </div>';
            }
            ?>
        </div>
        <div class = "row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Upcoming exams</h3>
                </div>
                <div class="panel-body">
                    <div id="tests_list">
                        <div id = "group_success" class="alert alert-success alert-dismissible" role="alert" style = "display:none;">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <strong>Success!</strong> Test created.
                        </div>
                        <table id = "test_table" class="table table-striped table-bordered table-hover text-center">
                            <thead>
                            <tr>
                                <th class="col-xs-3">Topic</th>
                                <th class="col-xs-2">Begins</th>
                                <th class="col-xs-2">Closes</th>
                                <th class="col-xs-2">Time to complete</th>
                                <th class="col-xs-2">Results</th>
                                <th class="col-xs-1"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            foreach($tests as $test){
                                if($test['exam_started'] && $test['scheduled_id'] == null){
                                    $type = 'info';
                                    $locked = '';
                                    $text = 'Start';
                                } else if($test['exam_started'] && $test['scheduled_id'] && !$test['exam_over']){
                                    $type = 'info';
                                    $locked = '';
                                    $text = 'Continue';
                                } else if($test['exam_started'] && $test['scheduled_id'] && $test['exam_over']){
                                    $type = 'info';
                                    $locked = 'disabled';
                                    $text = 'Ended';
                                } else{
                                    $type = 'primary';
                                    $locked = 'disabled';
                                    $text = 'Start';
                                }

                                echo "
                            <tr id = '".$test['id']."'>
                                <td>".$test['topic']."</td>
                                <td>".$test['start_time']."</td>
                                <td>".$test['end_time']."</td>
                                <td>".$test['test_time']." min</td>
                                <td>".$test['result_presentation_type']."</td>
                                <td>
                                    <button id = '".$test['test_id']."' class='start_exam_btn btn btn-".$type." beginTest' ".$locked.">".$text."</button>
                                </td>
                            </tr>
                            ";}
                            ?>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/exams.js"); ?>"></script>
