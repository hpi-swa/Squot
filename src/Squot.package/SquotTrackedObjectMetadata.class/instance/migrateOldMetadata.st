update migration
migrateOldMetadata
	(SquotToggles useNewApi and: [(self includesKey: 'references') not]) ifTrue:
		[| references |
		references := self at: 'references' put: (Array with:
			((self at: #objectClassName) caseOf:
				{[#PackageInfo] ->
					['package' -> (Dictionary newFrom:
						{'type' -> 'package'.
						'content-type' -> (self class environment classNamed: (self at: #serializer)) contentType})]}
				otherwise:
					[((self at: #objectClassName) endsWith: ' class')
						ifTrue: ['class' -> (Dictionary newFrom:
									{'type' -> 'class'.
									'className' -> ((self at: #objectClassName) copyUpTo: Character space).
									'content-type' -> (self class environment classNamed: (self at: #serializer)) contentType})]
						ifFalse: ['object' -> (Dictionary newFrom: {'type' -> 'ValueHolder'})]])).
		(self at: #serializer) = #SquotSmartRefStreamSerializer ifTrue:
			[(references at: 1) value
				at: 'content-type' put: 'application/octet-stream';
				at: 'codec-class' put: 'SmartRefStream']].