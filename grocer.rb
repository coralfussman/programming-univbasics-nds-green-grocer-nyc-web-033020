def find_item_by_name_in_collection(name, collection)
index = 0
while index < collection.count do
  if collection[index][:item] == name
    return collection[index]
    end
     index += 1
  end
  nil
end

def consolidate_cart(cart)

  new_cart = [ ]
  count = 0
  while count < cart.size
new_cart_item = find_item_by_name_in_collection(cart[count][:item], new_cart)
if new_cart_item != nil
       new_cart_item[:count] += 1
     else
       new_cart_item = {
         :item => cart[count][:item],
         :price => cart[count][:price],
         :clearance => cart[count][:clearance],
         :count => 1
       }
       new_cart << new_cart_item
     end
     count += 1
   end
   new_cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
end

def apply_coupons(cart, coupons)

  counter = 0
  while counter < coupons.count
cart_item  = find_item_by_name_in_collection(coupons[counter][:item], cart)
coupon_item_name = "#{coupons[counter][:item]} W/COUPON"
cart_item_with_coupon = find_item_by_name_in_collection(coupon_item_name, cart)
if cart_item && cart_item[:count] >= coupons[counter][:num]
  if cart_item_with_coupon
          cart_item_with_coupon[:coupon] += coupons[counter][:num]
          cart_item[:coupon] -= coupons[counter][:num]
        else
          cart_item_with_coupon = {
            item: coupon_item_name,
            price: coupons[counter][:cost] / coupons[counter][:num],
            count: coupons[counter][:num],
            clearance: cart_item[:clearance]
          }
          cart << cart_item_with_coupon
          cart_item[:count] -= coupons[counter][:num]
        end
      end
      counter += 1
    end
    cart
  end
def apply_clearance(cart)

  index = 0
 while index < cart.length do
   item = cart[index]
   if item[:clearance]
     item[:price] -= (item[:price] * 0.2)
     item[:price].round(2)
   end
   index += 1
 end
 cart
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
    coupon_applied_cart = apply_coupons(consolidated_cart, coupons)
    final_cart = apply_clearance(coupon_applied_cart)

    grand_total = 0
    index = 0
    while index < final_cart.length do
      item = final_cart[index]
      grand_total += item[:price] * item[:count]
      index += 1
    end
    grand_total -= grand_total * 0.1 if grand_total > 100
    grand_total

  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
