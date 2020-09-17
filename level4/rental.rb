class Rental
  def self.export_fields
    %w[id actions]
  end

  def owner_fee
    price - total_commission
  end

  def driver_fee
    price
  end

  def actions
    [
      {
        who: "driver",
        type: "debit",
        amount: driver_fee.round
      },
      {
        who: "owner",
        type: "credit",
        amount: owner_fee.round
      },
      {
        who: "insurance",
        type: "credit",
        amount: insurance_fee.round
      },
      {
        who: "assistance",
        type: "credit",
        amount: assistance_fee.round
      },
      {
        who: "drivy",
        type: "credit",
        amount: drivy_fee.round
      }
    ]
  end
end
