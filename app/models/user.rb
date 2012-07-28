class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # created
  has_many :lessons_offered, class_name: 'Lesson', inverse_of: :creator
  has_many :lessons_received, class_name: 'Lesson', inverse_of: :student

  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end

  def purchase(lesson, payment_info)
    #if lesson.student.present?
    #  raise "Already has student: #{lesson.student.name}"
    #end

    # todo: validate ?

    lesson.payment = payment_info
    lesson.student = self
    lesson.save
  end

end
