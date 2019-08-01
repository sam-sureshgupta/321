public class List_27_Example_1 {
    // Student is a wrapper class 
    public List<Student> students {set;get;}
    public List_27_Example_1(){
        //1. Initialize the students list 
        students =new List<Student>();
        addMe();
    }
    public void addMe(){
        // Create a new Instance of student  and add it list
        Student s =new Student();
        students.add(s);
    }
}