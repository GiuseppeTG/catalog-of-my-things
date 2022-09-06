require_relative './app'

def main
  app = App.new
  puts "Catalog of my favorite things\n"
  app.init
end

main
