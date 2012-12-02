require 'erb'
require 'long_hard_look/text_ui'
require 'long_hard_look/package_report'
require 'long_hard_look/java_application'
require 'long_hard_look/filesystem_adapter'

module LongHardLook
	class LongHardLook

		def initialize
			ui = TextUI.new
			filesystem_adapter = FilesystemAdapter.new(ui.workspace)
			java_application = JavaApplication.new(filesystem_adapter, "AppA")
			PackageReport.new(ui, java_application).run
		end
	end
end

LongHardLook::LongHardLook.new
