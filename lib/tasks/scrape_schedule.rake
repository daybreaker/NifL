task :scrape_espn => :environment do
  require "nokogiri"
  require "open-uri"

  puts "Opening URL..."
  doc = Nokogiri::HTML(open("http://espn.go.com/nfl/schedulegrid"))

  # Set up Season
  season = Season.find_by(year: 2015)
  if season.blank?
    puts "Creating new Season"
    season = Season.new(year: 2015)
    season.save
  end

  # Set up Weeks
  (1..17).each do |week_num|
    # Set up Season -> Week
    week_attributes = {number: week_num, season_id: season.id}
    week = Week.where(week_attributes).first
    if week.blank?
      week = Week.new(week_attributes)
      week.save
    end
  end

  schedule = doc.at_css("div#my-teams-table table.tablehead")

  schedule.css("tr.oddrow, tr.evenrow").each do |team|
    name_cell, *opponent_cells = team.css('td')

    team_name = name_cell.css("a").text
    team = Team.find_by(abbr: team_name)
    if team.blank?
      team = Team.new(abbr: team_name)
      team.save
    end

    opponent_cells.each_with_index do |opponent, index|
      week = Week.find_by(number: index + 1, season: season)

      game = opponent.text
      if game == 'BYE'
        puts "BYE WEEK"
        bye_attributes = {week_id: week.id, team_id: team.id}
        bye = Bye.find_by(bye_attributes)
        if bye.blank?
          bye = Bye.new(bye_attributes)
          bye.save
        end
      else
        other_team_abbr = game.gsub("@","")
        other_team = Team.find_by_abbr(other_team_abbr)

        if other_team.blank?
          other_team = Team.new(abbr: other_team_abbr)
          other_team.save
        end

        if game.include?("@")
          home_team = other_team
          away_team = team
        else
          home_team = team
          away_team = other_team
        end

        puts "HOME TEAM: #{home_team.abbr}"
        puts "AWAY TEAM: #{away_team.abbr}"

        game_attributes = {week_id: week.id, away_team_id: away_team.id, home_team_id: home_team.id}
        puts "GAME ATTRIBUTES: #{game_attributes}"
        game = Game.find_by(game_attributes)
        if game.blank?
          puts "NO GAME FOUND -- MAKING ONE"
          game = Game.new(game_attributes)
          game.save
        end
      end
    end
  end

end
