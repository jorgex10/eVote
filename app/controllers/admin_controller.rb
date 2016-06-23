class AdminController < ApplicationController
	layout 'admin'

  before_action :verify_current_process

  def delete_current_process
    active_process = PollingProcess.where(status: 1).first
    active_process.update(status: 0)
    redirect_to polling_processes_path
  end

  def current_process
    @current_process ||= PollingProcess.where(status: 1).first
  end

  def verify_current_process
    redirect_to polling_processes_path if current_process.blank?
  end

end
