<% if @status.nil? %>
  alert("Votantes generados satisfactoriamente!");
  $('#partial-voters').html("<%= j render partial: 'voters', locals: {polling_station: @polling_station} %>");
<% else %>
  alert("<%= @status.html_safe %>");
<% end %>