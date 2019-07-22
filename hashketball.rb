require "pry"

def game_hash
  {
    :away => { :team_name => 'Charlotte Hornets',
            :colors => ['Turquoise', 'Purple'],
            :players => [
              { :player_name => 'Jeff Adrien',
                :number => 4,
                :shoe => 18,
                :points => 10,
                :rebounds => 1,
                :assists => 1,
                :steals => 2,
                :blocks => 7,
                :slam_dunks => 2 },
              { :player_name => 'Bismack Biyombo',
                :number => 0,
                :shoe => 16,
                :points => 12,
                :rebounds => 4,
                :assists => 7,
                :steals => 22,
                :blocks => 15,
                :slam_dunks => 10 },
              { :player_name => 'DeSagna Diop',
                :number => 2,
                :shoe => 14,
                :points => 24,
                :rebounds => 12,
                :assists => 12,
                :steals => 4,
                :blocks => 5,
                :slam_dunks => 5 },
              { :player_name => 'Ben Gordon',
                :number => 8,
                :shoe => 15,
                :points => 33,
                :rebounds => 3,
                :assists => 2,
                :steals => 1,
                :blocks => 1,
                :slam_dunks => 0 },
              { :player_name => 'Kemba Walker',
                :number => 33,
                :shoe => 15,
                :points => 6,
                :rebounds => 12,
                :assists => 12,
                :steals => 7,
                :blocks => 5,
                :slam_dunks => 12 }
            ] },
    home: { :team_name => 'Brooklyn Nets',
            :colors => ['Black', 'White'],
            :players => [
              { :player_name => 'Alan Anderson',
                :number => 0,
                :shoe => 16,
                :points => 22,
                :rebounds => 12,
                :assists => 12,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 1 },
              { :player_name => 'Reggie Evans',
                :number => 30,
                :shoe => 14,
                :points => 12,
                :rebounds => 12,
                :assists => 12,
                :steals => 12,
                :blocks => 12,
                :slam_dunks => 7 },
              { :player_name => 'Brook Lopez',
                :number => 11,
                :shoe => 17,
                :points => 17,
                :rebounds => 19,
                :assists => 10,
                :steals => 3,
                :blocks => 1,
                :slam_dunks => 15 },
              { :player_name => 'Mason Plumlee',
                :number => 1,
                :shoe => 19,
                :points => 26,
                :rebounds => 11,
                :assists => 6,
                :steals => 3,
                :blocks => 8,
                :slam_dunks => 5 },
              { :player_name => 'Jason Terry',
                :number => 31,
                :shoe => 15,
                :points => 19,
                :rebounds => 2,
                :assists => 2,
                :steals => 4,
                :blocks => 11,
                :slam_dunks => 1 }
            ] }
  }
end

def num_points_scored(name)
  game_hash.each do |building, team|
    team[:players].each do |values|
      return values[:points] if 
        values[:player_name] == name 
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |building, team|
    team.each do |attributes, data|
      next unless attributes == :players
      data.each do |values|
        return values[:shoe] if 
        values[:player_name] == name
      end
    end
  end
end

def team_colors(name_of_team)
  game_hash.each do |building, team|
    return team[:colors] if
    team[:team_name] == name_of_team
  end
end

def team_names
  game_hash.collect do |building, team|
    team[:team_name]
  end
end

def player_numbers(name_of_team)
  numbers = []
  game_hash.each do |building, team|
    next unless team[:team_name] == name_of_team
    team.each do |data, value|
      next unless data == :players
      value.each do |nums|
        numbers << nums[:number]
    end 
    end
  end
  numbers
end

def player_stats(name)
  stats_hash = {}
  game_hash.collect do |building, team|
    team.each do |attribute, data|
      next unless attribute == :players
      game_hash[building][attribute].each do |player|
        next unless player[:player_name] == name
        stats_hash = player.delete_if do |key,value|
          key == :player_name
        end
      end
    end
  end
  stats_hash
end

def big_shoe_rebounds
  biggest_shoe = 0
  num_of_rebounds = 0
  
  game_hash.each do |building, team|
    team[:players].each do |names|
      if names[:shoe] > biggest_shoe
        biggest_shoe = names[:shoe]
        num_of_rebounds = names[:rebounds]
      end
    end
  end
  num_of_rebounds
end

def most_points_scored
  highest_points = 0
  highest_scorer = nil
  game_hash.each do |building, team|
    team[:players].each do |stat, value|
      if stat[:points] > highest_points
        highest_points = stat[:points]
        highest_scorer = stat[:player_name]
      end
    end
  end
  highest_scorer
end

def winning_team
  total_points = 0
  winning_team = nil
  game_hash.each do |building, team|
    team_points = 0
    team_name = game_hash[building][:team_name]
    team[:players].each do |name|
      team_points += name[:points]
      end
    winning_team, total_points = team_name, team_points if team_points > total_points
  end
  return winning_team
end

def player_with_longest_name
  big_name = 0
  person_with_big_name = nil
  game_hash.each do |building, category|
    category[:players].each do |person|
      big_name, person_with_big_name = person[:player_name].length, person[:player_name] if 
      person[:player_name].length > big_name
    end
  end
  return person_with_big_name
end

def long_name_steals_a_ton?
  most_steals = 0
  most_steals_name = nil
  game_hash.each do |building, category|
    category[:players].each do |person|
      most_steals, most_steals_name = person[:steals], person[:player_name] if
      person[:steals] > most_steals
    end
  end
  return true if most_steals_name == player_with_longest_name
end

 






