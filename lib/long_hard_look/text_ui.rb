require 'trollop'

module LongHardLook
	class TextUI
		attr_reader :report, :format

		def initialize
			options = Trollop::options do
				opt :report, "Report mode", :type => :string
				opt :format, "Report format", :type => :string, :default => "text"
			end

			@report = options[:report]
			@format = options[:format]
		end
	end
end
