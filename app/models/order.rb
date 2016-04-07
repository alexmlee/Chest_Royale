class Order < ActiveRecord::Base
	# define_attribute_methods :list

	belongs_to :user

	attr_accessor :number_of_matches


	# def list
	# 	@list
	# end

	# def list=(val)
	# 	list_will_change! unless val == @list
	# 	@list = val
	# end

	# def save
	# 	super
	# 	changes_applied
	# end

	# def reload!
	# 	super
	# 	clear_changes_information
	# end

	# def rollback!
	# 	super
	# 	clear_changes_information
	# end

	def find_position
		user_order = []
		user_position = 0
		#reading from file
		# # f = File.open("order.rb", "r")
		# f.each_line do |line|
		# 	user_order << line.to_s.gsub("\n","")
		# 	user_position += 1
		# end
		#.gsub(",","").split
		self.chests.each do |chest|
			user_order << chest
			user_position += 1
		end

		known_order_length = user_order.length

		list_order_matches = 0
		subset_number = 1 
		matching_subsets = {}
		puts "Your order is #{known_order_length} chests long"
		if self.chests.present?
			OFFICIAL_ORDER.each_cons(known_order_length) do |subset|

				if subset == user_order
					p "Subset position number = #{subset_number}"
					# p "Current position index =  #{subset_number - 1}"
					p "Potential next 4 chests are: #{OFFICIAL_ORDER[(subset_number-1+known_order_length)..(subset_number-1+known_order_length+4)]}"
					list_order_matches += 1
					matching_subsets[subset_number] = user_order
				end
				subset_number += 1
			end
		end
	### EXAMPLE
	# user order 7 long
	# matched so started on 8
	#															   - 0 - 1 - 2 - 3 - 4 - 5 - 6
	# 0 -  1 - 2 - 3 - 4 - 5 - 6 - 7 - 8 - 9 - 10- 11- 12- 13- 14- 15
		# subset_number = 9 
		# user_order.length = 7
		#answer should be index 8, spot 9

		number_of_matches = matching_subsets.length
		p 'Flag A'
		if number_of_matches == 1
			current_position_number = subset_number
			current_position_index = subset_number - 1
			p "We found a match. Your current position is #{}"

		elsif number_of_matches > 1
			p "We found #{number_of_matches} number of matches. Not quite conclusive"
			puts 
		end
		number_of_matches
		
	end
end