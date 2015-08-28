# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  city       :string(255)
#  name       :string(255)
#  abbr       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  conference :string(255)
#  division   :string(255)
#

class Team < ActiveRecord::Base
  has_many :byes
  has_many :home_games, class_name: "Game", foreign_key: :home_team_id
  has_many :away_games, class_name: "Game", foreign_key: :away_team_id

  CONFERENCES = %w(afc nfc)
  DIVISIONS = %w(east north south west)

  def games(season: nil, include_byes: true)
    if season
      conds = { weeks: { season_id: season } }
      g = home_games.where(conds) + away_games.where(conds) + (include_byes ? byes.where(conds) : [])
    else
      g = home_games + away_games + (include_byes ? byes : [])
    end
    g.sort_by(&:week_number)
  end

  def opponents
    games(include_byes: false).collect { |x| x.other_team(self) }
  end

  def self.by_conference
    Team.order(conference: :asc, division: :asc).group_by(&:conference)
      .map { |c, y| [c, y.group_by(&:division)] }
  end
end
