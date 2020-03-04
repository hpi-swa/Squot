actions
actionGitUserEdit
	| gitRepository defaultAuthor userName userEmail |
	self withUnitOfWork:
	[gitRepository := self projectSelection repository gitRepository.
	defaultAuthor := self projectSelection repository defaultAuthor.

	userName := UIManager default request: 'Git user name:' initialAnswer: defaultAuthor name.
	userName ifNotEmpty: [gitRepository configAt: 'user.name' put: userName].

	userEmail := UIManager default request: 'Git user email:' initialAnswer: defaultAuthor email.
	userEmail ifNotEmpty: [gitRepository configAt: 'user.email' put: userEmail]].