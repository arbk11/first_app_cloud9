class ApplicationController < ActionController::Base
    before_action :set_current_user
    
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end
    
    def authenticate_user
        if @current_user == nil
            flash[:notice] = "You need to login."
            redirect_to("/login")
        end
    end
    
    def forbid_login_user
        if @current_user
            flash[:notice] = "You have already logged in."
            redirect_to("posts/index")
        end
    end
    
    def ensure_correct_user
        if @current_user.id != params[:id].to_i
            flash[:notice] = "You do not have permission."
            redirect_to("/posts/index")
        end
    end
    
end
