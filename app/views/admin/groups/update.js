<% if @status.nil? %>
  alert("Partido de Votación fue modificado satisfactoriamente!");
  $(window).attr("location","<%= admin_groups_path %>");
<% else %>
  alert("<%= @status.html_safe %>");
<% end %>