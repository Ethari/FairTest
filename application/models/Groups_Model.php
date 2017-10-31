<?php

class Groups_Model extends CI_Model {

    public function getGroups($user){
        $sql = "SELECT g.*, c.name as 'course_name', (SELECT COUNT(student_id) FROM `groups_students` WHERE group_id = g.id) as 'num_of_studs' FROM groups g JOIN course c ON c.course_id = g.course_id WHERE g.owner = " . $user . " ORDER BY g.name";
        $query = $this->db->query($sql);

        return $query->result_array();
    }

    public function newGroup($data){
        $insert_data = array(
            'name' => $data['name'],
            'day' => $data['day'],
            'hour' => $data['hour'],
            'owner' => 1,
            'course_id' => $data['course']
        );
        $this->db->where('name', $insert_data['name']);
        $query = $this->db->get('groups');

        if ($query->num_rows()  == 0)
        {

            $this->db->insert('groups', $insert_data);
            $id = $this->db->insert_id();
            return $id;
        } else {
            return -1;
        }
    }


    public function deleteGroup($id){
        $this->db->where('id', $id);
        $this->db->delete('groups');
    }

    public function deleteStudent($student_id, $group_id){
        $this->db->where('student_id', $student_id);
        $this->db->where('group_id', $group_id);
        $this->db->delete('groups_students');
    }

    public function getGroupName($id){
        $this->db->where('id', $id);
        $query = $this->db->get('groups');
        return $query->result_array()[0]['name'];
    }

    public function getStudents($group_id){
        $sql = "SELECT s.* FROM student s JOIN groups_students gs ON gs.student_id = s.id WHERE gs.group_id = " . $group_id;
        $query = $this->db->query($sql);

        return $query->result_array();
    }

    public function getStudentsNotInGroup($group_id){
        $sql = "SELECT s.* FROM student s WHERE s.id NOT IN (SELECT student_id FROM groups_students WHERE group_id = " . $group_id ."); ";
        $query = $this->db->query($sql);

        return $query->result_array();
    }

    public function addStudentsToGroup($group_id, $student_ids){
        foreach($student_ids as $student){
            $insert_data = array(
                'student_id' => $student,
                'group_id' => $group_id
            );
            $this->db->insert('groups_students', $insert_data);
        }
    }

    public function addStudentsCSV($csv, $group_id){
        $this->load->model('Account_Model');
        $students = array();

        $separator = "\r\n";
        $line = strtok($csv, $separator);

        $line_num = 0;

        while ($line !== false) {
            if($line_num > 9){
                $student_info = explode(";", $line);
                $student = array();
                $student['studentIndex'] = substr($student_info[1], 4);
                $student['lastName'] = $student_info[2];
                $student['firstName'] = mb_convert_encoding($student_info[3], "UTF-8");
                $student_info[3];
                $students[] = $student;
                ChromePhp::log($student);

            }
            $line = strtok( $separator );
            $line_num++;
        }
        $new_students = $this->studentExists($students);
        $this->Account_Model->registerManyStudents($new_students);

        $students_added = $this->addStudentsToGroupCSV($students, $group_id);
        return $students_added;
    }

    private function addStudentsToGroupCSV($students, $group_id){
        $students_added = 0;
        foreach($students as $student){
            $this->db->where('studentIndex', $student['studentIndex']);
            $query = $this->db->get('student');
            $student_record = $query->result_array()[0];

            $this->db->where('student_id', $student_record['id']);
            $this->db->where('group_id', $group_id);
            $query2 = $this->db->get('groups_students');
            if ($query2->num_rows() == 0)
            {
                $insert_data = array(
                    'student_id' => $student_record['id'],
                    'group_id' => $group_id
                );
                $this->db->insert('groups_students', $insert_data);
                $students_added++;
            }
        }
        return $students_added;

    }

    private function studentExists($students){

        $new_students = array();

        foreach($students as $student){
            $this->db->where('studentIndex', $student['studentIndex']);
            $query = $this->db->get('student');

            echo "<br><br>";

            if ($query->num_rows() == 0)
            {
                $new_students[] = $student;
            }
        }

        return $new_students;

    }


}