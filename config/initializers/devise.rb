# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  config.secret_key = 'a3fe7dc79507e7e8b8bae8423d056b9a26cd39be9dfc8fa7d48ee106e5033651a46c3d393981f665f2bf1a8f3e6873b8c8a40ac20717e661d16b4511ce11b24a'

  config.mailer_sender = 'daybreaker@gmail.com'

  # Configure the class responsible to send e-mails.
  # config.mailer = 'Devise::Mailer'

  require 'devise/orm/active_record'

  # config.authentication_keys = [ :email ]
  # config.request_keys = []

  config.case_insensitive_keys = [ :email , :username ]
  config.strip_whitespace_keys = [ :email ]

  # config.params_authenticatable = true
  # config.http_authenticatable = false
  # config.http_authenticatable_on_xhr = true
  # config.http_authentication_realm = 'Application'
  # config.paranoid = true

  config.skip_session_storage = [:http_auth]

  # config.clean_up_csrf_token_on_authentication = true

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 10
  config.pepper = '8afab8024bd010baf786fde23177380b9ec7a5c7658499a1cb634f43eabe794777cbf9bc07b90c3c16085352c1a830b572d8bfd2c8890b4790ab1dbde8b5d4b7'

  # ==> Configuration for :confirmable
  # config.allow_unconfirmed_access_for = 2.days
  # config.confirm_within = 3.days
  config.reconfirmable = true

  # config.confirmation_keys = [ :email ]

  # ==> Configuration for :rememberable
  # config.remember_for = 2.weeks
  # config.extend_remember_period = false
  # config.rememberable_options = {}

  # ==> Configuration for :validatable
  config.password_length = 8..128
  # config.email_regexp = /\A[^@]+@[^@]+\z/

  # ==> Configuration for :timeoutable
  # config.timeout_in = 30.minutes
  # config.expire_auth_token_on_timeout = false

  # ==> Configuration for :lockable
  # config.lock_strategy = :failed_attempts
  # config.unlock_keys = [ :email ]
  # config.unlock_strategy = :both
  # config.maximum_attempts = 20
  # config.unlock_in = 1.hour
  # config.last_attempt_warning = false

  # ==> Configuration for :recoverable
  # config.reset_password_keys = [ :email ]
  config.reset_password_within = 12.hours

  # ==> Configuration for :encryptable
  # config.encryptor = :sha512

  # ==> Scopes configuration
  # config.scoped_views = false
  # config.default_scope = :user
  # config.sign_out_all_scopes = true

  # ==> Navigation configuration
  # config.navigational_formats = ['*/*', :html]
  config.sign_out_via = :delete

  # ==> OmniAuth
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'
  config.omniauth :facebook, Rails.application.secrets.facebook_key, Rails.application.secrets.facebook_secret
  config.omniauth :twitter, "KEY", "SECRET"

  # ==> Warden configuration
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

end
