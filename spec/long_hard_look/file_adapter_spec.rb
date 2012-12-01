require 'spec_helper'
require 'long_hard_look/file_adapter'

module LongHardLook
	describe FileAdapter do
		describe "#name" do
		end
		describe "#extension" do
			context "when a file has no extension" do
				it "returns nil" do
					@file_adapter = FileAdapter.new("/home/stuart/README", "")
					@file_adapter.extension.should be_nil
				end
			end

			context "when a file has a simple extension in its path" do
				it "returns the extension" do
					@file_adapter = FileAdapter.new("/home/stuart/hello_world.txt", "")
					@file_adapter.extension.should eql "txt"
				end
			end

			context "when a file has an multiple dots in its name" do
			end
		end
	end
end

