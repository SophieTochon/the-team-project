require "google_drive"
require "gmail"
require_relative "scrapping"

class SendEmail
	attr_accessor :my_tab

	def initialize
		@my_tab = Scrapping.new.perform
	end

	def perform
		go_through_all_the_lines
	end

	# Créer un spreadsheet et le remplir avec un hash connu (un nom en colonne A, un mail en colonne B)

	def create_a_spreadsheet_and_fill_it_with_a_tab
		session = GoogleDrive::Session.from_config("config_seb.json")
		spreadsheet = session.create_spreadsheet(title = "My League Project")
	  	ws = spreadsheet.worksheets[0]

		n = 1
		@my_tab.each do |mail|
			ws[n,1] = mail
			n += 1
		end
		ws.save
		return ws
	end

	# Envoyer un mail au "mail" en colonne B du spreasheet, correspondant au "first_name" en colonne A

	def send_email_to_line(mail)

		gmail = Gmail.connect("#", "#")
		gmail.deliver do

			to mail
			subject "Invitation pour My League Project"
			html_part do
	    		content_type "text/html; charset=UTF-8"
	    		body "Bonjour, 
				<br/>
				Je m'appelle Sébastien, je lance un projet qui permet de tracer ses performances sportives au travers d'une application mobile. </br>
				Voici le lien du projet : https://myleagueproject.herokuapp.com/, inscrivez-vous pour être tenu au courant. <br/>

				Je vous souhaite une bonne journée ! <br/>
				Sébastien"
	   		end
		end
	end

	# Appliquer la méthode send_email_to_line à chaque ligne du spreadsheet créé par la première méthode

	def go_through_all_the_lines

		ws = create_a_spreadsheet_and_fill_it_with_a_tab

		(1..ws.num_rows).each do |row|

			mail = ws[row, 1]

			send_email_to_line(mail)
		end
	end
end

