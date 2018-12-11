class WelcomesController < ApplicationController
    #Permisos gracias a Petergate
    #access    administrador: :all,
    #          site_admin: :all
      
    #Declarando el layout particular que usaremos
    layout "1_column"
    
      def inicio
          #Solo se extraen las comunidades administradas por el administrador loggeado
        @community_administrators = Community.where(["administrador_id = ?", "#{current_user.id}"]).order("nombre ASC")
        
        community_administrator_ids = @community_administrators.pluck(:id)
        @count_properties = 0
        community_administrators_ids.each do |id|
            @count_properties = @count_properties + CoownershipUnit.where(["community_id = ?", "#{id}"]).count
        end
    
      end
    
    
    
    end
    