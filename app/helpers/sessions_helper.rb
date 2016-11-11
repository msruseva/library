module SessionsHelper

	def current_user
		@user ||= User.find(session[:user])
	end

	def log_in(user)
		session[:user] = user.id
	end

	def log_out
		@user = nil
		session.delete(:user)
	end

	def logged_in?
		!session[:user].nil?
	end
end