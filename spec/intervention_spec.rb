require File.dirname(__FILE__) + '/spec_helper'

describe Intervention do
  
  describe 'Debate y resolución definitiva de la proposición no de ley formulada por el grupo parlamentario Mixto-Aralar, para que la mitad de las plazas de la 21.ª promoción de la Ertzaintza sean para vascohablantes' do

    before(:each) do
      @intervention = Intervention.new('20070427060000007')
      @intervention.stub!(:open).and_return(open("#{$samples_dir}/sample_intervention.html"))
    end
  
    it "should query Parliamentarian url" do
      @intervention.should_receive(:open).
                       with("http://www.parlamento.euskadi.net/sm_splenoc/DDW?W=spl_clave='20070427060000007'").
                       and_return(open("#{$samples_dir}/sample_parliamentarian.html"))
      @intervention.send(:document)
    end
    
    it "should get file number" do
      @intervention.file_number.should == '08\08\03\00\0060'
    end   

    it "should get session date" do
      @intervention.session_date.should == '27.04.2007'
    end   

    it "should get diary number" do
      @intervention.diary_number.should == '60'
    end   

    it "should get subject number" do
      @intervention.subject_number.should == '7'
    end   

    it "should get subject title" do
      @intervention.subject_title.should == 'Debate y resolución definitiva de la proposición no de ley formulada por el grupo parlamentario Mixto-Aralar, para que la mitad de las plazas de la 21.ª promoción de la Ertzaintza sean para vascohablantes'
    end   

    it "should get original initiative" do
      @intervention.original_initiative.should == '08\11\02\01\0386'
    end   


  end

end