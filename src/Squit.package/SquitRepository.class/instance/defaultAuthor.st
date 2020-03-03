authorInformation
defaultAuthor
	| name email author |
	name := self gitRepository configAt: 'user.name'.
	email := self gitRepository configAt: 'user.email'.
	author := GitStamp now. "equivalent to ~/.gitconfig"
	name ifNotNil: [author name: name].
	email ifNotNil: [author email: email].
	^ author