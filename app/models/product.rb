class Product < ApplicationRecord
  def sale_message
    if price < 2
      p "Discount Item!"
    else
      p "Everyday Value!"
    end
  end

  def tax
    '%.2f' % (price * 0.09)
  end

  def total
    tax.to_i + price.to_i
  end

  def location
    Faker::Pokemon.location
  end
end
