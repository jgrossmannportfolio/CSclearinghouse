Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'YzOCiozwOjeVwyw2gOO2w', 'UOgvwI1jWHJWufeWIztzRLGLPdMPojNKzBpouBRtEM'
  provider :facebook, 'APP_ID', 'APP_SECRET'
  provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end