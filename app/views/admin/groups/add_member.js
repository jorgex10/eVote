<% if @status.nil? %>
  alert("Miembro registrado satisfactoriamente!");
  $('#partial-members').html("<%= j render partial: 'members', locals: {group: @group} %>");
  $('#search_typeahead').val("");
<% else %>
  alert("<%= @status.html_safe %>");
<% end %>