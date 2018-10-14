require 'pry'
class CashRegister

attr_accessor :total, :items, :transaction
attr_reader :discount

# this makes sure each instance initializes with a total, a discount if applicable
# and an array of items and transactions we can manipulate
# and use to keep track of inidividual items in the transaction.
def initialize(disc=0)
  @total = 0
  @discount = disc
  @items = []
  @transaction = []
end

# Stores previous quantity
# Adds item into intance of new_register
# Adds item price in transaction arry for storage
# calculates the total price and quantity of the items added
# and updates the total with them
def add_item(title, price, qty=1)
  old_total = self.total
  qty.times {self.items << title}
  qty.times {self.transaction << price}
  self.total = self.total += (price*qty)

end

# Checks to see if discount is not equal to 0
# then applies discount to current old_total
# If no discount, returns error message
def apply_discount(total="")
  if self.discount !=0
    self.total = self.total - (self.total/100 * self.discount)
    return "After the discount, the total comes to $#{self.total}."
  else
    return "There is no discount to apply."
  end
end

# Reverses the last transaction
def void_last_transaction
  self.total = self.total - (self.transaction[-1]/(1 - self.discount)
  self.items.pop
  self.transaction.pop
  #binding.pry
end


end
