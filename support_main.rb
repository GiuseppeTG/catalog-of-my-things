require './item'

class Main
    include Item

    def main
        puts 'Please choose an option by entering a number:'
        puts '[1] Crete Item'
        puts '[2] Exit'
        user_choice = gets.chomp
        show_list(user_choice)
    end

    def show_list(user_choice)
        case user_choice
        when '1'
        addt_item()
        main
        #
        when '2'
        save_item()
        main
        else
            # need to include end case

        end
    end

end