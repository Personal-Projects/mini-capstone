class Product < ApplicationRecord
  def sale_message
    if price < 45
      return "Discount Item!"
    else
      return "Everyday Value!"
    end
  end

  def tax
    return price.to_f * 0.09
  end

  def total
    return tax.to_f + price.to_f
  end
end
