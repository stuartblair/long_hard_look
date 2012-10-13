Feature: Report of all packages defined by each application source tree
	As a software developer,
	I want to see all the packages defined by each application source tree
	So that I can spot inconsistencies in package and application names

	Scenario: Text report
		Given an Application Source Tree called AppA
		And AppA contains the package org.service.components
		When a Text Report is generated
		Then the Text Report looks like
		"""
		Packages by application source tree
		___________________________________
		AppA
		* org.service.components
		"""


