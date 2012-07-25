module Watirmark
  module Model
    class UploadCSV < Simple
      require 'csv'
      require 'tempfile'

      def create_csv(table)
        log.info("Creating temporary CSV: #{csv_file}")
        log.info(table.inspect)
        CSV.open(csv_file, 'wb') do |csv|
          table.each do |line|
            csv << line
          end
        end
      end

      def csv_file
        @file ||= Tempfile.new(['csv_data', '.csv'])
        @file.path
      end

    end
  end
end
