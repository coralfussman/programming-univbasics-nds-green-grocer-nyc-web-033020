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
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
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
