authorInformation
defaultAuthor
	| name email author |
	name := self git configAt: 'user.name'.
	email := self git configAt: 'user.email'.
	author := GitStamp now. "equivalent to ~/.gitconfig"
	name ifNotNil: [author name: name].
	email ifNotNil: [author email: email].
	^ author