
# class DecisionTreeGame
#     attr_accessor :text_file, :training 
#   def initialize 
#     @training = [] 
#     @text_file = text_parser
#     seed_training(text_file)

#   end 

#   def text_parser 
#     csv_text = File.read('./decision_test.csv', :headers => true)
#     if ! csv_text.valid_encoding?
#       csv_text = csv_text.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
#     end
#     parsed_text = CSV.parse(csv_text)
#     parsed_text.shift
#     parsed_text
#   end 


#   def seed_training(text) 
#     text.each do |row| 
#       @training << [row[0],row[2],row[5],row[7],row[11]]
#     end
#   end 


# attributes = ['director_name','actor_2_name','actor_1_name','actor_3_name']
# dec_tree = DecisionTree::ID3Tree.new(attributes, training, 'rating', :discrete)
# dec_tree.train
# test = ["Ron Howard", "Scarlett Johansson", "Rosario Dawson","Natalya Bondarchuk", 6.5]
# decision = dec_tree.predict(test)
# puts "Predicted: #{decision} ... Guess: #{test.last}"; 
