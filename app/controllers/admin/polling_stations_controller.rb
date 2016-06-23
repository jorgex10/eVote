class Admin::PollingStationsController < AdminController
  def index
  	@polling_stations = PollingStation.mine
    @voters_count = Voter.mine.count
  end

  def create_station
    if params[:initials].empty? and params[:tables_number].empty?
      render js: "alert('Ingrese información en los campos para continuar.')"
    else
      if params[:initials].empty?
        render js: "alert('Ingrese una inicial para el nombre de las mesas a crear.')"
      end
      if params[:tables_number].empty?
        render js: "alert('Ingrese la cantidad de mesas a crear.')"
      else
        voters = Voter.count
        if params[:tables_number].to_i > voters
          render js: "alert('Ingrese un número de mesas menor a la cantidad de votantes.')"
        else
          number = params[:tables_number].to_i
          number_stations = voters / number
          additional_members = voters % number
          if additional_members != 0
            number_stations = number_stations + 1
          end
          number_stations.times do |index|
            PollingStation.create(code: (params[:initials] + (index + 1).to_s), name: (params[:initials] + "-mesa-" + (index + 1).to_s), school_id: 1)
          end
        end
      end
    end
  end

  private

  def station_params
  	params.require(:polling_station).permit(:code, :name)
  end

end