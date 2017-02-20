as yet unclassified
countVersions: aHistorian
	| count pending |
	pending := OrderedCollection new.
	pending add: aHistorian version.
	count := 0.
	[pending notEmpty]
		whileTrue: [pending addAll: pending removeFirst parents.
			count := count + 1].
	^ count