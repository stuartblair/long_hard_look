module LongHardLook
	class JavaApplication
		attr_reader :name

		def initialize(filesystem_adapter, name)
			@name = name
			@filesystem_adapter = filesystem_adapter
		end

		def packages
			packages = []
			@filesystem_adapter.find(:java).each do |java_file|
				extracted_package = extract_package(java_file)
				packages << extracted_package if extracted_package
			end
			packages.uniq
		end

		private

		def extract_package(java_file)
			match_data = /\s*package (.+);/.match(java_file.content)
			return nil if !match_data 
			match_data[1]
		end
	end
end
