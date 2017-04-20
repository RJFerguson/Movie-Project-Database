
class Meta_methods

  attr_accessor :movie

  def initialize
    puts "Here's the place to find out information about movies in general"
    puts show_methods
    puts "Choose what information you'd like to access, (method,parameters needed)"
    choice = gets.chomp.downcase
    if choice.include?('1')
      puts "Enter parameters"
      params = gets.chomp.downcase
      puts Movie.send(choice.to_sym, params)
    else
      puts Movie.send(choice.to_sym)
    end
    puts "Would you like to run another query?"
    resp = gets.chomp.downcase
    if resp == "yes"
    Meta_methods.new()
    end
  end

  def show_methods
    ans = []
    methodz = Movie.methods(false) - ActiveRecord::Base.methods
    methodz.split(' ')
    methodz.each do |method|
      temp = method.to_s
      temp = temp.split('_')
      if !(temp[0] == "before" || temp[0] == "after")
        ans << method
      end
    end
    ans
  end

end
