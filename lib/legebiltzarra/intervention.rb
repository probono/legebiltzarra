class Intervention
  BASE_URL = "http://www.parlamento.euskadi.net"
  attr_accessor :id, :url

  def initialize(id)
    @id = id
    @url = "#{BASE_URL}/sm_splenoc/DDW?W=spl_clave='#{self.id}'"
  end
  
  def file_number
    document.at("th[text()^='Núm. expediente']").next_sibling.content.strip rescue nil
  end
  
  def session_date
    document.at("th[text()^='Fecha sesión:']").next_sibling.content.strip rescue nil
  end
    
  def diary_number
    document.at("th[text()^='Número Diario:']").next_sibling.content.strip rescue nil
  end

  def subject_number
    document.at("th[text()^='Número asunto:']").next_sibling.content.strip rescue nil
  end

  def subject_title
    document.at("th[text()^='Título asunto:']").next_sibling.content.strip rescue nil
  end

  def original_initiative
    document.at("th[text()^='Iniciativa origen:']").next_sibling.content.strip rescue nil
  end
    
  def document
     @document ||= Nokogiri::HTML(open(self.url).read)
  end
end
