public-configuration
configSubsetWithPrefix: aString
	"Answer a collection of Associations (not a Dictionary!) for configuration settings
	that start with the given prefix string. For example, the prefix 'remote.origin' gives all
	settings in the section [remote ""origin""], and the prefix 'remote' gives all settings for
	all remotes. A collection is answered because some options can appear multiple times,
	such as fetch refspecs."
	| subset config sectionHead nameParts file |
	self privateDeprecatedUseUnitOfWork.
	subset := OrderedCollection new.
	file := self configFile.
	file exists ifFalse: [^ subset].
	self flag: #FIXME. "INIFile uses Dictionary to store sections, so duplicate keys are not possible there! Also, it does not preserve the order of the settings."
	config := file readStreamDo: [:stream | stream ascii. INIFile readFrom: stream].
	nameParts := aString splitBy: '.'.
	sectionHead := nameParts first.
	config sectionsDo: [:eachSection | | sectionLabel sectionNameParts spaceIndex |
		sectionLabel := eachSection label.
		(sectionLabel beginsWith: sectionHead) ifTrue:
			[(spaceIndex := sectionLabel indexOf: Character space) == 0
				ifTrue: [sectionNameParts := Array with: sectionLabel]
				ifFalse: [sectionNameParts := ((sectionLabel copyFrom: spaceIndex + 2 to: sectionLabel size - 1)
						splitBy: '.') copyWithFirst: (sectionLabel copyUpTo: Character space)].
			(sectionNameParts beginsWith: nameParts) ifTrue:
				[eachSection associationsDo: [:eachSetting |
					subset add:
						(sectionNameParts joinSeparatedBy: '.'), '.', eachSetting key
						-> eachSetting value]]]].
	^ subset asArray