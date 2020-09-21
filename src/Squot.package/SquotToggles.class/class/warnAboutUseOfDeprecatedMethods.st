accessing
warnAboutUseOfDeprecatedMethods
	<preference: 'Warn when Squot methods are used in a deprecated way'
		categoryList: #('Squot expert settings')
		description: 'Interrupt with a deprecation warning if objects are not used as they should be under the current set of settings.'
		type: #Boolean>
	^ WarnAboutUseOfDeprecatedMethods ifNil: [false]