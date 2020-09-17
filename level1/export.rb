module Export
  module ClassMethods
    def export_file(json, export_path)
      File.open(export_path,"w") {|f| f.write(json) }
    end

    def export_json_data
      { root_key => all.collect { |obj| obj.export_data }}.to_json
    end

    def root_key
      nil
    end

    def export_fields
      []
    end

    def export(export_path)
      export_file(export_json_data, export_path)
    end
  end

  def export_data
    data = {}
    fields = self.class.export_fields
    fields.each { |f| data[f] = send(f) }
    data
  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end
