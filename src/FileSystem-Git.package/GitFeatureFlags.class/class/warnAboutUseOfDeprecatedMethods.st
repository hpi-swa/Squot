accessing
warnAboutUseOfDeprecatedMethods
	<preference: 'Warn when Git methods are used in a deprecated way'
		categoryList: #('Git expert settings')
		description: 'Interrupt with a deprecation warning if objects are not used as they should be under the current set of settings.'
		type: #Boolean>
	^ WarnAboutUseOfDeprecatedMethods ifNil: [false]