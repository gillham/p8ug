;
; Number guessing game.
;
%zeropage basicsafe
%import conv
%import math
%import textio

main {
    str temp = " " * 8
    ubyte count, guess, limit, number

    sub start() {
        txt.lowercase()

        ; game loop
        repeat {
            count = guess = limit = number = 0
            txt.cls()
            init()
            play()
            if not again()
                break
        }
    }

    sub init() {
        txt.print("Enter upper limit for guess? ")
        void txt.input_chars(temp)
        limit = conv.str2ubyte(temp)
        number = math.randrange(limit) + 1
        txt.nl()
        txt.print("I've got the number.\n\n")
    }

    sub play() {
        bool guessed = false

        do {
            txt.print("What's your guess ? ")
            void txt.input_chars(temp)
            guess = conv.str2ubyte(temp)
            txt.nl()
            count++

            if guess > number
                txt.print("My number is lower.\n\n")
            else if guess < number 
                txt.print("My number is higher.\n\n")
            else
                guessed = true
        } until guessed

        txt.print("Great! You got my number\nin only ")
        txt.print_ub(count)
        txt.print(" guesses.\n\n")
    }

    sub again() -> bool {
        repeat {
            txt.print("Do you want to try another (Y/N) ? ")
            void txt.input_chars(temp)
            txt.nl()
            when temp[0] {
                'y','Y' -> return true
                'n','N' -> return false
            }
        }
    }
}
