<% if @status.nil? %>
  alert("Partido de Votación fue creado satisfactoriamente!");
  $(window).attr("location","<%= admin_groups_path %>");
<% else %>
  alert("<%= @status.html_safe %>");
<% end %>