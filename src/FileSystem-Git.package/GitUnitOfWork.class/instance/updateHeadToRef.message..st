branches and tags
updateHeadToRef: ref message: aString
	"Updates the reference in 'HEAD' to ref"
	self updateSymbolicRef: 'HEAD' toRef: ref message: aString.