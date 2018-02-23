require 'rubygems'
require 'nokogiri' 
require 'open-uri'

class Scrapping
  attr_accessor :page, :email, :tab_email

  def perform
    @tab_email = []
    i = 1
    for i in (1..6)
	  @page = Nokogiri::HTML(open("http://www.bordeaux.fr/ebx/pgResultAssociation.psml?_nfpb=true&_pageLabel=pgResultAssociation&classofcontent=pageSpecifique&id=2088&nom=&activite1=Toutes&activite2=Toutes&type=S&quartier=all&whichPage=#{i}"))
	  @email = @page.css('span.block a')
	  @email.each do |email|
	  	if email.text != ""
		  @tab_email.push(email.text.to_s) 
	    end
	  end
	end
	return @tab_email
  end
end