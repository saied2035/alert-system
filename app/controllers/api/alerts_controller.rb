class Api::AlertsController < ApiController
	def index
	  alerts = Alert.all
	  render json: alerts
	end
	def create
	  alert = Alert.new(alert_params)
	  if alert.save
	    render json: "Alert was created successfully."
	  else
	    render alert.errors	
	  end	
	end

	private

	def alert_params
	  params.require(:alert).permit(:type, :description,:origin, :tag => [])	
	end	
end
