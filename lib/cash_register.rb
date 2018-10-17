require 'pry'

class CashRegister
  attr_accessor :total, :discount

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @all_items = []
    @total_price
  end

  def add_item(title, price, quantity=1)
    quantity.times do
      @all_items << title
    end
    @total_price = @total += quantity * price
  end

  def apply_discount
    #if self.discount == @discount
    if @discount != 0
      current_dis = @discount.to_f / 100
      subraction_amount = current_dis * @total
      @total -= subraction_amount
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    #binding.pry
     end
  end

  def items
    @all_items
  end

  def void_last_transaction
    @total -= @total_price
  end

end
