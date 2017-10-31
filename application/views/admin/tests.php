<div class="row">
    <button id = "new_test" class="pull-right btn btn-primary button-right" style = "margin: 20px;">New test</button>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Tests</h3>
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
                            <th class="col-xs-3">Name</th>
                            <th class="col-xs-4">Topic</th>
                            <th class="col-xs-2">Number of questions</th>
                            <th class="col-xs-1"></th>
                            <th class="col-xs-1"></th>
                            <th class="col-xs-1"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach($tests as $test){
                            echo "
                    <tr>
                        <td>".$test['name']."</td>
                        <td>".$test['topic']."</td>
                        <td>".$test['number_of_questions']."</td>
                        <td><a href = '".base_url()."tests/schedule_test/".$test['id']."'><button  class='btn btn-primary scheduleTest'>Schedule</button></a></td>
                        <td><a href = '".base_url()."tests/create_test/".$test['id']."'><button id = ".$test['id']." class='btn btn-info editTest'>Edit</button></a></td>
                        <td><button id = ".$test['id']." class='btn btn-danger deleteTest'>Delete</button></a></td>
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

<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/admin_tests.js"); ?>"></script>