def game_hash
  {
    away: { team_name: 'Charlotte Hornets',
            colors: %w[Turquoise Purple],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: %w[Black White],
            players: [
              { player_name: 'Alan Anderson',
                number: 0,
                shoe: 16,
                points: 22,
                rebounds: 12,
                assists: 12,
                steals: 3,
                blocks: 1,
                slam_dunks: 1 },
              { player_name: 'Reggie Evans',
                number: 30,
                shoe: 14,
                points: 12,
                rebounds: 12,
                assists: 12,
                steals: 12,
                blocks: 12,
                slam_dunks: 7 },
              { player_name: 'Brook Lopez',
                number: 11,
                shoe: 17,
                points: 17,
                rebounds: 19,
                assists: 10,
                steals: 3,
                blocks: 1,
                slam_dunks: 15 },
              { player_name: 'Mason Plumlee',
                number: 1,
                shoe: 19,
                points: 26,
                rebounds: 11,
                assists: 6,
                steals: 3,
                blocks: 8,
                slam_dunks: 5 },
              { player_name: 'Jason Terry',
                number: 31,
                shoe: 15,
                points: 19,
                rebounds: 2,
                assists: 2,
                steals: 4,
                blocks: 11,
                slam_dunks: 1 }
            ] }
  }
end


def num_points_scored(player_inq)

  game_hash.each do |k0,v0|
    v0.each do |k1,v1|
      next unless k1 == :players 
      v1.each do |player_arr|
        return player_arr[:points] if player_arr[:player_name] == player_inq
      end
    end
  end
end


def shoe_size(player_inq)
  game_hash.each do |k0,v0|
    v0.each do |k1,v1|
      next unless k1 == :players 
      v1.each do |player_arr|
        return player_arr[:shoe] if player_arr[:player_name] == player_inq
      end
    end
  end
end

def team_colors(team_inq)
  game_hash.each do |k0,v0|
    return v0[:colors] if v0[:team_name] == team_inq
  end
end


def team_names
  team_arr = []
  game_hash.each do |k0, v0|
    team_arr << v0[:team_name]
  end
  team_arr
end


def player_numbers(team_inq)
  team_jersey_arr = []
  game_hash.each do |k0, v0|
    if v0[:team_name] == team_inq
      v0[:players].each do |player|
        team_jersey_arr << player[:number]
      end
    end
  end
  team_jersey_arr
end

def player_stats(player_inq)
  player_stat = {}

  game_hash.each do |k0,v0|
    v0.each do |k1,v1|
      next unless k1 == :players 
      v1.each do |player_arr|

        if player_arr[:player_name] == player_inq
          player_stat[:number] = player_arr[:number]
          player_stat[:shoe] = player_arr[:shoe]
          player_stat[:points] = player_arr[:points]
          player_stat[:rebounds] = player_arr[:rebounds]
          player_stat[:assists] = player_arr[:assists]
          player_stat[:steals] = player_arr[:steals]
          player_stat[:blocks] = player_arr[:blocks]
          player_stat[:slam_dunks] = player_arr[:slam_dunks]          
        end
      end
    end
  end
  player_stat
end

def big_shoe_rebounds
  biggest_shoe_size = 0
  big_shoe_player = ""
  big_shoe_rebounds = 0
  game_hash.each do |k0, v0|
    v0.each do |k1,v1|
       next unless k1 == :players    
      v1.each do |player_arr|

        if player_arr[:shoe] > biggest_shoe_size
          biggest_shoe_size = player_arr[:shoe]
          big_shoe_player = player_arr[:player_name]
          big_shoe_rebounds = player_arr[:rebounds]
        end
      end
     end
  end
  big_shoe_rebounds
end

def most_points_scored
  most_points = 0
  most_points_player = ""

  game_hash.each do |k0, v0|
    v0.each do |k1,v1|
       next unless k1 == :players    
      v1.each do |player_arr|

        if player_arr[:points] > most_points
          most_points = player_arr[:points]
          most_points_player = player_arr[:player_name]
        end
      end
     end
  end
  most_points_player
end

def winning_team
  most_points_sum = 0
  most_points_team = ""
  current_team = ""
  
  game_hash.each do |k0, v0|
    current_team = v0[:team_name]
    sum = 0
    v0.each do |k1,v1|
       next unless k1 == :players    
      v1.each do |player_arr|
        sum += player_arr[:points]
      end
    end

    if sum > most_points_sum
      most_points_sum = sum
      most_points_team = current_team
    end
  end
  most_points_team
end


def player_with_longest_name
  longgest_name = 0
  longgest_name_player = ""

  game_hash.each do |k0, v0|
    v0.each do |k1,v1|
       next unless k1 == :players    
      v1.each do |player_arr|

        if player_arr[:player_name].length > longgest_name
          longgest_name = player_arr[:player_name].length
          longgest_name_player = player_arr[:player_name]
        end
      end
     end
  end
  longgest_name_player
end


def long_name_steals_a_ton?
  most_steals = 0
  most_steals_player = ""
  # longgest_name_player = 
  game_hash.each do |k0, v0|
    v0.each do |k1,v1|
       next unless k1 == :players    
      v1.each do |player_arr|

        if player_arr[:steals] > most_steals
          most_steals = player_arr[:steals]
          most_steals_player = player_arr[:player_name]
        end
      end
     end
  end
  most_steals_player == player_with_longest_name
end