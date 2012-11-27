require 'spec_helper'
require 'long_hard_look/package_report'

module LongHardLook
	describe PackageReport do
		before(:each) do
			@ui = double('ui')
			@filesystem_adapter = double('filesystem_adapter')
			@file = double('file')
			@package_report = PackageReport.new(@ui, @filesystem_adapter)
		end

		describe "#run" do
			it "creates the expected report" do
				@ui.stub(:workspace).and_return("/home/stuart/test_workspace")
				@file.stub(:content).and_return("package org.test;")
				@filesystem_adapter.stub(:find).with(:below => "/home/stuart/test_workspace", :type => :java).and_return([@file])
				@ui.should_receive(:render).with(<<OUTPUT
Packages by application source tree
___________________________________
AppA
* org.test
OUTPUT
																				)
				@package_report.run
			end
		end
	end 
end
