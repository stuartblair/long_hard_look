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
				it "returns only the extension" do
					@file_adapter = FileAdapter.new("/home/stuart/this.is.sometimes.see.bin", "")
					@file_adapter.extension.should eql "bin"
				end
			end
		end

		describe "#content" do 
			it "reflects the content of the file as set on the FileAdapter" do
				@file_adapter = FileAdapter.new("/home/stuart/README", "file content")
				@file_adapter.content.should eql "file content"
			end
		end
	end
end

