require 'erb'
require 'long_hard_look/text_ui'
module LongHardLook
	class LongHardLook
	
		ui = TextUI.new

		def self.package_from(path)
			package = ""
			file_contents = ""
			IO.readlines(path).each {|line| file_contents << line}
			package = /\s*package (.+);/.match(file_contents)[1]
		end

		def self.application_name_from(path)
			path.split('/').last
		end

		app_to_java_file = {}

		Dir.glob("#{ui.workspace}/*").each do |application_path|
			Dir.glob("#{application_path}/**/*.java").each do |java_file|
				app_to_java_file[application_name_from(application_path)] = package_from(java_file)
			end
		end

OUTPUT =
%{Packages by application source tree
___________________________________
<%for application in app_to_java_file.keys%><%=application%>
* <%=app_to_java_file[application]%>
<%end%>}
		puts ERB.new(OUTPUT).result(binding)
	end
end
