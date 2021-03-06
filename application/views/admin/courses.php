<div id="newCourseModal" class="modal fade"role="dialog">
    <div class="modal-dialog" style = "margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">New course</h4>
            </div>
            <div class="modal-body">
                <div id = "course_error" class="alert alert-danger" style = "display:none;">
                    <strong>Error!</strong> Course already exists.
                </div>
                <form id = "new_course_form">
                    <div class="form-group">
                        <label for="text">Name</label>
                        <input type="text" class="form-control" id="course_name" placeholder="Enter the name of the course.">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>

    </div>
</div>

<div class="row">
    <button id = "new_course" class="pull-right btn btn-primary button-right" data-toggle="modal" data-target="#newCourseModal" style = "margin: 20px;">New course</button>
</div>
<div class="row">
    <div class="col-lg-12">
          <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Courses</h3>
            </div>
            <div class="panel-body">
                <div id="courses_list">
                    <?php
                    if($this->session->flashdata('course_added') != null){
                        echo  '<div class = "col-lg-12"><div class="alert alert-success alert-dismissable">
                                  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                  <strong>Success!</strong> Course created.
                                </div></div>';
                                        }
                    ?>
                    <table id = "course_table" class="table table-striped table-bordered table-hover text-center">
                        <thead>
                        <tr>
                            <th>Name</th>
                            <th>Number of groups</th>
                            <th>Number of students</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach($courses as $course){
                            echo "
                    <tr>
                        <td>".$course['name']."</td>
                        <td>".$course['number_of_groups']."</td>
                        <td>".$course['number_of_students']."</td>
                        <td><button id = ".$course['course_id']." class='btn btn-danger deleteCourse'>Delete</button></td>
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

<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/admin_courses.js"); ?>"></script>