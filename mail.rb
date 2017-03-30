require 'gmail'
require 'find'
require 'pathname'

class Meil
  def initialize
    @path =  ENV['HOME'] + "/mail.auth"
    if File.file?(@path)
      @username = IO.readlines(@path)[0]
      @password = IO.readlines(@path)[1]
    else
      puts "Please enter your email:"
      @username = gets
      puts "Please enter your password:"
      @password = gets
      puts "Would you like to save this login information?(yes, no)"
      print "> "
      while input = gets.chomp
        case input
          when "yes"
            mail_auth = File.new(@path, "w+")
            mail_auth.puts(@username)
            mail_auth.puts(@password)
            mail_auth.close
            break
          when "no"
            break
        end
      end
    end
    @gmail = Gmail.connect(@username, @password)

  end
  def user_input
    prompt = "> "
    text = "What types of email do you wish to list? (games, sales, school, end to exit)"
    if @gmail.logged_in?
      puts text
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
            puts text
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
            puts text
            puts prompt
          when "school"
            @gmail.inbox.find(:unread, :to => "no-reply@ois.ee").each do |school|
              puts "ITK: #{school.subject} "
            end
            puts text
            puts prompt
          when "end"
            break
          else
            puts "Not a valid request, try again"
            puts text
            puts prompt

        end
      end
    else
      puts "Something went wrong with the login, check your information and try again"
      exit!
    end

  end

end

Meil.new.user_input