class UsersController < ApplicationController
    
    before_action :user_session, only: [:show]
    
        def show
            @user = current_user   
        end


    #Def pour le before action --> la page profil ne doit être accessible que par la personne concernée.
    def user_session
        if !user_signed_in?
            redirect_to root_path
        else
        @user_session = current_user.id
        end
    end

end
