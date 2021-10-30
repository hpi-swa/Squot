*Squot-Compatibility-Pharo
setAuthorInitials: aString during: aBlock
	"Copied from Pharo 5 Author>>useAuthor:during:"
	| previous |
	previous := AuthorInitials.
	AuthorInitials := aString.
	^ aBlock ensure: [AuthorInitials := previous]