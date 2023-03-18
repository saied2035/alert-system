class DeviseOverrides::SessionsController < Devise::SessionsController
	def new
    respond_to do |format|
        format.json { render json: "The user has not signed in yet." }
        format.html {super()}  
    end
  end
end	