<div class = "test_id" id = "<?php echo $test['generated_test_id']?>"></div>

<div class = "container-fluid">
    <div class = "row create_row">
        <div class="col-lg-12 nopadding">
            <div class="alert alert-info">
                <strong><?php echo $test['student_name'];?></strong>
            </div>
        </div>
    </div>
    <div class = "row create_row">
        <button <?php if(!isset($test['result']['fully_evaluated'])){
            echo "disabled";
        }?> class = "btn btn-danger left" id = "finish_grading">Finish grading the exam</button>
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