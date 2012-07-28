Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
  if Rails.env.production?
    provider :facebook, '399084033489037', 'df441fe6a567e3e607b8c6570864af51'
  else
    provider :facebook, '226464100760780', 'bb12366f7ecccd3bbb9a8119acdd47bf'
  end
end