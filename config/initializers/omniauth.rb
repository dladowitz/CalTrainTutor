Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    provider :facebook, '399084033489037', 'df441fe6a567e3e607b8c6570864af51',
             :scope => 'user_birthday'
  else
    provider :facebook, '226464100760780', 'bb12366f7ecccd3bbb9a8119acdd47bf',
             :scope => 'user_birthday'
  end
end