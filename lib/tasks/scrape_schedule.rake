task :load_schedule => :environment  do
  require "nokogiri"
  require "open-uri"
  
  puts "Opening URL..."
  doc = Nokogiri::HTML(open("http://www.fantasypros.com/nfl/schedule.php"))
  
  # Set up Season
  season = Season.where(year: 2013).first
  if season.blank?
    season = Season.new(year: 2013)
    season.save
  end

  schedule = doc.at_css("#content table")

  schedule.css("tbody tr").each do |team|
    team_cells = team.css("td")
    team_name = team_cells[0].css("a").text
    team = Team.where(abbr: team_name).first
    if team.blank?
      team = Team.new(abbr: team_name)
      team.save
    end

    (1..17).each do |week_num|
      # Set up Season -> Week
      week_attributes = {number: week_num, season_id: season.id}
      week = Week.where(week_attributes).first
      if week.blank?
        week = Week.new(week_attributes)
        week.save
      end
      
      #Set up Season -> Week -> Game / Bye
      game = team_cells[week_num].css("a").text
      if game == 'BYE'
        bye_attributes = {week_id: week.id, team_id: team.id}
        bye = Bye.where(bye_attributes).first
        if bye.blank?
          bye = Bye.new(bye_attributes)
          bye.save
        end
      else
        loc, other_team_abbr = game.split(" ")
        
        other_team = Team.find_by_abbr(other_team_abbr)
        
        if other_team.blank?
          other_team = Team.new(abbr: other_team_abbr)
          other_team.save
        end
        
        home_team = loc == "vs" ? team : other_team
        away_team = loc == "at" ? team : other_team

        game_attributes = {week_id: week.id, away_team_id: away_team.id, home_team_id: home_team.id}
        game = Game.where(game_attributes).first
        if game.blank?
          game = Game.new(game_attributes)
          game.save
        end
        
      end
    end
  end
end
