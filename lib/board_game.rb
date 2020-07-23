class Board_game
  attr_accessor :board_case

  def initialize
    @board_case = []
    @board_case << Case.new("A1")
    @board_case << Case.new("A2")
    @board_case << Case.new("A3")
    @board_case << Case.new("B1")
    @board_case << Case.new("B2")
    @board_case << Case.new("B3")
    @board_case << Case.new("C1")
    @board_case << Case.new("C2")
    @board_case << Case.new("C3")

  end

  def game_board (players)
    puts "     1    2    3   Joueur 1 :"
    puts "   ┌───┐┌───┐┌───┐ nom : #{players[0].name}"
    puts " A │ #{@board_case[0].case_val} ││ #{@board_case[1].case_val} ││ #{@board_case[2].case_val} │ Symbole : #{players[0].icon_p}"
    puts "   └───┘└───┘└───┘ Victoire(s) = #{players[0].nb_victory}"
    puts "   ┌───┐┌───┐┌───┐"
    puts " B │ #{@board_case[3].case_val} ││ #{@board_case[4].case_val} ││ #{@board_case[5].case_val} │ Joueur 2 :"
    puts "   └───┘└───┘└───┘ nom : #{players[1].name}"
    puts "   ┌───┐┌───┐┌───┐ Symbole : #{players[1].icon_p}"
    puts " C │ #{@board_case[6].case_val} ││ #{@board_case[7].case_val} ││ #{@board_case[8].case_val} │ Victoire(s) = #{players[1].nb_victory}"
    puts "   └───┘└───┘└───┘"
  end
  def verif
    #verif horizontal
    return true if @board_case[0].case_val != " " && @board_case[0].case_val == @board_case[1].case_val && @board_case[0].case_val == @board_case[2].case_val
    return true if @board_case[3].case_val != " " && @board_case[3].case_val == @board_case[4].case_val && @board_case[3].case_val == @board_case[5].case_val
    return true if @board_case[6].case_val != " " && @board_case[6].case_val == @board_case[7].case_val && @board_case[6].case_val == @board_case[8].case_val
    #verif vertical
    return true if @board_case[0].case_val != " " && @board_case[0].case_val == @board_case[3].case_val && @board_case[0].case_val == @board_case[6].case_val
    return true if @board_case[1].case_val != " " && @board_case[1].case_val == @board_case[4].case_val && @board_case[1].case_val == @board_case[7].case_val
    return true if @board_case[2].case_val != " " && @board_case[2].case_val == @board_case[5].case_val && @board_case[2].case_val == @board_case[8].case_val
    #verif dia
    return true if @board_case[0].case_val != " " && @board_case[0].case_val == @board_case[4].case_val && @board_case[0].case_val == @board_case[8].case_val
    return true if @board_case[2].case_val != " " && @board_case[2].case_val == @board_case[4].case_val && @board_case[2].case_val == @board_case[6].case_val
    return false
  end

  def update_board (action,icon)
    retour = false
    @board_case.each do |case_p|
      if case_p.case_id ==  action
        if case_p.case_val == " "
          case_p.case_val = icon
          #binding.pry
          retour = true
          break
        end
      end
    end
    #binding.pry
    return retour
  end
end