<% if @status.nil? %>
	alert("Mesa de sufragio fue creada satisfactoriamente!");
	$('.ui.modal').modal('hide');
	$(window).attr("location","<%= polling_stations_path %>");
<% else %>
  alert("<%= @status.html_safe %>");
<% end %>