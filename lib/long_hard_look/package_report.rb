module LongHardLook
	class PackageReport
		def initialize(ui, filesystem_adapter)
			@ui = ui
			@filesystem_adapter = filesystem_adapter
		end

		def run
			@ui.render(<<OUTPUT
Packages by application source tree
___________________________________
AppA
* org.test
OUTPUT
								)
		end
	end
end
