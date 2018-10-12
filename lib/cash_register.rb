
require 'pry'
class CashRegister
  @@all = []
  attr_accessor :discount, :total, :items, :last_transaction

  def initialize (discount = 0, total_discount = 0)
    @total = 0
    @discount = discount
    @total_discount = total_discount
    @items = []
    @last_transaction = []
  end

  def add_item (name, price, quantity = 1)
    self.total += price*quantity
    @total_discount =  price*quantity*discount/100
    @last_transaction.push(name, price, quantity)
    quantity.times do
      @items.push(name)
    end
  end

  def apply_discount
    @total -= @total_discount
    # binding.pry
    if @discount == 0
      "There is no discount to apply."
    else
      "After the discount, the total comes to $#{@total}."
    end

  end

  def void_last_transaction
    @total -= @last_transaction[1] * @last_transaction[2]
  end





end
