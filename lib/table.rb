class Table
  @@line_1 = ["#", "#", "#"]
  @@line_2 = ["#", "#", "#"]
  @@line_3 = ["#", "#", "#"]

  def initialize
    @player, @position_x, @position_y, @position = 0, 0, 0, 0
  end

  def display_table
    puts <<-TABLE
    a     b     c
      |     |
1  #{@@line_1[0]}  |  #{@@line_1[1]}  |  #{@@line_1[2]}
 _____|_____|_____
      |     |
2  #{@@line_2[0]}  |  #{@@line_2[1]}  |  #{@@line_2[2]}
 _____|_____|_____
      |     |
3  #{@@line_3[0]}  |  #{@@line_3[1]}  |  #{@@line_3[2]}
      |     |
    TABLE
  end

  def convert_alphabetic_letter_to_number(letter)
    case letter
    when "a" then 1
    when "b" then 2
    when "c" then 3
    end
  end

  def play(player)
    @player = player
    puts "#{@player} is on turn"
    puts "Enter horizontal postion (a, b, c):"
    @position_x = gets.chomp
    @position_x = convert_alphabetic_letter_to_number(@position_x)
    puts "Enter vertical postion (1, 2, 3):"
    @position_y = gets.chomp.to_i
    @position_x -= 1
  end

  def get_position_value
    case @position_y
      when 1 then @position = @@line_1[@position_x]
      when 2 then @position = @@line_2[@position_x]
      when 3 then @position = @@line_3[@position_x]
    end
  end

  def set_position
    case @position_y
      when 1 then @@line_1[@position_x] = @player
      when 2 then @@line_2[@position_x] = @player
      when 3 then @@line_3[@position_x] = @player
    end
  end

  def check_validity
    get_position_value

    unless @position == "#"
      puts "---------------------------"
      puts "Invalid postion. Try again."
      play(@player)
      check_validity
    end
  end

  def check_for_wictory
    winning_row = [@player, @player, @player]

    if @@line_1 == winning_row || @@line_2 == winning_row || @@line_3 == winning_row
      puts "#{@player} wins"
      "end game"
    elsif @@line_1[0] == @player && @@line_2[1] == @player && @@line_3[2] == @player
      puts "#{@player} wins"
      "end game"
    elsif @@line_1[2] == @player && @@line_2[1] == @player && @@line_3[0] == @player
      puts "#{@player} wins"
      "end game"
    elsif @@line_1[0] == @player && @@line_2[0] == @player && @@line_3[0] == @player
      puts "#{@player} wins"
      "end game"
    elsif @@line_1[1] == @player && @@line_2[1] == @player && @@line_3[1] == @player
      puts "#{@player} wins"
      "end game"
    elsif @@line_1[2] == @player && @@line_2[2] == @player && @@line_3[2] == @player
      puts "#{@player} wins"
      "end game"
    elsif [@@line_1, @@line_2, @@line_3].flatten.include?("#") == false
      puts "tie"
      "end game"
    else
      puts "continue..."
    end
  end
end
