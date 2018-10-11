class CashRegister
attr_reader :discount
attr_accessor :total

	def initialize(discount = nil)
		@discount = discount
		@total = 0
		@items = []
		@prices = []
	end
	def add_item(item, price, quantity = 1)
		@total += price * quantity
		quantity.times do
			@items << item
		end
		@prices << price * quantity	
	end
	def apply_discount
		if @discount == nil
			return "There is no discount to apply."
		else
			@total = @total * (1 - @discount/100.0)
			return "After the discount, the total comes to $#{@total.round(0)}."
		end
	end
	def items
		@items
	end
	def void_last_transaction
		@items.pop
		@total -= @prices.pop
	end


end
