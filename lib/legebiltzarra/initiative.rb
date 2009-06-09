class Initiative
  BASE_URL = "http://www.parlamento.euskadi.net"
  attr_accessor :id, :url

  def initialize(id)
    @id = id
    @url = "#{BASE_URL}/sm_ainiciac/DDW?W=INI_NUMEXP='#{CGI.escape(self.id)}'"
  end
  
  def tags
    document.at("th[text()^='Descriptores:']").next_sibling.inner_html.strip.split('<br>') rescue []
  end
  
  def document
    @document ||= Nokogiri::HTML(open(self.url).read)
  end
end
