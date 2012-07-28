class Lesson
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :start, type: String
  field :end, type: String
  field :time, type: String

end