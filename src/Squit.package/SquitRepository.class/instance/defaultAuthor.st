authorInformation
defaultAuthor
	| name email author |
	name := gitRepository repository configAt: 'user.name'.
	email := gitRepository repository configAt: 'user.email'.
	author := GitStamp now. "equivalent to ~/.gitconfig"
	name ifNotNil: [author name: name].
	email ifNotNil: [author email: email].
	^ author