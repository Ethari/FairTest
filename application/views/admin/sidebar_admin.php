<!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
<div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav side-nav">
        <li <?php echo $page == 'home' ? 'class = "active"' : '';?>>
            <a href="<?php echo base_url()?>admin"><i class="fa fa-fw fa-dashboard"></i> Home</a>
        </li>
        <li <?php echo $page == 'tests' ? 'class = "active"' : '';?>>
            <a href="<?php echo base_url()?>tests"><i class="fa fa-fw fa-bar-chart-o"></i> Tests </a>
        </li>
        <li <?php echo $page == 'questions' ? 'class = "active"' : '';?>>
            <a href="<?php echo base_url()?>questions"><i class="fa fa-fw fa-question-circle-o"></i> Questions </a>
        </li>
        <li <?php echo $page == 'groups' ? 'class = "active"' : '';?>>
            <a href="<?php echo base_url()?>groups"><i class="fa fa-fw fa-users"></i> Groups </a>
        </li>
        <li <?php echo $page == 'students' ? 'class = "active"' : '';?>>
            <a href="<?php echo base_url()?>students"><i class="fa fa-fw fa-graduation-cap"></i> Students </a>
        </li>
        <li <?php echo $page == 'courses' ? 'class = "active"' : '';?>>
            <a href="<?php echo base_url()?>courses"><i class="fa fa-fw fa-list"></i> Courses</a>
        </li>
        <li <?php echo $page == 'account' ? 'class = "active"' : '';?>>
            <a href="<?php echo base_url()?>account"><i class="fa fa-fw fa-user"></i> Account </a>
        </li>
    </ul>
</div>
<!-- /.navbar-collapse -->
</nav>

<div id="page-wrapper">

    <div class="container-fluid">
