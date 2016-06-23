module ApplicationHelper
  def current_process
    PollingProcess.where(status: 1).first
  end
end
