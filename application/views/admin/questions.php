<div class="row">
    <a href = "<?php echo base_url(); ?>questions/create_question"><button id = "new_question" class="pull-right btn btn-primary button-right fa fa-plus-circle" style = "width: 140px; margin: 15px; margin-bottom: 5px; margin-top: 5px;">&emsp;New question </button></a>
</div>
<div class = "row">
    <?php
    if($this->session->flashdata('questions_added') != null){
        echo  '<div class = "col-lg-12"><div class="alert alert-success alert-dismissable">
              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
              <strong>Success!</strong> New question added.
            </div></div>';
    }
    ?>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-question-circle-o fa-fw"></i> Questions </h3>
            </div>
            <div class="panel-body">
                <div id="question_list">
                    <div id = "question_success" class="alert alert-success alert-dismissible" role="alert" style = "display:none;">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong>Success!</strong> Question added.
                    </div>
                    <table id = "questions_table" class="table table-striped table-bordered table-hover text-center">
                        <thead>
                        <tr>
                            <th>Description</th>
                            <th>Type</th>
                            <th>Tags</th>
                            <th>Date added</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach($questions as $question){
                            echo "
                                <tr>
                                    <td class = 'col-md-3'><div class = 'questions_row'>".$question['description']."</div></td>
                                    <td class = 'col-md-2'>".$question['type']."</td>
                                    <td class = 'col-md-3'>".$question['tags']."</td>
                                    <td class = 'col-md-2'>".$question['date_added']."</td>
                                    <td class = 'col-md-1'><a href = '".base_url()."/questions/details/".$question['id']."'><button id = ".$question['id']." class='btn btn-primary viewStudent'>Details</button></a></td>
                                    <td class = 'col-md-1'><button id = ".$question['id']." class='btn btn-danger deleteStudent'>Delete</button></a></td>
                                </tr>";
                            ChromePhp::log($question['description']);

                        }
                        ?>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/admin_questions.js"); ?>"></script>