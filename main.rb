class Table
  @@line_1 = ["#", "#", "#"]
  @@line_2 = ["#", "#", "#"]
  @@line_3 = ["#", "#", "#"]

  def initialize

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

  def play(player, position_x, position_y)
    position_y -= 1
    case position_x
    when 1
      @@line_1[position_y] = player
    when 2
      @@line_2[position_y] = player
    when 3
      @@line_3[position_y] = player
    end
  end
end

tab = Table.new
tab.display_table
tab.play("x", 3, 2)
tab.display_table