module Import
  module ClassMethods
    def import_file(import_path)
      File.open import_path
    end

    def import_json_data(import_path)
      JSON.load import_file(import_path)
    end

    def root_key
      nil
    end

    def import_fields
      []
    end

    def import_data(import_path)
      data = import_json_data(import_path)
      data[root_key].each { |d| yield(d) }
    end

    def import(import_path)
      import_data(import_path) do |data|
        obj = new
        import_fields.each do |field|
          obj.send("#{field}=", data[field])
        end
      end
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end
