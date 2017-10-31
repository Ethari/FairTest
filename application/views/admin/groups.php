<div id="newGroupModal" class="modal fade"role="dialog">
    <div class="modal-dialog" style = "margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">New group</h4>
            </div>
            <div class="modal-body">
                <div id = "group_error" class="alert alert-danger" style = "display:none;">
                    <strong>Error!</strong> Group already exists.
                </div>
                <form id = "new_group_form">
                    <div class="form-group">
                        <label for="group_name">Name</label>
                        <input type="text" class="form-control" name = "name" id="group_name" placeholder="Enter the name of the group.">
                    </div>
                    <div class="form-group">
                        <label for="group_course">Course</label>
                        <select class="form-control" name = "course" id="group_course">
                            <?php
                            foreach($courses as $course){
                                echo "<option value = '{$course['course_id']}'>".$course['name']."</option>";
                            }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="group_day">Day</label>
                        <select name = "day" class="form-control" id="group_day">
                            <option>Monday</option>
                            <option>Tuesday</option>
                            <option>Wednesday</option>
                            <option>Thursday</option>
                            <option>Friday</option>
                            <option>Saturday</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="group_hour">Hour</label>
                        <input type="text" name = "hour" class="timepicker form-control" id="group_hour"">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>

    </div>
</div>

<div class="row">
    <button id = "new_group" class="pull-right btn btn-primary button-right" data-toggle="modal" data-target="#newGroupModal" style = "margin: 20px;">New group</button>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-users fa-fw"></i> Groups</h3>
            </div>
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
                            <th class="col-xs-3">Name</th>
                            <th class="col-xs-2">Course</th>
                            <th class="col-xs-2">Day</th>
                            <th class="col-xs-2">Hour</th>
                            <th class="col-xs-1">Students</th>
                            <th class="col-xs-1"></th>
                            <th class="col-xs-1"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach($groups as $group){
                            echo "
                    <tr>
                        <td>".$group['name']."</td>
                        <td>".$group['course_name']."</td>
                        <td>".$group['day']."</td>
                        <td>".$group['hour']."</td>
                        <td>".$group['num_of_studs']."</td>
                       
                        <td><a href = '".base_url()."groups/students/".$group['id']."'><button  class='btn btn-primary viewStudents'>Students</button></a></td>
                        <td><button id = ".$group['id']." class='btn btn-danger deleteGroup'>Delete</button></a></td>
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

<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/admin_groups.js"); ?>"></script>