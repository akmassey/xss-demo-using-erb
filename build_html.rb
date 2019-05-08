require 'erb'
require 'csv'

@csv_data = CSV.read('data.csv')
@table = []
@csv_data.each_with_index do |entry, index|
  @table << [index + 1, entry].flatten
end

@table.map! do |t|
  r = []
  t.each do |s|
    if /script/.match?(s.to_s)
      r << ""
    else
      r << s
    end
  end

  r
end

ARGV.each do |arg|
  template = ERB.new(File.read(arg))
  puts template.result(binding)
end

