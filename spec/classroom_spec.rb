require_relative '../classroom.rb'
describe  Classroom do 
  context "test the behavior of class" do
    before(:each) do 
      #arrange
      @label = '3/1'
    end
    it "test the existence of the class " do 
      #act
       classroom =  Classroom.new(@label)
      #assert 
      expect(classroom).to be_instance_of(Classroom)
    end
    it "test using no argument" do 
      #assert 
      expect {  Classroom.new }.to raise_error(ArgumentError)
    end
    it "test getting value of label from  classroom" do 
      #act
       classroom =  Classroom.new(@label)
      #assert 
      expect( classroom.label).to eq @label
    end
    it "test setting the value of label from  classroom" do 
        #act 
         classroom =  Classroom.new(@label)
         classroom.label = 'test_label'
        #assert 
        expect( classroom.label).to eq 'test_label'
    end
    it "test the existence of add_student method" do 
        #act
         classroom =  Classroom.new(@label)
        #assert 
        expect( classroom).to respond_to(:add_student)
    end
    it "test add_student method" do 
        #arrange 
        #act
         classroom = Classroom.new(@label)
         student = double('student')
         allow(student).to receive(:classroom=)
         classroom.add_student(student)
        #assert 
        expect(classroom.students[0]).to eq student
    end
  end
end