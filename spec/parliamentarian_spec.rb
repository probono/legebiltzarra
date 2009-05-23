require File.dirname(__FILE__) + '/spec_helper'

describe Parliamentarian do
  
  describe 'Ezenarro Egurbide, Aintzane' do

    before(:each) do
      @parliamentarian = Parliamentarian.new('582')
      @parliamentarian.stub!(:open).and_return(open("#{$samples_dir}/sample_parliamentarian.html"))
    end
  
    it "should query Parliamentarian url" do
      @parliamentarian.should_receive(:open).
                       with("http://www.parlamento.euskadi.net/fichas/c_582_SM.html").
                       and_return(open("#{$samples_dir}/sample_parliamentarian.html"))
      @parliamentarian.send(:document)
    end
  
    it "should get full_name" do
      @parliamentarian.full_name.should == 'Ezenarro Egurbide, Aintzane'
    end   

    it "should get first_name" do
      @parliamentarian.first_name.should == 'Aintzane'
    end   

    it "should get last_name" do
      @parliamentarian.last_name.should == 'Ezenarro Egurbide'
    end   

    it "should get photo" do
      @parliamentarian.photo.should == 'http://www.parlamento.euskadi.net/img/fichas/582.jpg'
    end   
    
    it "should get profession" do
      @parliamentarian.profession.should == 'Licenciada en sociología política y periodismo.'
    end

    it "should get languages" do   
      @parliamentarian.languages.should have(2).strings
      @parliamentarian.languages.should include('Euskera')
      @parliamentarian.languages.should include('castellano')
    end
    
    it "should get email" do
      @parliamentarian.email.should == 'ezenarro_a@parlam.euskadi.net'
    end
    
    it "should get posts" do   
      @parliamentarian.posts.should have(10).strings
      @parliamentarian.posts.should include("Parlamentaria del Grupo Aralar (03.04.2009 -  )")
      @parliamentarian.posts.should include("Comisión del Estatuto Parlamentario: Vocal (15.04.2009 -  )")
      @parliamentarian.posts.should include("Parlamentaria del Grupo Mixto-Aralar (07.06.2005 - 06.01.2009)")
      @parliamentarian.posts.should include("Comisión de Educación y Cultura: Vocal (20.09.2005 - 06.01.2009)")
      @parliamentarian.posts.should include("Comisión de Derechos Humanos y Solicitudes  Ciudadanas: Vocal (20.09.2005 - 06.01.2009)")
      @parliamentarian.posts.should include("Comisión de Mujer y Juventud: Vicepresidenta (20.09.2005 - 06.01.2009)")
      @parliamentarian.posts.should include("Comisión de investigación sobre las irregularidades detectadas en torno al futuro museo Balenciaga: Vocal (13.06.2008 - 06.01.2009)")
      @parliamentarian.posts.should include("Comisión de investigación sobre las irregularidades detectadas en el museo Guggenheim Bilbao: Vocal (13.06.2008 - 06.01.2009)")
      @parliamentarian.posts.should include("Miembro de la Asamblea de Hegoalde de Aralar.   Miembro del Taller Nacional del movimiento social Elkarri, durante 6 años.")
      @parliamentarian.posts.should include("Concejal de Getaria desde 2003. Juntera en las Juntas Generales de Gipuzkoa (2003-2005)")
    end

  end

end