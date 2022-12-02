require_relative '../teacher.rb'
describe Teacher do 
  context "test the behavior of class" do
    before(:each) do 
      #arrange
      @id = 170
      @name = 'Mohamed Saleh'
      @age = 28
      @specialization = 'Math Teacher'
    end
    it "test the existence of the class " do 
      #act
      teacher = Teacher.new(@age, @specialization , @name, @id )
      #assert 
      expect(teacher).to be_instance_of(Teacher)
    end
    it "test the Teacher is a child of the Person class " do 
        #act
        teacher = Teacher.new(@age, @specialization , @name, @id )
        #assert 
        expect(teacher).to be_kind_of(Person)
    end
    it "test using only one  argument" do 
      #assert 
      expect{ Teacher.new(@age) }.to raise_error ArgumentError
    end
    it "test getting value of age from teacher" do 
      #act
      teacher = Teacher.new(@age, @specialization , @name, @id )
      #assert 
      expect(teacher.age).to eq @age
    end
    it "test getting value of name from author" do 
        #act
        teacher = Teacher.new(@age, @specialization , @name, @id )
        #assert 
        expect(teacher.name).to eq @name
    end
    it "test getting value of id from teacher" do 
        #act
        teacher = Teacher.new(@age, @specialization , @name, @id )
        #assert 
        expect(teacher.id).to eq @id
    end
    it "test getting value of parent_permission from teacher" do 
        #act
        teacher = Teacher.new(@age, @specialization , @name, @id)
        #assert 
        expect(teacher.parent_permission).to eq true
    end
    it "test getting value of specialization  from teacher" do 
        #act
        teacher = Teacher.new(@age, @specialization , @name, @id )
        #assert 
        expect(teacher.specialization).to eq @specialization
    end
    it "test setting the value of age from teacher" do 
        #act 
        teacher = Teacher.new(@age, @specialization , @name, @id )
        teacher.age = 14
        #assert 
        expect(teacher.age).to eq 14
    end
    it "test setting the value of name from teacher" do 
        #act
        teacher = Teacher.new(@age, @specialization , @name, @id )
        teacher.name = 'mostafa'
        #assert 
        expect(teacher.name).to eq 'mostafa'
    end
    it "test setting the value of id from teacher" do 
        #act 
        teacher = Teacher.new(@age, @specialization , @name, @id )
        #assert 
        expect { teacher.id = 150 }.to raise_error(NoMethodError)
    end
    it "test setting the value of specialization from teacher" do 
        #act 
        teacher = Teacher.new(@age, @specialization , @name, @id )
        #assert 
        expect { teacher.specialization = 'history teacher' }.to raise_error(NoMethodError)
    end
    it "test setting the value of rentals from teacher" do 
        #act
        teacher = Teacher.new(@age, @specialization , @name, @id )
        teacher.rentals.push('rental_object')
        #assert 
        expect(teacher.rentals[0]).to eq 'rental_object'
    end
    it "test the existence of method can_use_services?" do 
        #act
        teacher = Teacher.new(@age, @specialization , @name, @id )
        #assert 
        expect(teacher).to respond_to(:can_use_services?)
    end
    it "test the logic of method can_use_services?" do 
        teacher = Teacher.new(@age, @specialization , @name, @id)
        #assert 
        expect(teacher.can_use_services?).to be true
    end
  end
end