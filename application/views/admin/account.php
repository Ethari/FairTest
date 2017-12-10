<div class="row">
    <?php
    if($this->session->flashdata('account_changed') != null){
        echo  '<div class = "col-lg-12"><div class="alert alert-success alert-dismissable">
              <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
              <strong>Success!</strong> Account updated.
            </div></div>';
    }
    ?>
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-user fa-fw"></i> Account</h3>
            </div>
            <form id = "change_admin_account">
                <div class="panel-body">
                    <div class = "form-group">
                        <label for = "fName">First name</label>
                        <input type = "text" name = "fName" class = "form-control" value = "<?php echo $user['firstName'] ?>">
                    </div>
                    <div class = "form-group">
                        <label for = "lName">Last name</label>
                        <input type = "text" name = "lName" class = "form-control" value = "<?php echo $user['lastName'] ?>">
                    </div>
                    <div class = "form-group">
                       <label for = "current_password">Current password</label>
                       <input type = "password" name = "current_password" class = "form-control" placeholder="Your current password">
                    </div>
                    <div class = "form-group">
                        <label for = "new_password">New password</label>
                        <input type = "password" id = "new_password" name = "new_password" class = "form-control" placeholder="New password">
                    </div>
                    <div class = "form-group">
                        <label for = "repeat_new_password">Repeat new password</label>
                        <input type = "password" class = "form-control" name = "repeat_new_password" placeholder="Repeat new password">
                    </div>
                </div>
                <div class = "panel-footer clearfix">
                    <button style = "float: right;" class = "btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/admin_account.js"); ?>"></script>