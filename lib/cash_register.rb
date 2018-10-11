
require "pry"
class CashRegister
attr_accessor :discount, :total, :item, :all_items


  def initialize(discount=0)
    @total = 0
    @discount = discount
    @item = []
    @all_items = {}
  end

  def add_item(items, price, quantity=0)
   if quantity > 0
     @total +=(price * quantity)
     quantity.times do
        @item << items
     end
   else
     @total+=price
     @item << items
     @all_items[items] = price
   end
  end

  def apply_discount
    discount = (@discount / 100.to_f)
    if @discount > 0
      @total = @total - (@total * discount).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @item
  end


  def void_last_transaction
    @total = @all_items[@item[-1]]-@total
  end











end
