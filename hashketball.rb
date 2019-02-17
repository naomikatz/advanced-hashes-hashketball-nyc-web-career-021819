# Write your code here!

def game_hash
  new_game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
			  "Alan Anderson" => {
				number: 0,
				shoe: 16,
				points: 22,
				rebounds: 12,
				assists: 12,
				steals: 3,
				blocks: 1,
				slam_dunks: 1
				},
				"Reggie Evans" => {
				number: 30,
				shoe: 14,
				points: 12,
				rebounds: 12,
				assists: 12,
				steals: 12,
				blocks: 12,
				slam_dunks: 7
				},
				"Brook Lopez" => {
				number: 11,
				shoe: 17,
				points: 17,
				rebounds: 19,
				assists: 10,
				steals: 3,
				blocks: 1,
				slam_dunks: 15
				},
	      "Mason Plumlee" => {
				number: 1,
				shoe: 19,
				points: 26,
				rebounds: 12,
				assists: 6,
				steals: 3,
				blocks: 8,
				slam_dunks: 5
				},
				"Jason Terry" => {
				number: 31,
			  shoe: 15,
				points: 19,
				rebounds: 2,
				assists: 2,
				steals: 4,
				blocks: 11,
				slam_dunks: 1
				}
      }
	  },
	:away => {
			:team_name => "Charlotte Hornets",
			:colors => ["Turquoise", "Purple"],
			:players => {
				"Jeff Adrien" => {
				number: 4,
				shoe: 18,
				points: 10,
				rebounds: 1,
				assists: 1,
				steals: 2,
				blocks: 7,
				slam_dunks: 2
				},
				"Bismak Biyombo" => {
				number: 0,
				shoe: 16,
				points: 12,
				rebounds: 4,
				assists: 7,
				steals: 7,
				blocks: 15,
				slam_dunks: 10
				},
				"DeSagna Diop" => {
			  number: 2,
			  shoe: 14,
				points: 24,
				rebounds: 12,
				assists: 12,
			  steals: 4,
			  blocks: 5,
				slam_dunks: 5
				},
				"Ben Gordon" => {
				number: 8,
				shoe: 15,
				points: 33,
				rebounds: 3,
				assists: 2,
				steals: 1,
				blocks: 1,
				slam_dunks: 0
				},
				"Brendan Haywood" => {
				number: 33,
				shoe: 15,
				points: 6,
				rebounds: 12,
				assists: 12,
				steals: 22,
				blocks: 5,
				slam_dunks: 12
			  }
		  }
		}
	}
end

def num_points_scored (players_name)
  game_hash.each do |team, data|
    if data[:players].has_key?(players_name)
      return data[:players][players_name][:points]
    end
  end
end

def shoe_size (players_name)
  game_hash.each do |team, data|
    if data[:players].has_key?(players_name)
      return data[:players][players_name][:shoe]
    end
  end
end

def team_colors (players_name)
  game_hash.each do |team, data|
    if data[:team_name] == players_name
      return data[:colors]
    end
  end
end

def team_names
  new_array = []
  game_hash.each do |team, data|
    new_array << data[:team_name]
  end
  return new_array
end

def player_numbers (players_name)
  jersey_number_array = []
  game_hash.each do |team, data|
    if data[:team_name] == players_name
      data.map do |nest2, data2|
        if nest2 == :players
          data2.map do |name,data3|
          jersey_number_array << data3[:number] end
        end
      end
    end
  end
  return jersey_number_array
end

 def player_stats (players_name)
  game_hash.each do |team, data|
    data.each do |attribute,data2|
      if attribute == :players
        data2.each do |player,data3|
          if player == players_name
            return data3
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_size = ["placeholder",{shoe: 0}]
   game_hash.each do |team, data|
     data.each do |attribute, data2|
       if attribute == :players
         largest_shoe_size = data2.inject(largest_shoe_size) do |player, data3|
           data3[1][:shoe] > player[1][:shoe] ? data3 : player
         end
       end
    end
   end
  largest_shoe_size[1][:rebounds]
end
