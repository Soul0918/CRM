class Log < ActiveRecord::Base
  # attr_accessor :id, :major, :minor, :distance, :ip, :date, :time

  # validates_presence_of :price

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |log|
        csv << log.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      log.create! row.to_hash
    end
  end

  #   def self.open_spreadsheet(file)
  #   case File.extname(file.original_filename)
  #   when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
  #   when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  #   when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end
end
