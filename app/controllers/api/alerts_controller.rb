class Api::AlertsController < ApiController
	def index
	  alerts = Alert.all
	  render json: alerts
	end
	def create
	end

	private

	def alert_params
	  params.require(:alert).permit(:type, :description, :tag, :origin)	
	end	
end
