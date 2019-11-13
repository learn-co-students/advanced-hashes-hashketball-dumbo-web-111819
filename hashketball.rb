require "pry" # gem install pry # "exit" or "exit!"

# game_hash = {:home => {:players => [{player_name: "name"}]
def game_hash
  {:home => {
    :team_name => 'Brooklyn Nets',
    :colors => ['Black', 'White'],
    :players => [
      {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },
  :away => {
    :team_name => 'Charlotte Hornets',
    :colors => ['Turquoise', 'Purple'],
    :players => [
      {player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      {player_name: 'Bismack Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10},
      {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      {player_name: 'Kemba Walker', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |home_away, keys|
    keys[:players].each do |player_hash|
      if player_hash[:player_name] == player_name
        return player_hash[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |home_away, keys|
    keys[:players].each do |player_hash|
      if player_hash[:player_name] == player_name
        return player_hash[:shoe]
      end
    end
  end
end

def team_colors(input_name)
  game_hash.each do |home_away, keys|
    if keys[:team_name] == input_name
      return keys[:colors]
    end
  end
end

def team_names
  return_arr = []    
  game_hash.each do |home_away, keys|
    return_arr << keys[:team_name]
  end
  return_arr
end

def player_numbers(input_team)
  return_arr = []
  game_hash.each do |home_away, keys|
    if keys[:team_name] == input_team
      keys.each do |attributes, data|
        if attributes == :players
          data.each do |player|
            return_arr << player[:number]
          end
        end
      end
    end
  end
  return_arr
end

def player_stats(player_name)
  return_hash = {}
  game_hash.each do |home_away, keys|
    keys[:players].each do |player_hash|
      if player_hash[:player_name] == player_name
        return_hash = player_hash.delete_if {|key, value| key == :player_name}
      end
    end
  end
  return_hash
end

def big_shoe_rebounds
  # return the number of rebounds associated with the player that has the largest shoe size (more in Instructions)
  biggest_shoes = 0
  rebounds = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      size = player[:shoe]
      if size > biggest_shoes
        biggest_shoes = size
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end