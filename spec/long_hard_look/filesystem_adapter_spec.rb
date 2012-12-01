require 'spec_helper'
require 'long_hard_look/filesystem_adapter'

module LongHardLook
	describe FilesystemAdapter do
		before(:each) do
			@test_workspace = File.join(File.dirname(__FILE__), '..', '..', 'test_workspace')
			@dirs = [@test_workspace]
			clear_filesystem(@test_workspace)
		end

		context "when initialized to a directory containing multiple files" do 
			before(:each) do 
				within_workspace(@test_workspace) do
					create_file("txt")
					create_file("target.txt")
					create_file("also_found.txt")
				end
				@filesystem_adapter = FilesystemAdapter.new(@test_workspace)
			end

			context "find" do
				it "returns only files matching the required extension" do
					@filesystem_adapter.find(:txt).each do |file|
						file.extension.should eql "txt"
					end
				end
			end
		end
	end
end
