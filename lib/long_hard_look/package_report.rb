module LongHardLook
	class PackageReport
		def initialize(ui, filesystem_adapter)
			@ui = ui
			@filesystem_adapter = filesystem_adapter
		end

		def run
			output = %{<%=render_header%>
<%=render_application("AppA", ["org.test"])%>}
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
