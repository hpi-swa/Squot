actions
actionGitUserEdit
	| gitRepository defaultAuthor userName userEmail |
	self withUnitOfWork:
	[gitRepository := self projectSelection repository git.
	defaultAuthor := self projectSelection repository defaultAuthor.

	userName := SquotGUI request: 'Git user name:' initialAnswer: defaultAuthor name.
	userName ifNotEmpty: [gitRepository configAt: 'user.name' put: userName].

	userEmail := SquotGUI request: 'Git user email:' initialAnswer: defaultAuthor email.
	userEmail ifNotEmpty: [gitRepository configAt: 'user.email' put: userEmail]].