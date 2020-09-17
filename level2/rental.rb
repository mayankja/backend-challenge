class Rental

  def self.export_fields
    %w[id price]
  end

  def cal_discount_for_days(days)
    dis_per, rem_days = case days
                        when 1 then [0, 0]
                        when 2..4 then [10, 1]
                        when 5..10 then [30, 4]
                        else [50, 10]
                        end
    day_price = car.price_per_day.percent_of(dis_per)
    dis_price = day_price * (days - rem_days)
    [dis_price, rem_days]
  end


  def discount_for_days
    days = rental_days
    price_cal = 0
    while days > 0 do
      dec_price, days = cal_discount_for_days(days)
      price_cal += dec_price
    end
    price_cal
  end

  def price
    price_for_days + price_for_kms - discount_for_days
  end
end
