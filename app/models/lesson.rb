class Lesson
  include Mongoid::Document
  include Mongoid::Timestamps

  #creator
  belongs_to :creator, class_name: 'User'
  belongs_to :student, class_name: 'User'

  field :title, type: String
  field :start, type: String
  field :end, type: String
  field :time, type: String

end