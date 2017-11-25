<header class = "main_page_header">
    <div class="container" id="maincontent" tabindex="-1">
        <div class="row">
            <div class = "exam_id" id = "<?php echo $exam['id']?>"
            <div id="page-content-wrapper">
                <div class = "text-center">
                    <div class = "row">
                        <div class="your-clock"></div>
                    </div>
                    <div class = "row">
                        <div id="pagination-container"></div>
                    </div>
                </div>
                    <div id="data-container"></div>
            </div>
        </div>
        </div>
    </div>
</header>

<div id="finish_test_modal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Finishing the exam</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to finish this exam?</p>
            </div>
            <div class="modal-footer clearfix">
                <button type="button" class="btn btn-danger" id = "confirm_finish_exam" data-dismiss="modal">Finish</button>
            </div>
        </div>

    </div>
</div>



<script type="text/javascript" src="<?php echo base_url("assets/js/scripts/take_exam.js"); ?>"></script>

