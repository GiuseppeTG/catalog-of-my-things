require './item'

class Main
    include Item

    def main
        puts 'Please choose an option by entering a number:'
        puts '[1] Create Item'
        puts '[2] Show List of Games'
        puts '[3] Show List of Authors'
        puts '[4] Create new Game'
        puts '[5] Exit'
        user_choice = gets.chomp
        show_list(user_choice)
    end

    def show_list(user_choice)
        case user_choice
        when '1'
        add_item()
        main
        #
        when '2'
        show_games()
        main
        when '3'
        show_authors()
        main
        when '4'
        add_game()
        main
        when '5'
        save_data()
        main

        else
            # need to include end case

        end
    end

end