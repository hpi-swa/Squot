diffing high-level
left: leftShadow right: rightShadow
	"Answer a diff that would transform leftShadow into rightShadow"
	^ leftShadow squotDiffAgainst: rightShadow with: self