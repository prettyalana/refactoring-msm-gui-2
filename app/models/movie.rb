# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  validates(:director_id, presence: true)
  validates(:title, uniqueness: true)

  belongs_to(:director)
  has_many(:characters)
  has_many(:actors, through: :characters, source: :actors)
  # def characters 
  #   key = self.id 
  #   the_many = Chracter.where( {:movie_id => key})
  #   return the_many
  # end

  # def director
  #   key = self.director_id

  #   matching_set = Director.where({ :id => key })

  #   the_one = matching_set.at(0)

  #   return the_one
  # end
end
