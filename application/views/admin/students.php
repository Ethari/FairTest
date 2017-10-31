<div class="row">
    <button id = "new_student" class="pull-right btn btn-primary button-right fa fa-plus-circle" data-toggle="modal" data-target="#addStudent" style = "width: 130px; margin: 15px; margin-bottom: 5px; margin-top: 5px;">&emsp;Add student</button>
</div>
<div class = "row">
    <?php
    if($this->session->flashdata('students_added') != null){
        echo  '<div class = "col-lg-12"><div class="alert alert-success alert-dismissable">
              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
              <strong>Success!</strong> Added '.$this->session->flashdata("students_added").' student(s) to the group.
            </div></div>';
    }
    ?>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-graduation-cap fa-fw"></i> Students </h3>
            </div>
            <div class="panel-body">
                <div id="student_list">
                    <div id = "student_success" class="alert alert-success alert-dismissible" role="alert" style = "display:none;">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <strong>Success!</strong> Student added.
                    </div>
                    <table id = "students_table" class="table table-striped table-bordered table-hover text-center">
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
                        foreach($students as $student){
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

<div id="addStudent" class="modal fade"role="dialog">
    <div class="modal-dialog" style = "margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">New student</h4>
            </div>
            <div class="modal-body">
                <div id = "student_add_fail" class="alert alert-danger alert-dismissible" role="alert" style = "display:none;">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>An error has occurred when adding this student.</strong>
                </div>
                <form id = "new_student_form">
                    <div class="form-group">
                        <label for="firstName">Name</label>
                        <input type="text" class="form-control" name = "firstName" id="firstName" placeholder="Student's first name.">
                    </div>
                    <div class="form-group">
                        <label for="lastName">Surname</label>
                        <input type="text" class="form-control" name = "lastName" id="lastName" placeholder="Student's last name.">
                    </div>
                    <div class="form-group">
                        <div class="form-group">
                            <label for="studentIndex">Student ID</label>
                            <input type="text" class="form-control" name = "studentIndex" id="studentIndex" placeholder="Student's index number.">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/admin_students.js"); ?>"></script>