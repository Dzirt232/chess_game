require './lib/game.rb'

print "Welcome to the chess game!!!\n"
gets
print "Enter a \"save\" in the game to saving.\n"
gets
while true
  print "Choose a game mode:\n1: Player vs Player\n2: Player vs Computer\n"
  variant = gets.chomp.strip.to_i
  case variant
  when 1
    greet(1)
    break
  when 2
    greet(2)
    break
  else
    puts "You are enter a wrong answer! Try again..."
    gets
  end
end
