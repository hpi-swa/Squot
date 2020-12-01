private
performTest
	^ self suppressProgressDisplayDuring:
		[[super performTest]
			on: Deprecation do:
				[:d |
				(SquotToggles warnAboutUseOfDeprecatedMethods and: [self selector includesSubstring: 'Old'])
					ifTrue: [d resume]
					ifFalse: [d pass]]]