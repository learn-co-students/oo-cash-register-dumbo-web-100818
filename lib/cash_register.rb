require 'pry'
class CashRegister
  attr_accessor :discount, :total
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @yar = []
  end

  def add_item(title, price, amount = 1)
    amount.times do
      (@yar << title)
    end
    @total += price * amount
  end

def apply_discount
  if @discount > 0
  @total = @total - (@total * @discount * 0.01)
  "After the discount, the total comes to $#{@total.to_i}."
else
  "There is no discount to apply."
end
end

def items
@yar
end

def void_last_transaction
  @total = 0
end

end
