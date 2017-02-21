creating versions
createNewVersion: aSnapshot with: aBlock
	"Build a new version with aSnapshot as its snapshot and my version as the first parent,
	then supply the new version or a builder object for it to aBlock, during which additional
	properties can be set up. When aBlock returns normally, store the new version and
	update me to refer to it."
	| newVersion |
	newVersion := self repository createNewVersion: aSnapshot
		with: [:version | version
			parents: (self version
				ifNil: [OrderedCollection new]
				ifNotNil: [:it | OrderedCollection with: it]);
			in: aBlock].
	self version: newVersion.
	^ newVersion