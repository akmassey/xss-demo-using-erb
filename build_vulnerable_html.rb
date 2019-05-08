require 'erb'
require 'csv'

@csv_data = CSV.read('data.csv')
@table = []
@csv_data.each_with_index do |entry, index|
  @table << [index + 1, entry].flatten
end

ARGV.each do |arg|
  template = ERB.new(File.read(arg))
  puts template.result(binding)
end

