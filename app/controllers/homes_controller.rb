class HomesController < ApplicationController

    #Declarando el layout particular que usaremos
    layout "home"
    
    def inicio
          redirect_to welcomes_inicio_path unless current_user.is_a?(InvitedUser)
    end
    
    
    end
    