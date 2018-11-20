private
expandRemoteRef: aString
	self validateReferenceName: aString.
	(aString beginsWith: 'refs/') ifTrue: [^ aString].
	((aString beginsWith: 'heads/') or: [(aString beginsWith: 'tags/')])
		ifTrue: [^ 'refs/', aString].
	(aString allSatisfy: [:each | each isUppercase or: [each = $_]]) ifTrue: [^ aString]. "HEAD, for example"
	^ 'refs/heads/', aString