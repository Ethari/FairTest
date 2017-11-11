<!-- Navigation -->]
<?php


?>
<nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header page-scroll">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand" href="<?php echo base_url();?>">FairTest</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="hidden">
                    <a href="#page-top"></a>
                </li>
                <li>
                    <a href = "<?php echo base_url() ?>admin">ADMINISTRATION</a>
                </li>
                <?php
                    if($this->session->has_userdata('username')){
                        echo '<li class="">
                                <a href = "'.base_url().'exams" id="exams">EXAMS</a>
                              </li>';
                        echo '<li class="">
                                <a href = "'.base_url().'" id="logout">LOGOUT</a>
                              </li>';
                    }
                ?>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<!-- Sidebar -->