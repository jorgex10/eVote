<% if @status.nil? %>
  alert("Miembro eliminado satisfactoriamente!");
  $('#partial-members').html("<%= j render partial: 'members', locals: {group: @group} %>");
<% else %>
  alert("<%= @status.html_safe %>");
<% end %>