class Rental
  def self.export_fields
    %w[id options actions]
  end

  def options
    Option.all
      .select{ |obj| obj.rental_id == id }
      .collect(&:type)
  end

  def has_option?(option)
    options.include? option
  end

  def gps_fee
    return 0 unless has_option?("gps")

    500 * rental_days
  end

  def baby_seat_fee
    return 0 unless has_option?("baby_seat")

    200 * rental_days
  end

  def additional_insurance_fee
    return 0 unless has_option?("additional_insurance")

    1000 * rental_days
  end

  def driver_fee
    price + baby_seat_fee + gps_fee + additional_insurance_fee
  end

  def owner_fee
    baby_seat_fee + gps_fee + price - total_commission
  end

  def drivy_fee
    deduction = insurance_fee + assistance_fee
    additional_insurance_fee + total_commission - deduction
  end
end
