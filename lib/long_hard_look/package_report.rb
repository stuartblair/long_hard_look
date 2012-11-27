module LongHardLook
	class PackageReport
		def initialize(ui, java_application)
			@ui = ui
			@java_application = java_application
		end

		def run
			output = %{<%=render_header%>
<%=render_application(@java_application.name, @java_application.packages)%>}
		@ui.render(ERB.new(output).result(binding))
		end

		def render_header
			ERB.new(%{Packages by application source tree
___________________________________}).result(binding)
		end

		def render_application(application, packages)
			ERB.new(%{<%=application%><% packages.each do |package| %>
* <%=package%>
<% end %>}).result(binding)
		end

	end
end
