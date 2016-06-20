class PollingProcessesController < ApplicationController
	layout 'set_process'

	def index
		@processes = PollingProcess.all
	end

	def new
		@process = PollingProcess.new
	end

	def create
		@process = PollingProcess.new(process_params)
		@process.school_id = School.first.id
		if @process.valid?
			@process.save
		else
			@status = @process.errors.full_messages.first
		end
	end

	private

	def process_params
		params.require(:polling_process).permit(:name, :description)
	end

end