Feature: Report of all packages defined by each application source tree
	As a software developer,
	I want to see all the packages defined by each application source tree
	So that I can spot inconsistencies in package and application names

	Scenario: Text report for an application with a single package
		Given an application source tree called AppA
		And AppA contains the package org.service.components
		When I generate a text report of all_packages_by_application
		Then the output should contain exactly
"""
Packages by application source tree
___________________________________
AppA
* org.service.components

"""
@wip
	Scenario: Multiple applications with multiple packages are displayed
		Given an application source tree called AppA
		And AppA contains the package org.service.components
		And AppA contains the package org.service.view
		And an application source tree called AppB
		And AppB contains the package org.service.view
		When I generate a text report of all_packages_by_application
		Then the output should contain exactly
"""
Packages by application source tree
___________________________________
AppA
* org.service.components
* org.service.view
AppB
* org.service.view

"""


