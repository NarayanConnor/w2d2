class GuessingGame
    def initialize (min,max)
        @min=min
        @max=min
        @num_attempts=0
        @secret_num=rand(min..max)
        @game_over=false
    end
    def num_attempts
        @num_attempts
    end
    def game_over?
        @game_over
    end
    def check_num(num)
        @num_attempts+=1
        if num==@secret_num
            @game_over=true
        end
    end
    def ask_user
        puts 'enter number'
        guess=gets.chomp.to_i
        check_num(guess)
    end

    def check_num(guess)

        if guess<@secret_num
            @num_attempts+=1
            puts "too small"
        elsif guess>@secret_num
            @num_attempts+=1
            puts "too big"
        elsif guess==@secret_num
            puts 'You win!'
            @num_attempts+=1
            @game_over = true
        else
            p "invalid input"
        end
    end



end
