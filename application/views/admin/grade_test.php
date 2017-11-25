<div class = "test_id" id = "<?php echo $test['generated_test_id']?>"></div>

<div class = "container-fluid">
    <div class = "row create_row">
        <p id = "student_name">Student: <?php echo $test['student_name'];?></p>
    </div>
    <div class = "row create_row">
        <label>Questions</label>
    </div>
    <div class = "row create_row">
        <div id="pagination-container" style = "margin-bottom: 10px;"></div>
        <div id="data-container"></div>
    </div>
</div>
</div>

<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/admin_grade_test.js"); ?>"></script>