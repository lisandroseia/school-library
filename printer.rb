class ListPrinter
  def self.print_list(list)
    list.each_with_index { |item, index| puts "index: #{index} #{item}"}
  end
end
