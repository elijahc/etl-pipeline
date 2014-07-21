require "etl-pipeline/version"

module Pipeline
  module Parser
    class CSV
      def parse(file_path, options={})
        CSV.foreach(file_path, options) do |csv|
          yield csv
        end
      end
    end
  end

  module Model
    class Base
    end
  end

  module Importer
    class Base
    end
  end

  class Base
    attr_accessor :model, :parser, :importer

    def parse *args
      parser.parse *args
    end

  end
end
