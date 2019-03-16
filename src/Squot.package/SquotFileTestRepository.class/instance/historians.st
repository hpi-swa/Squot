Squot repository
historians
	| historians |
	historians := self historianDirectory entries collect:
		[:each | self historianNamed: each basename].
	historians ifEmpty:
		[^ Array with: (self historianNamed: 'master')].
	^ historians