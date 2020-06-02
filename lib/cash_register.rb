class CashRegister
    attr_accessor :total, :discount, :cart, :transactions
   def initialize(discount = nil)
    @cart = []
    @transactions = {}
    @total = 0
    @discount = discount
   end
   def add_item(item, price, quantity = 1)
    count = 0
    until count == quantity
        @cart << item
        count += 1
    end
    transactions[item] = {
        "price" => price,
        "quantity" => quantity
    }
    @total += price * quantity
   end 
   def apply_discount
    if discount != nil
        @total -= total * (discount.to_f/100)
        "After the discount, the total comes to $#{total.to_i}."
    else
        "There is no discount to apply."
    end
   end
   def items 
    @cart
   end
   def void_last_transaction
    @total -= transactions[cart[-1]]["price"] * transactions[cart[-1]]["quantity"]
    transactions.delete(cart[-1])
    @total
   end
end