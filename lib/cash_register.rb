require 'pry'

class CashRegister

  attr_accessor :discount, :total
  attr_reader

  ITEMS = []

  def initialize(employee_discount=0)
    @total = 0
    @discount = employee_discount
    @items = []
  end

  def add_item(title,price,quantity=1)
    new_items = price * quantity
    quantity.times do
    @items.push(title)
  end
    @total+=new_items
  end

  def apply_discount
    if @discount != 0
      float_d = @discount.to_f/100.0
      actual_discount = @total * float_d
      @total-=actual_discount
      @total.to_i
      return "After the discount, the total comes to $#{total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = 0
  end

end
