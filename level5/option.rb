class Option < Base
  attr_accessor :id, :rental_id, :type

  def self.root_key
    "options"
  end

  def self.import_fields
    %w[id rental_id type]
  end
end
