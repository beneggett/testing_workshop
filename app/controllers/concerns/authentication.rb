module Authentication
  extend ActiveSupport::Concern
  included do
    def authenticate(user)
      session[:user_id] = user.id
      redirect_to root_path, notice: "#{user.name}, welcome back!"
    end
  end
end
