require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors =>["Black","White"],
      :players => [{
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds =>12,
        :assists =>12,
        :steals =>3,
        :blocks =>1,
        :slam_dunks =>1
      },{
        :player_name => "Mason Plumlee",
        :number =>1,
        :shoe =>19,
        :points =>26,
        :rebounds => 11,
        :assists =>6,
        :steals =>3,
        :blocks =>8,
        :slam_dunks =>5
      },{
        :player_name =>"Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals =>3,
        :blocks =>1,
        :slam_dunks =>15, 
      },{
        
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points =>12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },{
        :player_name => "Jason Terry",
        :number =>31,
        :shoe =>15,
        :points =>19,
        :rebounds => 2,
        :assists =>2,
        :steals =>4,
        :blocks =>11,
        :slam_dunks =>1
      }]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors =>["Turquoise", "Purple"],
      :players => [{
        :player_name => "Bismack Biyombo",
        :number =>0,
        :shoe =>16,
        :points =>12,
        :rebounds => 4,
        :assists =>7,
        :steals =>22,
        :blocks =>15,
        :slam_dunks => 10
      },{
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12, 
        :assists =>12,
        :steals =>4,
        :blocks =>5,
        :slam_dunks =>5
      },{
        :player_name =>"Jeff Adrien",
        :number => 4,
        :shoe =>18,
        :points => 10,
        :rebounds => 1,
        :assists =>1,
        :steals =>2,
        :blocks =>7,
        :slam_dunks =>2
      },{
        :player_name => "Ben Gordon",
        :number =>8,
        :shoe =>15,
        :points =>33,
        :rebounds =>3,
        :assists =>2,
        :steals =>1,
        :blocks =>1,
        :slam_dunks =>0
      },{
        :player_name => "Kemba Walker",
        :number =>33,
        :shoe =>15,
        :points =>6,
        :rebounds =>12,
        :assists =>12,
        :steals =>7,
        :blocks =>5,
        :slam_dunks =>12
      }]
    }
    
  }

end

def num_points_scored(name) #yass
  game_hash
  game_hash.each do |team|
    players = team[1][:players]
    i = 0 
    while i < players.count do 
      if players[i][:player_name] == name 
        return players[i][:points]
      else 
        i += 1 
      end 
    end 
  end
end 

def shoe_size(name) #yass
  game_hash
  game_hash.each do |team|
    players = team[1][:players]
    i = 0 
    while i < players.count do 
      if players[i][:player_name] == name 
        return players[i][:shoe]
      else 
        i += 1 
      end 
    end 
  end
end

def team_colors(team_name) 
  game_hash.each do |place, team|
    if team[:team_name] == team_name
		  return team[:colors]
		end
	end
end

def team_names 
teams_array = []
game_hash.each do |place, team|
  teams_array << team[:team_name]
	end
	teams_array
end

def player_numbers(team_name) 

  num_array = []
  game_hash.each do |team|
    if team_name == team[1][:team_name]
      i = 0 
      while i < team[1][:players].count do 
        num_array << team[1][:players][i][:number]
        i += 1
      end 
    end  
  end 
    num_array
    # binding.pry
end 


def player_stats(name) #yass
  game_hash
  game_hash.each do |place,team|
    i = 0 
    while i < team[:players].count do
      if team[:players][i][:player_name] == name
        player_hash = {}
        player_hash = team[:players][i]
        player_hash.delete(:player_name)
        return player_hash
      else 
        i += 1
      end 
    end 
  end
end

def big_shoe_rebounds
  ###collects players into a single array
  new_array = []
  game_hash.each do |place, team|
    team.each do |attribute,data|
      if attribute == :players
        i = 0 
        while i < data.count do
          new_array << data[i]
          i += 1 
        end
      end
    end
  end
  ### collects all shoe sizes from the newly-made array
  new_array
  shoe_array = []
  new_array.each do |player|
    player.each do |attribute,data|
      if attribute == :shoe 
        shoe_array << data
      end
    end
  end
  biggest_shoe = shoe_array.sort[-1]

  ### returns the rebounds of the player with the biggest_shoe
  new_array.each do |player|
    player.each do |attribute,data|
    
      if attribute == :shoe && data == biggest_shoe
        return player[:rebounds]
      end
    end
  end
end

def most_points_scored
    ###collects players into a single array
  new_array = []
  game_hash.each do |place, team|
    team.each do |attribute,data|
      if attribute == :players
        i = 0 
        while i < data.count do
          new_array << data[i]
          i += 1 
        end
      end
    end
  end
  ### collects the points of each player into a single sorted array
  new_array
  points_array = []
  new_array.each do |player|
    player.each do |attribute,data|
      if attribute == :points 
        points_array << data
      end
    end
  end
  most_points = points_array.sort[-1]
  ### returns the name of the player with the most points 
   new_array.each do |player|
    player.each do |attribute,data|
    
      if attribute == :points && data == most_points
        return player[:player_name]
      end
    end
  end
end

def winning_team 
  home_team = game_hash[:home]
  home_points = []
  away_team = game_hash[:away]
  away_points = []
  ## Total each teams points 
  home_team.each do |attribute,data|
    if attribute == :players
      data.each do |stat,value|
        if stat == :points 
          home_points << value
        end
      end
    end
  end
  
  away_team.each do |attribute,data|
    if attribute == :players
      data.each do |stat,value|
        if stat == :points 
          away_points << value
        end
      end
    end
  end
  
  total_home_points = home_points.sum 
  total_away_points = away_points.sum
  ## compare teams 
  if total_home_points < total_away_points
    away_team[:team_name]
  else
    home_team[:team_name]
  end
  
  
end 

def player_with_longest_name
###collects players into a single array
  new_array = []
  game_hash.each do |place, team|
    team.each do |attribute,data|
      if attribute == :players
        i = 0 
        while i < data.count do
          new_array << data[i]
          i += 1 
        end
      end
    end
  end
  ##extracts each player's name into a new array
  name_array = []
  new_array.each do |player|
    player.each do |attribute,data|
      if attribute == :player_name 
        name_array << data
      end
    end
  end
  names = name_array
  
  ## counts the characters in each payer's name and returns that value into a new array
  name_count_array =[]
  names.each do |player_name|
    name_count_array << player_name.length 
  end
  
 ## Takes the longest name length and returns the player name with that length. 
  biggest_name = name_count_array.sort[-1]
  new_array.each do |player|
    player.each do |attribute,data|
    
      if attribute == :player_name && data.length == biggest_name
        return player[:player_name]
      end
    end
  end
end

def long_name_steals_a_ton?
  ###collects players into a single array
  new_array = []
  game_hash.each do |place, team|
    team.each do |attribute,data|
      if attribute == :players
        i = 0 
        while i < data.count do
          new_array << data[i]
          i += 1 
        end
      end
    end
  end
  
  ### collects the steals of each player into an array
  steals_array = []
  new_array.each do |player|
    player.each do |attribute,data|
      if attribute == :steals
        steals_array << data
      end
    end
  end
  
  ###gets the highest :steals value and compares it with the :steals value of the player_with_longest_name
  
  most_steals = steals_array.sort[-1]
  i = 0
  while i < new_array.count do
    if new_array[i][:player_name] == player_with_longest_name && new_array[i][:steals] == most_steals
      return true 
    else 
      i += 1
    end
  end
  
  
end
  