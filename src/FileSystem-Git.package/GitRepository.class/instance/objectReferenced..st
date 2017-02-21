public-accessing-objects
objectReferenced: aString
	"Answer the git object referenced by aString.
	For example:
		self objectReferenced: 'master'
	...should answer the GitCommit referenced in refs/heads/master."
	^ self objectNamed: ((self resolveRef: aString) ifNil: [^ nil])