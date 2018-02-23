require "google_drive"
require "gmail"
require_relative "scrapping"

# Créer un spreadsheet et le remplir avec un hash connu (un nom en colonne A, un mail en colonne B)

def create_a_spreadsheet_and_fill_it_with_a_hash
	session = GoogleDrive::Session.from_config("config.json")
	spreadsheet = session.create_spreadsheet(title = "Mails Sophie - Send Test")
  		ws = spreadsheet.worksheets[0]

	my_hash = {"Seb" => "sebastien.rombaut@hotmail.fr", "Sophie Gmail" => "sophie.tochon@gmail.com"}

	n = 1
	my_hash.each do |team_name, mail|
		ws[n,1] = team_name
		ws[n,2] = mail
		n += 1
	end
	ws.save
	return ws
end

# Envoyer un mail au "mail" en colonne B du spreasheet, correspondant au "first_name" en colonne A

def send_email_to_line(mail, first_name)

	gmail = Gmail.connect("sophie.tochon@gmail.com", "Gmailpass01")
	gmail.deliver do

		to mail
		subject "This is a test, #{first_name}"
		html_part do
    		content_type "text/html; charset=UTF-8"
    		body get_the_email_html(first_name)
   		end
	end
end

# Appliquer la méthode send_email_to_line à chaque ligne du spreadsheet créé par la première méthode

def go_through_all_the_lines

	ws = create_a_spreadsheet_and_fill_it_with_a_hash

	(1..ws.num_rows).each do |row|

		mail = ws[row, 2]
		first_name = ws[row, 1]

		send_email_to_line(mail, first_name)
	end
end

go_through_all_the_lines