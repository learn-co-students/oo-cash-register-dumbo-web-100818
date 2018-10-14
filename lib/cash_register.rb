require 'pry'
class CashRegister

attr_accessor :total, :items, :transaction
attr_reader :discount

def initialize(disc=0)
  @total = 0
  @discount = disc
  @items = []
  @transaction = []
end

def add_item(title, price, qty=1)
  old_total = self.total
  qty.times {self.items << title}
  qty.times {self.transaction << price}
  self.total = self.total += (price*qty)

end

def apply_discount(total="")
  if self.discount !=0
    self.total = self.total - (self.total/100 * self.discount)
    return "After the discount, the total comes to $#{self.total}."
  else
    return "There is no discount to apply."
  end
end

def void_last_transaction
  self.total = self.total - self.transaction[-1]
  self.items.pop
  self.transaction.pop
  #binding.pry
end


end
