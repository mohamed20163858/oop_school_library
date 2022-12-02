require_relative '../decorator'
describe Decorator do
  context 'test the behavior of class' do
    before(:all) do
      # arrange
      @nameable = double('nameable')
    end
    it 'test the existence of the class ' do
      # act
      decorator = Decorator.new(@nameable)
      # assert
      expect(decorator).to be_instance_of(Decorator)
    end
    it 'test the Decorator class is a child  of the Nameable class ' do
      # act
      decorator = Decorator.new(@nameable)
      # assert
      expect(decorator).to be_kind_of(Nameable)
    end
    it 'test the existence of correct_name method' do
      # act
      decorator = Decorator.new(@nameable)
      # assert
      expect(decorator).to respond_to(:correct_name)
    end
    it 'test the behaviour of correct name method' do
      # act
      decorator = Decorator.new(@nameable)
      allow(@nameable).to receive(:correct_name)
      # assert
      expect(decorator.correct_name).to eq @nameable.correct_name
    end
  end
end
