require './lib/boot'
require 'json'
require 'pry'

class CommandProcessor
  class << self
    def run(args)
      abort("Invalid Params: expect ruby flower_shop.rb flowers_file.json order_file.txt") unless args.count == 2
      flowers_json = read_flowers(args[0])
      order = read_order(args[1])
      flower_shop = FlowerShop.new(flowers_json)
      receipt = flower_shop.order(order)
      print_receipt receipt
    end

    def read_flowers(file)
      JSON.parse(File.read(file), symbolize_names: true)
    rescue
      abort("Invalid flowers file #{file}")
    end

    def read_order(file)
      hash = []
      File.open(file) do |fp|
        fp.each do |line|
          quantity, code = line.chomp.split(" ")
          hash << { quantity: quantity.to_i, code: code }
        end
      end
      hash
    rescue
      abort("Invalid order file #{file}")
    end

    def print_receipt(receipt)
      receipt.each do |item|
        puts "#{item[:quantity]} #{item[:flower]} $#{item[:total_price]}"
        item[:bundles].each do |bundle|
          puts "  #{bundle[:quantity]} X #{bundle[:size]} $#{bundle[:price]}"
        end
      end
    end
  end
end

CommandProcessor.run ARGV
