*FileSystem-Git-Config
gitConfigBoolean
	(#('true' 'yes' 'on' '1') includes: self) ifTrue: [^ true].
	(#('false' 'no' 'off' '0') includes: self) ifTrue: [^ false].
	self notify: 'config value is not a recognized boolean: ', self, '.', String cr, 
		'Proceed to assume false.'.
	^ false