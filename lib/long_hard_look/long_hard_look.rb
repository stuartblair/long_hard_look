module LongHardLook
	class LongHardLook
	
		workspace = ARGV
		
		def self.path_prefix
			"#{File.dirname(__FILE__)}/../../"
		end

		def self.java_file_from(path)
			/test_workspace\/(.+?)\/.*\/(.+?)$/.match(Dir.glob("test_workspace/**/*.java")[0])[2]
		end

		def self.package_from(path)
			package = ""
			file_contents = ""
			IO.readlines(path).each {|line| file_contents << line}
			package = /\s*package (.+);/.match(file_contents)[1]
		end

		def self.application_name()
			"AppA"
		end

		app_to_java_file = {}

		Dir.glob("#{path_prefix}/test_workspace/**/*.java").each do |java_file|
			app_to_java_file[application_name] = package_from(java_file)
		end
		
		app_to_java_file.keys.each do |application_path|
			puts <<OUTPUT
Packages by application source tree
___________________________________
#{application_name}
* #{app_to_java_file[application_name]}
OUTPUT
		end
	end
end
