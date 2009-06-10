require File.dirname(__FILE__) + '/spec_helper'

describe Initiative do
  
  describe 'Para que la mitad de las plazas de la 21.ª promoción de la Ertzaintza sean para vascohablantes' do

    before(:each) do
      @initiative = Initiative.new('08\11\02\01\0386')
    end
    
    it "should get the title" do
      @initiative.title.should == 'Para que la mitad de las plazas de la 21.ª promoción de la Ertzaintza sean para vascohablantes'
    end   

    it "should get the party" do
      @initiative.party.should == 'GP Mixto-Aralar (GP Mixto-Aralar)'
    end   
    
    it "should get the type" do
      @initiative.type.should == 'Proposición no de Ley'
    end   
    it "should get the votings" do
      @initiative.votings.should be_an_instance_of(Array)
      @initiative.votings.should_not be_empty
      @initiative.votings.should == [
        {"27.04.2007 (Pleno)"=>"http://www.parlamento.euskadi.net/Votaciones/08/081102010386/00/20070427.pdf"}
      ]
    end   
  
    it "should get the tags" do
      @initiative.tags.should be_an_instance_of(Array)
      @initiative.tags.should_not be_empty
      @initiative.tags.should == [
        "Policía autónoma", 
        "Policía autonómica", 
        "Oposiciones CAPV", 
        "Euskera", 
        "Selección de alumnos", 
        "Aplicación de la ley"
      ]
    end   
    it "should get the procedures" do
      @initiative.procedures.should be_an_instance_of(Array)
      @initiative.procedures.should_not be_empty
      @initiative.procedures.should == [
        {"14.03.2007/Presentación de la iniciativa en el Registro (R.E. 7891)"=>"http://www.parlamento.euskadi.net/irud/08/00/007891.pdf"}, 
        {"28.03.2007/Envío de la iniciativa al Gobierno Vasco (R.S. 6622)"=>"http://www.parlamento.euskadi.net/irud/salida/08/00/006622.pdf"}
      ]
    end   


  end

end