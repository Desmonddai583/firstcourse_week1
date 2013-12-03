# coding=utf-8
# Blackjack game
# General output
def say(str)
  "=> #{str}"
end

# Error output
def error_prompt(str)
  "** Your input is incorrect, #{str}"
end

# Create and shuffle new decks
def shuffle_card(cards, value, suit)
  suit.each do |ele1|
    value.each do |ele2|
      cards.push(suit: ele1, value: ele2)
    end
  end

 cards = cards * 4
 cards.shuffle!
end

# Calculate points of current cards on hand
def check_points(cards)
  points = []
  point = 0

  cards.each do |card|
    if %w(J K Q).include?(card[:value])
      point += 10
    elsif card[:value] == 'A'
      point += 11
    else
      point += card[:value].to_i
    end
  end

  points << point if point <= 21

  cards.select { |ele| ele[:value] == 'A' }.count.times do
    point -= 10
    points << point if point <= 21
  end

  points
end

# List detail cards info
def show_cards(gamer, name)
  puts say("#{name} cards on hand list below:")
  gamer.each do |card|
    puts "[#{card[:suit]} #{card[:value]}]"
  end
end

# Main
name = ''
value = %w(A 2 3 4 5 6 7 8 9 J Q K)
suit = %w(S H D C)
deck_cards = []

loop do
  puts say('Please input your name')
  name = gets.chomp

  if name == 'dealer'
    puts error_prompt('Name can not be dealer!')
  elsif !name.empty?
    break
  else
    puts error_prompt('Name can not be null!')
  end
end

puts say("Welcome to the Blackjack game, #{name}")

loop do
  player = []
  dealer = []
  player_point = []
  dealer_point = []
  new_card = {}
  flag = false  # whether game is over

  if deck_cards.size <= 104
    puts say('Change new decks and shuffle.')
    deck_cards = shuffle_card(deck_cards, value, suit)
  end

  puts say("Deal 2 cards to #{name} and dealer")

  2.times do
    player << deck_cards.pop
    dealer << deck_cards.pop
  end

  player_point = check_points(player)
  dealer_point = check_points(dealer)

  if player_point.include?(21) && dealer_point.include?(21)
    show_cards(player, name)
    show_cards(dealer, 'dealer')
    puts say("It's a tie game.")
  elsif player_point.include?(21)
    show_cards(player, name)
    show_cards(dealer, 'dealer')
    puts say("Congraduations! #{name} hit Blackjack. #{name} win.")
  elsif dealer_point.include?(21)
    show_cards(player, name)
    show_cards(dealer, 'dealer')
    puts say("Sorry, dealer hit Blackjack. #{name} lose.")
  else
    # Player turn
    loop do
      show_cards(player, name)

      puts "#{name}'s current point can be: #{player_point}"
      puts say("#{name}'s round, What would you like to do ? (1 hit (2 stay")
      operation = gets.chomp

      if operation == '1'
        new_card = deck_cards.pop
        puts say("Your draws a #{new_card[:suit]} #{new_card[:value]}")
        player << new_card
        player_point = check_points(player)

        if player_point.include?(21)
          puts say("Congraduations! #{name} hit Blackjack. #{name} win.")
          flag = true
          break
        elsif player_point.empty?
          puts say("Sorry, #{name} busted. #{name} lose.")
          flag = true
          break
        end
      elsif operation == '2'
        puts "#{name} stays."
        break
      else
        puts error_prompt('Input 1 or 2!')
      end
    end

    if flag == false
      # Dealer turn
      loop do
        show_cards(dealer, 'dealer')

        puts "Dealer's current point can be: #{dealer_point}"
        puts say("Dealer's round")

        if dealer_point.sort.last < 17
          new_card = deck_cards.pop
          puts say("Dealer draws a #{new_card[:suit]} #{new_card[:value]}")
          dealer << new_card
          dealer_point = check_points(dealer)

          if dealer_point.include?(21)
            puts say("Sorry, Dealer hit Blackjack. #{name} lose.")
            flag = true
            break
          elsif dealer_point.empty?
            puts say("Congraduations! dealer busted. #{name} win.")
            flag = true
            break
          end
        else
          puts say('Dealer stays.')
          break
        end
      end
    end

    if flag == false
      puts say('*****************************')
      show_cards(player, name)

      player_final_point = player_point.sort[-1]
      puts say("#{name} point is: #{player_final_point}")
      show_cards(dealer, 'dealer')
      dealer_final_point = dealer_point.sort[-1]
      puts say("Dealer point is: #{dealer_final_point}")

      if player_final_point > dealer_final_point
        puts say("Congraduations! #{name} win!")
      elsif player_final_point < dealer_final_point
        puts say("Sorry, #{name} lose.")
      else
        puts say("It's a tie game.")
      end
    end
  end

  loop do
    puts say('Would you like to try another round? (1 Yes (2 NO')
    another_round = gets.chomp

    if another_round == '1'
      break
    elsif another_round == '2'
      puts say('Have a good one!')
      exit
    else
      puts error_prompt('Input 1 or 2')
    end
  end
end
