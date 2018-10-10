class CashRegister

  attr_reader :discount
  attr_accessor :total, :last_transaction, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity=1)
    @total = @total + (price*quantity)
    quantity.times do
      @items << title
    end
    @last_transaction = (price*quantity)
  end

  def apply_discount
    if @total != 0
      @total = (@total - (@total*(discount/100.00))).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
