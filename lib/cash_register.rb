
class CashRegister

  attr_accessor :discount, :total,  :title, :last_transaction


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @title = title
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += quantity * price
    @last_transaction = @total
    quantity.times do @items << title
  end
end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total -= @total * discount/100
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
    end
end
