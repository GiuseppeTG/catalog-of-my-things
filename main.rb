require_relative './app'

def main
  puts "Catalog of my favorite things\n"
  app = App.new
  app.init
end

main
