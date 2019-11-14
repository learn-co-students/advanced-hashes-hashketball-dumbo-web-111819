require 'pry'
# Write your code here!
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {:player_name => "Alan Anderson",
         :number => 0,
         :shoe => 16,
         :points => 22,
         :rebounds => 12,
         :assists => 12,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 1
        },
        {:player_name => "Reggie Evans", 
         :number => 30,
         :shoe => 14,
         :points => 12,
         :rebounds => 12,
         :assists => 12,
         :steals => 12,
         :blocks => 12,
         :slam_dunks => 7
        },
        {:player_name => "Brook Lopez",
         :number => 11,
         :shoe => 17,
         :points => 17,
         :rebounds => 19,
         :assists => 10,
         :steals => 3,
         :blocks => 1,
         :slam_dunks => 15
        },
        {:player_name => "Mason Plumlee",
          :number => 1,
         :shoe => 19,
         :points => 26,
         :rebounds => 11,
         :assists => 6,
         :steals => 3,
         :blocks => 8,
         :slam_dunks => 5
        },
        {:player_name => "Jason Terry",
         :number => 31,
         :shoe => 15,
         :points => 19,
         :rebounds => 2,
         :assists => 2,
         :steals => 4,
         :blocks => 11,
         :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {:player_name => "Jeff Adrien",
         :number => 4,
         :shoe => 18,
         :points => 10,
         :rebounds => 1,
         :assists => 1,
         :steals => 2,
         :blocks => 7,
         :slam_dunks => 2
        },
        {:player_name => "Bismack Biyombo",
         :number => 0,
         :shoe => 16,
         :points => 12,
         :rebounds => 4,
         :assists => 7,
         :steals => 22,
         :blocks => 15,
         :slam_dunks => 10
        },
        {:player_name => "DeSagna Diop",
         :number => 2,
         :shoe => 14,
         :points => 24,
         :rebounds => 12,
         :assists => 12,
         :steals => 4,
         :blocks => 5,
         :slam_dunks => 5
        },
        {:player_name => "Ben Gordon",
         :number => 8,
         :shoe => 15,
         :points => 33,
         :rebounds => 3,
         :assists => 2,
         :steals => 1,
         :blocks => 1,
         :slam_dunks => 0
        },
        {:player_name => "Kemba Walker",
         :number => 33,
         :shoe => 15,
         :points => 6,
         :rebounds => 12,
         :assists => 12,
         :steals => 7,
         :blocks => 5,
         :slam_dunks => 12
        }
      ]
    }
  }
end

def num_points_scored(name)
  #return num of points for player passed in
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  #returns the shoe size for that player passed in 
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players 
        data.each do |player|
          if player[:player_name] == name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(name)
  #returns an array of the passed in team's color
  game_hash.each do |place, team|
    if team[:team_name] == name
      return team[:colors]
    end
  end
end

def team_names
  #returns an array of the team names 
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def player_numbers(name)
  #returns an array of the jersey numbers for that team
  jersey_num = []
  game_hash.each do |place, team|
    if team[:team_name] == name 
      team.each do |attribute, data|
        if attribute == :players 
          data.each do |player|
            jersey_num << player[:number]
          end
        end
      end
    end
  end
  jersey_num
end

def player_stats(player_name)
  #returns a hash of that player's stats
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_name
            new_hash = player.delete_if do |key, value|
              key == :player_name
            end
          end
        end
      end
    end
  end
  new_hash
end

def big_shoe_rebounds
  #return the bumber of rebounds associated witht eh player that has the largest shoe size
  big_shoe = 0 
  rebounds = 0 
  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:shoe] > big_shoe 
        big_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end 
  end
  rebounds
end

def most_points_scored 
  #which player has the most points?
  most_points = 0
  playerw_mp = ''
  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        playerw_mp = player[:player_name]
      end
    end
  end
  playerw_mp
end

def winning_team 
  #which team has the most points? 
  away_pts = 0 
  home_pts = 0 
  game_hash.each do |place, team|
    if place == :away
      team[:players].each do |player|
        away_pts += player[:points]
      end
    end
    if place == :home
      team[:players].each do |player|
        home_pts += player[:points]
      end
    end
    if away_pts > home_pts
      return game_hash[:away][:team_name]
    else
      return game_hash[:home][:team_name]
    end
  end
end

def player_with_longest_name
  #return player with the longest name
  longest_name_size = 0
  playerw_ln = ''
  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:player_name].length > longest_name_size
        longest_name_size = player[:player_name].length
        playerw_ln = player[:player_name]
      end
    end
  end
  playerw_ln
end

def long_name_steals_a_ton?
  if player_with_longest_name == most_steals
    return true 
  end
end

def most_steals
  #which player steals the most points?
  most_steal = 0
  playerw_st = ''
  game_hash.each do |place, team|
    team[:players].each do |player|
      if player[:steals] > most_steal
        most_steal = player[:steals]
        playerw_st = player[:player_name]
      end
    end
  end
  playerw_st
end
  





