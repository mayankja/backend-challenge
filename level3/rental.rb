class Rental
  def self.export_fields
    %w[id price commission]
  end

  def total_commission
    price.percent_of(30)
  end

  def insurance_fee
    total_commission.percent_of(50)
  end

  def assistance_fee
    rental_days * 100
  end

  def drivy_fee
    (total_commission - insurance_fee - assistance_fee)
  end

  def commission
    {
      insurance_fee: insurance_fee.round,
      assistance_fee: assistance_fee,
      drivy_fee: drivy_fee.round
    }
  end
end
