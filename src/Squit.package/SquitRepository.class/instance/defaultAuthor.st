authorInformation
defaultAuthor
	| name email author |
	name := self git configAt: 'user.name'.
	email := self git configAt: 'user.email'.
	author := GitStamp
		nowBy: (name ifNil: [GitStamp defaultName]) "equivalent to ~/.gitconfig"
		email: (email ifNil: [GitStamp defaultEmail]).
	^ author