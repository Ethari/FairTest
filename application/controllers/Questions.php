<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Questions extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('Questions_Model');
        $this->load->model('Courses_Model');
        $this->load->model('loader');
    }

    public function index(){
        $questions = $this->Questions_Model->getQuestions(1);
        $courses = $this->Courses_Model->getCourses(1);
        $data = array(
            'questions' => $questions,
            'courses' => $courses
        );

        $this->loader->generateAdminPage('questions', $data);
    }

    public function details($id){
        $result = $this->Questions_Model->getQuestionDetails($id);
        echo "<pre>";
        print_r($result);
        echo "</pre>";
    }

    public function create_question(){
        $courses = $this->Courses_Model->getCourses(1);
        $question_types = $this->Questions_Model->getQuestionsTypes(1);
        $data = array(
            'courses' => $courses,
            'question_types' => $question_types
        );

        $this->loader->generateAdminPage('create_question', $data);
    }

    public function create_tf_question(){
        $question = $_POST;
        $description = $question['description'];
        unset($question['description']);

        $tags = $question['tags'];
        unset($question['tags']);

        $attributes = array(
            'description' => $description,
            'type' => 1,
            'tags' => $tags
        );
        $this->Questions_Model->createTrueFalseQuestion($question, $attributes);
        $this->session->set_flashdata('questions_added', $description);
    }

    public function create_mc_question(){
        $question = $_POST;
        $description = ($question['description']);
        unset($question['description']);

        $tags = $question['tags'];
        unset($question['tags']);

        $attributes = array(
            'description' => $description,
            'type' => 2,
            'tags' => $tags
        );
        ChromePhp::log($_POST);
        $this->Questions_Model->createMultipleChoiceQuestion($question, $attributes);
        $this->session->set_flashdata('questions_added', $description);
    }

    public function create_open_question(){
        $question = $_POST;
        $description = ($question['description']);
        unset($question['description']);

        $tags = $question['tags'];
        unset($question['tags']);

        $attributes = array(
            'description' => $description,
            'type' => 3,
            'tags' => $tags
        );
        ChromePhp::log($_POST);
        $this->Questions_Model->createOpenQuestion($question, $attributes);
        $this->session->set_flashdata('questions_added', $description);
    }

    public function create_parametric_question(){
        $question = $_POST;
        $php_formula = $question['php_formula'];
        $parameters = $question['parameters'];
        $tags = $question['tags'];
        $description = $question['description'];

        $attributes = array(
            'description' => $description,
            'type' => 4,
            'tags' => $tags,
            'parametric_formula' => $php_formula
        );

        $this->Questions_Model->createParametricQuestion($attributes, $parameters);
        $this->session->set_flashdata('questions_added', $description);
    }

    public function get_question_details(){
        $id = $_POST['id'];
        $test_id = $_POST['test_id'];
        $question_details = $this->Questions_Model->getQuestionDetails($id, $test_id);
        echo json_encode($question_details);
    }

    public function test_parametric_formula(){
        $formula = $_POST;
        ChromePhp::log($formula);
        $result = $this->Questions_Model->calculateParametricFormula($formula);
        ChromePhp::log($result);
        echo $result;
    }

}
