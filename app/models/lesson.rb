class Lesson
  include Mongoid::Document
  include Mongoid::Timestamps

  #creator
  belongs_to :creator, class_name: 'User', inverse_of: :lessons_offered
  belongs_to :student, class_name: 'User', inverse_of: :lessons_received

  field :title, type: String
  field :start, type: String
  field :end, type: String
  field :time, type: String

  field :payment, type: Hash, default: {}

  alias_method :name, :title

  def cardnumber
    self.payment[:cardnumber]
  end

  def cardcvc
    self.payment[:cardcvc]
  end

  def cardexpirymonth
    self.payment[:cardexpirymonth]
  end

  def cardexpirymonth
    self.payment[:cardexpirymonth]
  end



end