require 'gmail'

class Meil
  def initialize
    gmail = Gmail.connect('email', 'password')
    puts 'why'
    puts gmail.logged_in?
    gmail.inbox.find(:from => "contact@mailer.humblebundle.com").each do |games|
      puts "#{games.subject} "
      print "Loetud\n" if games.read?

    end
  end


end

mail = Meil.new()
