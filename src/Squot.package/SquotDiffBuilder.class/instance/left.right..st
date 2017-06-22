diffing high-level
left: leftShadow right: rightShadow
	"Answer a diff that would transform leftShadow into rightShadow"
	rightShadow hasSquotShadowName ifTrue:
		[leftShadow hasSquotShadowName
			ifTrue: [leftShadow name = rightShadow name
					ifFalse: [^ self replacing: leftShadow with: rightShadow]]
			ifFalse: [^ self replacing: leftShadow with: rightShadow]].
	^ leftShadow squotDiffAgainst: rightShadow with: self