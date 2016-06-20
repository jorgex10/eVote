<% if @status.blank? %>
  alert("¡Proceso creado exitosamente!");
  $(window).attr("location","<%= polling_processes_path %>");
<% else %>
  alert("<%= @status.html_safe %>");
<% end %>