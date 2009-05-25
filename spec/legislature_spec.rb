require File.dirname(__FILE__) + '/spec_helper'

describe Legislature do
  
  describe 'Query URL' do

    it "should query actual legislature by default" do
      @legislature = Legislature.new
      @legislature.should_receive(:open).with("http://www.parlamento.euskadi.net/comparla/c_comparla_alf_LGA.html").and_return(open("#{$samples_dir}/lga.html"))
      @legislature.send(:document)
    end

    it "should query a given legislature" do
      @legislature = Legislature.new('07')
      @legislature.stub!(:open).and_return(open("#{$samples_dir}/l07.html"))
      @legislature.should_receive(:open).with("http://www.parlamento.euskadi.net/comparla/c_comparla_alf_L07.html").and_return(open("#{$samples_dir}/l07.html"))
      @legislature.send(:document)
    end

  end  
  describe "VII Legislature" do

    before(:each) do
      @legislature = Legislature.new('07')
      @legislature.stub!(:open).and_return(open("#{$samples_dir}/l07.html"))
    end
    describe "parlamentarians" do
      
      it "should be a collection of Parliamentarian instances" do
        @legislature.parliamentarians.should be_an_instance_of(Array)
        @legislature.parliamentarians.should_not be_empty
        @legislature.parliamentarians.each do |p|
          p.should be_an_instance_of(Parliamentarian)
        end
      end
      
      it "should have all the parliamentarians" do
        @legislature.parliamentarians.should have(107).parliamentarians
      end

      it "should include 'Rubalkaba Quintana'" do
        @legislature.parliamentarians.first.last_name.should include('Abascal Conde')
        @legislature.parliamentarians[50].last_name.should include('Karrera Agirrebarrena')
        @legislature.parliamentarians.last.last_name.should include('Zubimendi Izaga')
      end
            
    end
    
  end

end