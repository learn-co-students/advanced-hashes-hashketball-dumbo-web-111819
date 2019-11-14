# Write your code here!

def game_hash
  game_info = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", 'White'],
      :players => [{:player_name => "Alan Anderson",
                         :number => 0,
                         :shoe => 16,
                         :points => 22,
                         :rebounds => 12,
                         :assists => 12,
                         :steals =>3,
                         :blocks =>1,
                         :slam_dunks => 1
              },{:player_name => "Reggie Evans",
                         :number => 30,
                         :shoe => 14,
                         :points => 12,
                         :rebounds => 12,
                         :assists => 12,
                         :steals =>12,
                         :blocks =>12,
                         :slam_dunks => 7},
                {:player_name => "Brook Lopez",
                         :number => 11,
                         :shoe => 17,
                         :points => 17,
                         :rebounds => 19,
                         :assists => 10,
                         :steals =>3,
                         :blocks =>1,
                         :slam_dunks => 15},
                 {:player_name => "Mason Plumlee",
                         :number => 1,
                         :shoe => 19,
                         :points => 26,
                         :rebounds => 11,
                         :assists => 6,
                         :steals =>3,
                         :blocks =>8,
                         :slam_dunks => 5},
                {:player_name => "Jason Terry",
                         :number => 31,
                         :shoe => 15,
                         :points => 19,
                         :rebounds => 2,
                         :assists => 2,
                         :steals =>4,
                         :blocks =>11,
                         :slam_dunks => 1}
                         ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [{:player_name => "Jeff Adrien",
                         :number => 4,
                         :shoe => 18,
                         :points => 10,
                         :rebounds => 1,
                         :assists => 1,
                         :steals =>2,
                         :blocks =>7,
                         :slam_dunks => 2
              },{:player_name => "Bismack Biyombo",
                         :number => 0,
                         :shoe => 16,
                         :points => 12,
                         :rebounds => 4,
                         :assists => 7,
                         :steals =>22,
                         :blocks =>15,
                         :slam_dunks => 10},
                {:player_name => "DeSagna Diop",
                         :number => 2,
                         :shoe => 14,
                         :points => 24,
                         :rebounds => 12,
                         :assists => 12,
                         :steals =>4,
                         :blocks =>5,
                         :slam_dunks => 5},
                 {:player_name => "Ben Gordon",
                         :number => 8,
                         :shoe => 15,
                         :points => 33,
                         :rebounds => 3,
                         :assists => 2,
                         :steals =>1,
                         :blocks =>1,
                         :slam_dunks => 0},
                {:player_name => "Kemba Walker",
                         :number => 33,
                         :shoe => 15,
                         :points => 6,
                         :rebounds => 12,
                         :assists => 12,
                         :steals => 7,
                         :blocks => 5,
                         :slam_dunks => 12}
                         ]
    }
  }

end 


def num_points_scored(player_name) 
  obj = game_hash()
  obj.each{|first_key, first_val|
    sec_obj = first_val
    players = sec_obj[:players]
    
    players.each{|ele|
      obj_ele = ele
      
      obj_ele.each{|k,v|
       if obj_ele[k] == player_name
      
         return obj_ele[:points]
       end 
      }
    }
  }
end 

def shoe_size(player_name)
  obj = game_hash()
  obj.each{|first_key, first_val|
    sec_obj = first_val
    players = sec_obj[:players]
    
    players.each{|ele|
      obj_ele = ele
      
      obj_ele.each{|k,v|
       if obj_ele[k] == player_name
      
         return obj_ele[:shoe]
       end 
      }
    }
  }
end 

def team_colors(team_name)
    obj = game_hash()
  obj.each{|first_key, first_val|
    sec_obj = first_val

    if sec_obj[:team_name] == team_name
      return sec_obj[:colors]
    end 
  }
  
end 

