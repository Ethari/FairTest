<div class="row">
    <?php
    if($this->session->flashdata('exam_graded') != null){
        echo  '<div class = "col-lg-12"><div class="alert alert-success alert-dismissable">
              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
              <strong>Success!</strong> Exam graded.
            </div></div>';
    }
    ?>
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-fw fa-dashboard"></i> Upcoming tests</h3>
            </div>
            <div class="panel-body">
                <div id="tests_list">
                    <table id = "test_table" class="table table-striped table-bordered table-hover text-center">
                        <thead>
                        <tr>
                            <th class="col-xs-3">Name</th>
                            <th class="col-xs-4">Topic</th>
                            <th class="col-xs-2">Start</th>
                            <th class="col-xs-2">End</th>
                            <th class="col-xs-1">Total time</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach($tests as $test){
                            echo "
                    <tr>
                        <td>".$test['name']."</td>
                        <td>".$test['topic']."</td>
                        <td>".$test['start_time']."</td>
                        <td>".$test['end_time']."</td>
                        <td>".$test['test_time']."</td>
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

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-fw fa-dashboard"></i> Grade tests</h3>
            </div>
            <div class="panel-body">
                <div id="grade_test_list">
                    <table id = "grade_test_table" class="table table-striped table-bordered table-hover text-center">
                        <thead>
                        <tr>
                            <th class="col-xs-3">Name</th>
                            <th class="col-xs-3">Topic</th>
                            <th class="col-xs-3">Student</th>
                            <th class = "col-xs-3"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach($ungraded_tests as $test){
                            echo "
                    <tr>
                        <td>".$test['test_name']."</td>
                        <td>".$test['topic']."</td>
                        <td>".$test['student_name']."</td>
                        <td><a href = '".base_url("admin/gradeTest/".$test['generated_test_id'])."'><button class = 'btn btn-primary' id = '".$test['generated_test_id']."'>Grade</button></td>
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

<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/home.js"); ?>"></script>