require 'spec_helper'
require_relative '../../lib/long_hard_look/text_ui.rb'

describe LongHardLook::TextUI do
	context "when valid commandline is provided" do
		before(:each) do
			ARGV = ["--report=package_report", "--format=text", "/home/stuart/test_workspace"]
		end

		it "Maps the report type correctly" do
			LongHardLook::TextUI.new.report.should eql "package_report"
		end

		it "Maps the format type correctly" do
			LongHardLook::TextUI.new.format.should eql "text"
		end
	end
end
