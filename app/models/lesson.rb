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

  STATIONS = ['San Francisco', '22nd Street', 'Bayshore', 'South San Francisco', 'San Bruno', 'Millbrae',
              'Broadway Weekend only', 'Burlingame', 'San Mateo', 'Hayward Park', 'Hillsdale', 'Belmont',
              'San Carlos', 'Redwood City', 'Menlo Park', 'Palo Alto', 'California Ave.', 'San Antonio', 'Mountain View',
              'Sunnyvale', 'Lawrence', 'Santa Clara', 'College Park', 'San Jose Diridon']


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