require "etl-pipeline/version"

module Pipeline
  module Parser
    class Base
      def parse
      end
    end

    class CSVParser < Pipeline::Parser::Base
      attr_accessor :attribute_matrix, :model, :items
      def initialize
        @attribute_matrix = Hash.new
        @items            = Array.new
      end

      def coerce(input, output)
        @attribute_matrix.each do |attr, prok|
        end
      end

      def parse(file_path, options={})
        CSV.foreach(file_path, options) do |csv|
          obj = @model.new
          coerce csv, obj
          yield csv
        end
      end

      def register_model(model)
        self.model = model
      end

      def match(attribute, prok)
        @attribute_matrix[attribute.to_sym] = prok
      end
    end
  end

  module Model
    class Base

      def attributes
        attributes_hash = Hash.new
        self.instance_variables.each do |attr|
          attributes_hash.store(attr[1..-1].to_sym, instance_eval(attr.to_s))
        end
        attributes_hash
      end

      def format
      end

      def formatted_attributes
        attr_hash = attributes
        attr_hash.each do |k,v|
          begin
            attr_hash[k] = send("format_#{k}".to_sym, v)
          rescue NoMethodError => e
            # No formatter defined, use passed value as formatted value
            attr_hash[k] = v.to_s
          end
        end

        attr_hash
      end
    end
  end

  module Importer
    class Base
    end
  end

  class Base
    attr_accessor :parser, :importer

    def initialize
      @parser   = Pipeline::Parser::Base
      @importer = Pipeline::Importer::Base
    end

    def parse *args
      parser.parse *args
    end

    def import *args
      importer.import *args
    end

  end
end
