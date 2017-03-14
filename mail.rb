require 'gmail'

class Meil
  def initialize
    @gmail = Gmail.connect('username', 'password')

  end
  def user_input
    prompt = "> "
    puts "What types of email do you wish me to list? (games, sale, school)"
    print prompt

    while input = gets.chomp
      case input
        when "games"
          @gmail.inbox.find(:unread, :from => "contact@mailer.humblebundle.com").each do |humblebundle|
            puts "Humble Bundle: #{humblebundle.subject} "
          end
          @gmail.inbox.find(:unread,:from => "newsletter@gog.com").each do |gog|
            puts "GOG: #{gog.subject} "
          end
          puts prompt
        when "sales"
          @gmail.inbox.find(:unread, :from => "uudiskiri@chilli.ee").each do |chilli|
            puts "Chilli: #{chilli.subject.to_s} "
          end
          @gmail.inbox.find(:unread, :from => "raamatud@apollo.ee").each do |books|
            puts "Apollo: #{books.subject} "
          end
          @gmail.inbox.find(:unread, :from => "buy@aliexpress.com").each do |ali|
            puts "Aliexpress: #{ali.subject} "
          end
        when "school"
          @gmail.inbox.find(:unread, :to => "no-reply@ois.ee").each do |school|
            puts "ITK: #{school.subject} "
          end

        when "end"
          break
        else
          puts "Not a valid request, try again"
          puts prompt

      end

    end


  end
end

mail = Meil.new()
mail.user_input