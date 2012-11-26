require 'spec_helper'
require 'long_hard_look/text_ui'
module LongHardLook
	describe TextUI do
		context "when valid commandline is provided" do
			before(:each) do
				@text_ui = TextUI.new(["--report", "package_report", "--format", "text", "--workspace", "/home/stuart/test_workspace"])
			end

			it "maps the report type correctly" do
				@text_ui.report.should eql "package_report"
			end

			it "maps the format type correctly" do
				@text_ui.format.should eql "text"
			end

			it "maps the workspace correctly" do
				@text_ui.workspace.should eql "/home/stuart/test_workspace"
			end
		end
	end
end
