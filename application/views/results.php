<!-- Page Content -->
<div id="page-content-wrapper">
    <div class = "container-fluid exam_page">
        <div class = "row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Results</h3>
                </div>
                <div class="panel-body">
                    <div id="tests_list">
                        <table id = "test_table" class="table table-striped table-bordered table-hover text-center">
                            <thead>
                            <tr>
                                <th class="col-xs-3">Topic</th>
                                <th class="col-xs-2">Begins</th>
                                <th class="col-xs-2">Closes</th>
                                <th class="col-xs-2">Points</th>
                                <th class="col-xs-2">Results</th>
                                <th class="col-xs-1"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            foreach($results as $test){
                                if($test['results_ready']){
                                    $button_state = '';
                                } else{
                                    $button_state = "disabled";
                                }

                                $percent = round(($test['result']['total_points'])/($test['max_points'])*100, 2);

                                echo "
                                <tr id = '".$test['generated_test_id']."'>
                                <td>".$test['topic']."</td>
                                <td>".$test['start_time']."</td>
                                <td>".$test['end_time']."</td>
                                <td><strong>".$test['result']['total_points'] . "</strong> / " .$test['max_points']." points (".$percent."%)</td>
                                <td>".$test['results_time']."</td>
                                <td>
                                    <a href = '".base_url('results/view/'.$test['generated_test_id'])."'><button ".$button_state." class='show_results btn btn-primary'>Results</button></a>
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

<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/results.js"); ?>"></script>
