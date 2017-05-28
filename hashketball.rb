require "pry"

def game_hash
{
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
        },

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
        },

      }
    }
}
end

def num_points_scored(player)
  points = nil
  game_hash.each do |team, data|
    data.each do |team_attributes, data|
      if team_attributes == :players
        data.each do |specific_player, stats|
          if specific_player == player
            stats.each do |stat, value|
              points = value if stat == :points
            end
          end
        end
      end
    end
  end
  points
end

def shoe_size(player)
  shoe = nil
  game_hash.each do |team, data|
    data.each do |team_attributes, data|
      if team_attributes == :players
        data.each do |specific_player, stats|
          if specific_player == player
            stats.each do |stat, value|
              shoe = value if stat == :shoe
            end
          end
        end
      end
    end
  end
  shoe
end


def team_colors(given_team)
  colors = nil
  game_hash.each do |team, data|
    if data.flatten.include?(given_team)
      data.each do |attributes, data|
        colors = data if attributes == :colors
      end
    end
  end
  colors
end


def team_names
  team_names_arr = []
    game_hash.each do |team, data|
      data.each do |attributes, data|
        team_names_arr << data if attributes == :team_name
      end
    end
  team_names_arr
end



def player_numbers(given_team)
  player_nums_arr = []
    game_hash.each do |teams, data|
      if data.flatten.include?(given_team)
        data.each do |attributes, data|
          if attributes == :players
            data.each do |player_name, stats|
              stats.each do |stat_type, value|
                player_nums_arr << value if stat_type == :number
              end
            end
          end
        end
      end
    end
  player_nums_arr
end


def player_stats(team_player)
  player_stat_hash = {}
  game_hash.each do |teams, data|
    data.each do |attributes, data|
      if attributes == :players
        data.each do |player_name, stats|
          if player_name == team_player
            stats.each do |each_stat, value|
              player_stat_hash[each_stat] = value
            end
          end
        end
      end
    end
  end
  player_stat_hash
end

def big_shoe_rebounds
  biggest_shoe_size = nil
  player_with_biggest_shoe = nil
  rebound_number = nil

  game_hash.each do |teams, data|
    data.each do |attributes, data|
      if attributes == :players
        data.each do |player_name, stats|
          stats.each do |specific_stat, value|
            if specific_stat == :shoe
              if biggest_shoe_size == nil
                biggest_shoe_size = value
                player_with_biggest_shoe = player_name
              else
                if value > biggest_shoe_size
                  biggest_shoe_size = value
                  player_with_biggest_shoe = player_name
                end
              end
            end
          end
        end
      end
    end
  end

  game_hash.each do |teams, data|
    data.each do |attributes, data|
      if attributes == :players
        data.each do |specific_player, stats|
          if specific_player == player_with_biggest_shoe
            stats.each do |specific_stat, value|
              rebound_number = value if specific_stat == :rebounds
            end
          end
        end
      end
    end
  end
  rebound_number
end
