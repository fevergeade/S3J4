class Game
  attr_accessor :nb_party, :players, :board

  def initialize
    @nb_party = 0
    @players = []
    @board = Board_game.new()
  end

  def init_player
    puts "Bonjour Humain"
    puts "donne moi ton nom ?"
    print "=>"
    human_name = gets.chomp
    while human_name == ""
      puts "J'attends !!!"
      print "=>"
      human_name = gets.chomp
    end
    return human_name
  end

  def init_game_player
    @players << Player.new(init_player(), "O")
    @players << Player.new(init_player(), "X")
    puts "Les parties seront l'affrontement entre #{@players[0].name} et #{@players[1].name}"
    puts "prêt ? (appuie une touche et valide)"
    gets.chomp
  end

  def init_board
    @board = Board_game.new()
  end

  def partie
  end_of_party = false
  round = 0
    while not (end_of_party)
      players.each do |player_p|
        round += 1
        system "clear"
        puts " PARTIE : #{@nb_party}       "
        @board.game_board (@players)
        action = ""
        valide_case = true
        puts "joueur : #{player_p.name} à toi de jouer !!"
        puts "donne ta ligne et ta colonne (ex A1 ou C3)"
        print "=>"
        action = gets.chomp
        while not(action == "A1" || action == "A2" || action == "A3" || action == "B1" || action == "B2" || action == "B3" || action == "C1" || action == "C2" || action == "C3")
          puts "J'AI DIS !!!!!"
          puts "donne ta ligne et ta colonne (ex A1 ou C3)"
          print "=>"
          action = gets.chomp
        end
        while valide_case
          valide_case = @board.update_board(action, player_p.icon_p)
          if not (valide_case)
            puts "cette case est déjà occupé"
            puts "donne ta ligne et ta colonne (ex A1 ou C3)"
            print "=>"
            action = gets.chomp
          else
            break
          end
          valide_case = true
        end
        system "clear"
        puts " PARTIE : #{@nb_party}       "
        @board.game_board (@players)
        end_of_party = @board.verif
        if end_of_party
          puts "le joueur #{player_p.name} a gagné"
          player_p.nb_victory += 1
          gets.chomp
          break
        end
        if round == 9
          puts "EGALITE !!!"
          end_of_party = true
          gets.chomp
          break
        end
      end
    end
  end
end