require File.dirname(__FILE__) + '/spec_helper'

describe Initiative do
  
  describe 'Para que la mitad de las plazas de la 21.ª promoción de la Ertzaintza sean para vascohablantes' do

    before(:each) do
      @initiative = Initiative.new('08\11\02\01\0386')
    end
  
    it "should be cool" do
      @initiative.tags.should be_an_instance_of(Array)
      @initiative.tags.should_not be_empty
      @initiative.tags.should == ["Policía autónoma", 
                                  "Policía autonómica", 
                                  "Oposiciones CAPV", 
                                  "Euskera", 
                                  "Selección de alumnos", 
                                  "Aplicación de la ley"]
    end   


  end

end