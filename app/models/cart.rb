class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line|
        total += line.item.price * line.quantity
    end
    total
  end

  def add_item(item_id)
    line_item = line_items.find_by(item_id: item_id)
   if line_item
    line_item.quantity += 1
   else
    line_item = line_items.build(item_id: item_id)
   end
    line_item
 end

 def check_out
   #binding.pry
   line_items.each do |line_item|
     line_item.item.inventory -= line_item.quantity
     line_item.item.save
   end
   user.remove_cart
   update(status: "submitted")
 end
end
