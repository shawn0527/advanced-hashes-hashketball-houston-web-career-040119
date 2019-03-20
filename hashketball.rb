def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

game_hash

def num_points_scored(player)
  if game_hash[:home][:players].include?(player)
    game_hash[:home][:players][player][:points]
  else
    game_hash[:away][:players][player][:points]
  end
end

def shoe_size(player)
  if game_hash[:home][:players].include?(player)
    game_hash[:home][:players][player][:shoe]
  else
    game_hash[:away][:players][player][:shoe]
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  team_names = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        team_names.push(data)
      end
    end
  end
  team_names
end

def player_numbers(team_name)
  player_numbers = []
  if team_name == game_hash[:home][:team_name]
    game_hash.each do |location, team_data|
      if location == :home
        team_data.each do |attribute, data|
          if attribute == :players
            data.each do |player_name, player_stats|
              player_numbers.push(player_stats[:number])
            end
          end
        end
      end
    end
  else
    game_hash.each do |location, team_data|
      if location == :away
        team_data.each do |attribute, data|
          if attribute == :players
            data.each do |player_name, player_stats|
              player_numbers.push(player_stats[:number])
            end
          end
        end
      end
    end
  end
  player_numbers
end

def player_stats(player_name)
  if game_hash[:home][:players].include?(player_name)
    game_hash[:home][:players][player_name]
  else
    game_hash[:away][:players][player_name]
  end
end

def big_shoe_rebounds
  shoe_size = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_stats|
          shoe_size.push(player_stats[:shoe])
        end
      end
    end
  end
  biggest_shoe_size = shoe_size.sort![shoe_size.length-1]
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_stats|
          if player_stats[:shoe] == biggest_shoe_size
            return player_stats[:rebounds]
          end
        end
      end
    end
  end
end


# bonus
def most_points_scored
  points_scored = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_stats|
          points_scored.push(player_stats[:points])
        end
      end
    end
  end
  most_points = points_scored.sort![points_scored.length-1]
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_stats|
          if player_stats[:points] == most_points
            return player_name
          end
        end
      end
    end
  end
end

def winning_team
  home_points_scored = []
  total_home_points = home_points_scored.sum
  game_hash[:home].each do |attribute, data|
    if attribute == :players
      data.each do |player_name, player_stats|
        home_points_scored.push(player_stats[:points])
      end
    end
  end
  away_points_scored = []
  game_hash[:away].each do |attribute, data|
    if attribute == :players
      data.each do |player_name, player_stats|
        away_points_scored.push(player_stats[:points])
      end
    end
  end
  total_away_points = away_points_scored.sum
return total_home_points
end





# Write your code here!
