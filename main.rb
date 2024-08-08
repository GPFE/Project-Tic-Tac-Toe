require_relative "lib/table"

player_1 = "x"
player_2 = "y"
finished = false
tab = Table.new

def round(player, table)
  table.display_table
  table.play(player)
  table.check_validity
  table.set_position
  table.check_for_wictory
end

loop do
  if round(player_1, tab) == "end game"
    tab.display_table
    break
  end
  if round(player_2, tab) == "end game"
    tab.display_table
    break
  end
end