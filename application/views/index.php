<!-- Header -->
<?php

print_r($this->session->userdata());
?>
?>
<header>
    <div class="container" id="maincontent" tabindex="-1">
        <div class="row">
            <div class="col-lg-12">
                <div class="intro-text">
                    <div class="row">
                        <h1 class="name grettings_message">
                            <?php
                            if($this->session->has_userdata('name')){
                                echo "Hello, " . $this->session->userdata('name') . "!";
                            } else{
                                echo "FairTest";
                            }
                            ?>
                        </h1>
                    </div>
                    <div class = "row" style = "<?php echo $this->session->has_userdata('name') ? 'display: none;' : '';  ?>">
                        <span class="skills">Please log into the system.</span>
                        <div class="login_panel" style = "width: 50%; margin: 0 auto; margin-top: 5%;">
                            <div id = "login_fail" class="alert alert-warning alert-dismissable" style = "display: none;">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>Error!</strong><br> Invalid username or password.
                            </div>
                            <form class = "login-input" id = "login-form">
                                <div class="form-group">
                                    <label for="username">Username:</label>
                                    <input type="text" placeholder = "Username" name = "username" class="form-control" id="username" required>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password:</label>
                                    <input type="password" placeholder = "Password" name = "password" class="form-control" id="password" required>
                                </div>
                                <button type="submit" class="btn btn-primary" style="width: 100px;">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
