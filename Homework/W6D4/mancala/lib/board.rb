class Board
  attr_accessor :cups

  def self.fresh_cups
    board = Array.new(14) {[]}
    board.each_index do |i|
      if (i >= 0 && i < 6) || (i > 6 && i < 13)
        board[i] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Board.fresh_cups
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless (0..5).include?(start_pos) || (7..12).include?(start_pos)
      raise "Invalid starting cup" 
      return false
    end
    if cups[start_pos].empty?
      raise "Starting cup is empty" 
      return false
    end
    true
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    new_pos = start_pos + 1
    cups[start_pos] = []
    until stones.empty?
      unless cups[new_pos]
        cups[new_pos] << :stone 
        stones = stones.drop(1)
      end
      new_pos += 1
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end

