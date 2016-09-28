class TodoList
	def initialize(list_of_items)
		@list_of_items = list_of_items
	end

	def get_items
		@list_of_items
	end

	def add_item(item)
		@list_of_items << item
		@list_of_items
	end

	def delete_item(item)
		@list_of_items.delete(item)
		@list_of_items
	end

	def get_item(index)
		@list_of_items[index]
	end
end