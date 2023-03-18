class Api::AlertsController < ApiController
	def index
	end
	def create
	end

	private

	def alert_params
	  params.require(:alert).permit(:type, :description, tag: [], :origin)	
	end	
end
