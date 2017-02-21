instance creation
pack: aRepository
	| instance |
	instance := self new.
	instance repository: aRepository.
	(GitPackFileCreator on: instance) repackWithoutDelification.
	
	^ instance