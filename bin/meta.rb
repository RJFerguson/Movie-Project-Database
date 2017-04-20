class Meta_methods

  attr_accessor :movie

  def initialize
    puts "Here's the place to find out information about movies in general"
    show_methods
    puts "Choose what information you'd like to access, (method,parameters needed)"
    choice = gets.chomp.downcase
    puts "Enter parameters"
    params = gets.chomp.downcase
    puts Movie.send(choice.to_sym, params)
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
    puts ans
  end

end
