class User
  include Mongoid::Document
  include Mongoid::Timestamps

  #auth
  field :provider, type: String
  field :uid, type: String
  field :credentials, type: Hash
  
  #auth[:info]
  field :nickname, type: String
  field :email, type: String
  field :name, type: String
  field :first_name, type: String
  field :last_name, type: String
  field :image, type: String
  field :urls, type: Hash
  field :location, type: String
  field :verified, type: Boolean
  
  #auth[:extra][:raw_info]
  field :link, type: String
  field :username, type: String
  field :gender, type: String
  field :timezone, type: Integer
  field :locale, type: String
  field :updated_time, type: String


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.credentials = auth['credentials']
      if auth['info']
        user.nickname = auth['info']['nickname'] || ""
        user.email = auth['info']['email'] || ""
        user.name = auth['info']['name'] || ""
        user.first_name = auth['info']['first_name'] || ""
        user.last_name = auth['info']['last_name'] || ""
        user.image = auth['info']['image'] || ""
        user.urls = auth['info']['urls'] || ""
        user.location = auth['info']['location'] || ""
        user.verified = auth['info']['verified'] || ""
        
        user.link = auth['extra']['raw_info']['link'] || "" 
        user.gender = auth['extra']['raw_info']['gender'] || "" 
        user.timezone = auth['extra']['raw_info']['timezone'] || "" 
        user.username = auth['extra']['raw_info']['username'] || "" 
        user.locale = auth['extra']['raw_info']['locale'] || "" 
        user.updated_time = auth['extra']['raw_info']['updated_time'] || "" 
        
      end
    end
  end

end
