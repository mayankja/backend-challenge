class Base
  include Import
  include Export

  class << self
    attr_accessor :data

    def all
      self.data[root_key] || []
    end

    def find(id)
      all.select{|obj| obj.id == id}.first
    end
  end

  def initialize
    self.class.data ||= {}
    self.class.data[self.class.root_key] ||= []
    self.class.data[self.class.root_key] << self
  end
end
