authorInformation
defaultAuthor
	| name email author configAccessor |
	configAccessor := 
		GitFeatureFlags useUnitOfWorkInterface
			ifTrue: [GitCurrentUnitOfWork value]
			ifFalse: [gitRepository repository].
	name := configAccessor configAt: 'user.name'.
	email := configAccessor configAt: 'user.email'.
	author := GitStamp now. "equivalent to ~/.gitconfig"
	name ifNotNil: [author name: name].
	email ifNotNil: [author email: email].
	^ author