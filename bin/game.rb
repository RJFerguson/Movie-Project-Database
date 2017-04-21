require 'csv'
require 'decisiontree'
class DecisionTreeGame
    attr_accessor :text_file, :training, :test, :dec_tree 
  def initialize 
    @training = [] 
    @test = [] 
    @text_file = text_parser
    seed_training(text_file)
    who_to_check
    predic_training
    tester(test)
  end 

  def text_parser 
    csv_text = File.read('./test_data.csv', :headers => true)
    if ! csv_text.valid_encoding?
      csv_text = csv_text.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
    end
    parsed_text = CSV.parse(csv_text)
    parsed_text.shift
    parsed_text
  end 

  def seed_training(text) 
    text.each do |row| 

      @training << [row[0],row[2],row[5],row[7],row[11]]
    end
  end 

  def who_to_check 
    puts "Please enter a director"
    @test[0] = gets.chomp 
    puts "please enter an actor"
    @test[1] = gets.chomp 
    puts "please enter an actor"
    @test[2] = gets.chomp 
    puts "please enter one last actor" 
    @test[3] = gets.chomp 
  # test = ["Ron Howard", "Scarlett Johansson", "Rosario Dawson","Natalya Bondarchuk"]
    @test 
  end 


  def predic_training 
    attributes = ['director_name','actor_2_name','actor_1_name','actor_3_name']
    @dec_tree = DecisionTree::ID3Tree.new(attributes, @training, 'rating', :discrete)
    @dec_tree.train
  end 

  def tester(test)
    decision = @dec_tree.predict(test)
    puts "Predicted: #{decision} IMDB Score" 
    redo_all_of_this
  end 

  def redo_all_of_this
    puts "Do you want to play again? (Y/n)"
    user_input = gets.chomp 
    if user_input == "Y" || user_input == "y"
      who_to_check
      tester(test)
    else 
      puts "OK...Goodbye!"
    end 
  end 

end 