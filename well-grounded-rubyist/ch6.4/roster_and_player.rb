class Roster
  attr_accessor :players
end

class Player
  attr_accessor :name, :position
  def initialize(name, position)
    @name = name
    @positiion = position
  end
end
moore = Player.new("Paya Moore", "Forward")
taurasi = Player.new("Diana Taurasi", "Guard")
tourney_roster1 = Roster.new
tourney_roster1.players = [moore, taurasi]

tourney_roster2 = Roster.new
# To avoid NoMethodError use `&.` safe navigator operator:
if tourney_roster2.players&.first&.position == "Forward"
  puts "Forward: #{tourney_roster2.players.first.name}"
end