def team_names
  result = []
  obj = game_hash()
  obj.each{|k,v|
    sec_obj = v
    sec_obj.each{|k2,v2|
      result << sec_obj[:team_name]
    }
  }
  result.uniq
end

def player_numbers(team_name)
  result = []
  obj = game_hash()
  obj.each{|k,v|
    sec_obj = v
    
    sec_obj.each{|k2,v2|
     team_names = sec_obj[:team_name]
     players = sec_obj[:players]
     players.each{|ele|
      obj_ele = ele
      
      obj_ele.each{|k3, v3|
       jersey_num =  obj_ele[:number]
       
       if team_names == team_name
         result << jersey_num
       end 
      }
     }
    }
  }
  result.uniq
end 

def player_stats(player_name)
  obj = game_hash()
  obj.each{|k,v|
    sec_obj = v
    sec_obj.each{|k1, v2|
    player_info = sec_obj[:players]
    
    player_info.each{|ele|
      
      if ele[:player_name] == player_name
       ele.delete(:player_name)
       return ele
      end 
    }
    }
   
  }
end 

def big_shoe_rebounds
  shoe_array = []
  max_shoe = nil 
  rebounds = 0 
  obj = game_hash()
  obj.each{|k,v|
    sec_obj = v
    player_info = sec_obj[:players]
    
    player_info.each{|ele|
      player_name = ele[:player_name]
      rebound = ele[:rebounds] 
      shoe_size = shoe_size(player_name)
      shoe_array << shoe_size
        
        shoe_array.each{|num|
          
          
          if max_shoe == nil || num > max_shoe
          max_shoe = num 
          rebounds = rebound
         end 
        
        }
    }
     
  }
  rebounds
end 
  
def most_points_scored 
  points_scored = nil
  name = nil 
  obj = game_hash()
  
  obj.each{|k,v|
    sec_obj = v
    player_info = sec_obj[:players]
    
    player_info.each{|ele|
      player_name = ele[:player_name]
      player_points = ele[:points]
      
      if points_scored == nil || points_scored < player_points
        points_scored = player_points
        name = player_name
        name
      end 
    }
  }
  name 
end

def home_team_score
  obj = game_hash()
   points_scored = 0 
   
   obj.each{|k,v|
    away_team = obj[:home]
    away_team =  away_team[:players]
    away_team.each{|ele|
      points_scored += ele[:points] 
      points_scored
    }
  }
  points_scored
end 

def away_team_score 
  obj = game_hash()
   points_scored = 0 
   
   obj.each{|k,v|
    away_team = obj[:away]
    away_team =  away_team[:players]
    away_team.each{|ele|
      points_scored += ele[:points] 
      points_scored
    }
  }
  points_scored
end 

def winning_team 
  obj = game_hash
  home_team =  obj[:home][:team_name]
  away_team = obj[:away][:team_name]
  
  if away_team_score() > home_team_score()
    return away_team
  else 
    return home_team
  end 
end 


def player_with_longest_name
  obj = game_hash()
  longest_name = nil 
  
  obj.each{|k,v|
    sec_obj = v
    player_info = sec_obj[:players]
    name_length = player_info[0][:player_name].length
   
    player_info.each{|ele|
    player_name=  ele[:player_name].length
    
    if name_length < player_name
      name_length = player_name
      longest_name =  ele[:player_name]
      longest_name
    end 
    }
  }
longest_name
end 
  
def long_name_steals_a_ton?
  obj = game_hash()
  highest_steal = nil
  steal_for_longest_name = nil 
  
  obj.each{|k,v|
    sec_obj = v
    player_info = sec_obj[:players]
    player_info.each{|ele|
      steals = ele[:steals]
      
      if highest_steal == nil || steals > highest_steal
        highest_steal = steals
        highest_steal
       
           
      if longest_name = player_with_longest_name().length
        steal_for_longest_name = steals
        steal_for_longest_name
      end 
    end 
 
    }
  }
     if steal_for_longest_name >= highest_steal
      return true 
   end
  return false
end 
  