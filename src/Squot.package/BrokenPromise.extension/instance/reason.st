*Squot-Tools
reason
	| nested |
	nested := promise.
	[(nested isKindOf: Promise) and: [nested isRejected]] whileTrue: [nested := nested error].
	^ nested