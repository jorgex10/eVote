class PollingProcessesController < ApplicationController
	layout 'set_process'

	def index
		@processes = PollingProcess.all.sort_by{|x| x.id}
	end

	def new
		@process = PollingProcess.new
	end

	def create
		@process = PollingProcess.new(process_params)
		@process.school = School.first
		@process.admin = current_admin
		if @process.valid?
			@process.save
		else
			@status = @process.errors.full_messages.first
		end
	end

	def set_current_process
		process = PollingProcess.find params[:process_id]
		process.update(status: 1)
		redirect_to admin_users_path
	end

	private

	def process_params
		params.require(:polling_process).permit(:name, :description)
	end

end