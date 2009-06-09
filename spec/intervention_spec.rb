require File.dirname(__FILE__) + '/spec_helper'

describe Intervention do
  
  describe 'Debate y resolución definitiva de la proposición no de ley formulada por el grupo parlamentario Mixto-Aralar, para que la mitad de las plazas de la 21.ª promoción de la Ertzaintza sean para vascohablantes' do

    before(:each) do
      @intervention = Intervention.new('20070427060000007')
      @intervention.stub!(:open).
                    with("http://www.parlamento.euskadi.net/sm_splenoc/DDW?W=spl_clave='20070427060000007'").
                    and_return(open("#{$samples_dir}/sample_intervention.html"))
      @intervention.stub!(:open).
                    with("http://www.parlamento.euskadi.net/BASIS/izaro/webx/sm_splenoc/DDD/20070427060000007").
                    and_return(open("#{$samples_dir}/sample_intervention_text.txt"))
    end
  
    it "should query Intervention url" do
      @intervention.should_receive(:open).
                       with("http://www.parlamento.euskadi.net/sm_splenoc/DDW?W=spl_clave='20070427060000007'").
                       and_return(open("#{$samples_dir}/sample_intervention.html"))
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

    it "should not be approved" do
      @intervention.subject_treated.should == 'Se rechaza'
    end   

    it "should get the txt format url" do
      @intervention.txt_url.should == 'http://www.parlamento.euskadi.net/BASIS/izaro/webx/sm_splenoc/DDD/20070427060000007'
    end   

    it "should get the full txt version" do
      @intervention.full_txt.should == open("#{$samples_dir}/sample_intervention_text.txt").read
    end   

    it "should get the pdf format url" do
      @intervention.pdf_url.should == 'http://www.parlamento.euskadi.net/pdfdocs/publi/2/08/000060.pdf#7'
    end   

    it "should get the videos" do
      @intervention.videos.should be_an_instance_of(Array)
      @intervention.videos.should_not be_empty
      @intervention.videos.should include(
            {"Ezenarro Egurbide, Aintzane (GP Mixto-Aralar) (16:51)  (256 K)  (56 K) " =>
             "http://bideoak.parlam.euskadi.net/ramgen/bideoak/08/00/20070427/2007042700_02_256k.rm?usehostname&start=01:36:47.7&end=01:40:30.0"})
    end   


  end

end