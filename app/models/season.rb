# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  year       :integer
#  created_at :datetime
#  updated_at :datetime
#
class Season < ActiveRecord::Base
  has_many :weeks
  has_many :picksets

  def to_json
    season_weeks = weeks.collect do |week|
      {
        week: week,
        games: week.games.collect do |game|
          { game_info: game, teams: game.teams, pick: game.user_pick }
        end
      }
    end
    {season: self, weeks: season_weeks }
  end

  def self.current
    find_by(year: 2015)
  end

  def all_includes
    includes(weeks: { games: [:away_team, :home_team] })
  end

  def games
    weeks.map { |w| [w.number, w.games.sort { |x, y| x.home_team.abbr <=> y.home_team.abbr }] }
  end
end
