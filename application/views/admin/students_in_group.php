<div class="row">
    <button id = "new_student" class="pull-right btn btn-primary button-right fa fa-plus-circle" data-toggle="modal" data-target="#addStudents" style = "width: 130px; margin: 20px;">&emsp;Add student</button>
</div>
<div class="row">
    <button id = "import_students" class="pull-right btn btn-primary button-right fa fa-file-text-o" data-toggle="modal" data-target="#addStudentsCSV" style = "width: 130px; margin-right: 20px;">&emsp;CSV Import</button>
</div>
<div class = "row" style = "margin-top: 2%;">
    <?php
    if($this->session->flashdata('students_added') != null){
        echo  '<div class = "col-lg-12"><div class="alert alert-success alert-dismissable">
              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
              <strong>Success!</strong> Added '.$this->session->flashdata("students_added").' student(s) to the group.
            </div></div>';
    }
    ?>
    <div class="col-lg-12">
        <div class="alert alert-info">
            <i class="fa fa-info-circle"></i>  There are <strong><?php echo count($students_group);?></strong> students enrolled to this group.
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title group_id_header"  id = "<?php echo $group_id;?>"><i class="fa fa-users fa-fw"></i> <?php echo $group_name; ?></h3>
            </div>
            <div class="panel-body">
                <div id="student_list">
                    <div id = "student_success" class="alert alert-success alert-dismissible" role="alert" style = "display:none;">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong>Success!</strong> Course added.
                    </div>
                    <table id = "groupstudents_table" class="table table-striped table-bordered table-hover text-center">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Surname</th>
                            <th>Index number</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach($students_group as $student){
                            echo "
                                <tr>
                                    <td>".$student['firstName']."</td>
                                    <td>".$student['lastName']."</td>
                                    <td>".$student['studentIndex']."</td>
                                    <td><button id = ".$student['id']." class='btn btn-primary viewStudent'>Profile</button></a></td>
                                    <td><button id = ".$student['id']." class='btn btn-danger deleteStudent'>Remove</button></a></td>
                                </tr>";
                        }
                        ?>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="addStudents" class="modal fade"role="dialog">
    <div class="modal-dialog" style = "margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Select students</h4>
            </div>
            <div class="modal-body">
                <div style = "max-height: 80vh; overflow: scroll;">
                    <table id = "students_to_add_table" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th></th>
                            <th>Name</th>
                            <th>Surname</th>
                            <th>Index number</th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach($students_not_group as $student){
                            echo "
                                    <tr>
                                        <td><input type='checkbox' class = 'student-checkbox' value= ".$student['id']."></td>
                                        <td>".$student['firstName']."</td>
                                        <td>".$student['lastName']."</td>
                                        <td>".$student['studentIndex']."</td>
                                    </tr>";
                        }
                        ?>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class = "modal-footer">
                <button id = "add_students_button" class="btn btn-primary">Submit</button>
            </div>

        </div>
    </div>
</div>

<div id="addStudentsCSV" class="modal fade"role="dialog">
    <div class="modal-dialog" style = "margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Import students from CSV</h4>
            </div>
            <div class="modal-body">
                <form action = "<?php echo base_url()?>groups/addStudentsCSV/<?php echo $group_id; ?>" method = "POST" enctype="multipart/form-data">
                    <div class="form-group" style = "padding: 5%; padding-left: 0;">
                        <input type="file" class="form-control-file"  id="csv_file" name="csv_file">
                    </div>
                    <input type = "submit" id = "add_students_csv" class="btn btn-primary"></button>
                </form>
            </div>

        </div>
    </div>
</div>




<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/admin_groups.js"); ?>"></script>