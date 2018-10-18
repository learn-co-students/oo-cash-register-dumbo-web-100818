class CashRegister
  attr_accessor :total, :discount, :last_transaction, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    # require 'pry';binding.pry
    quantity.times {items.push(title)}
    self.last_transaction = price * quantity
  end

  def discount_inverse
    (100 - discount) * 0.01
  end

  def apply_discount
    return "There is no discount to apply." if self.discount == 0
    self.total = self.total * discount_inverse
    return "After the discount, the total comes to $#{self.total.round()}."
  end

  def void_last_transaction
    self.total = self.total - last_transaction
  end
end
