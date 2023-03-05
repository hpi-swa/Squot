update migration
migrateOldMetadata
	(SquotToggles useNewApi and: [(self includesKey: 'references') not]) ifTrue:
		[| references |
		references := self at: 'references' put: (Array with:
			((self at: #objectClassName) caseOf:
				{[#PackageInfo] ->
					[| path packageName referenceInfo referenceId |
					referenceInfo := OrderedDictionary newFrom:
						{'type' -> 'package'.
						'content-type' -> (self class environment classNamed: (self at: #serializer)) contentType}.
					path := self at: #path.
					packageName := (self at: #serializer) caseOf:
						{[#SquotCypressCodeSerializer] ->
							[| fragment |
							fragment := path allButLast: (#('.package' '.pkg' '') detect: [:each | path endsWith: each]) size.
							(fragment copyAfterLast: $/) ifEmpty: [fragment]].
						[#SquotTonelSerializer] -> [(path copyAfterLast: $/) ifEmpty: [path]]}
						otherwise: ['?_at_', path].
					packageName ifNotNil:
						[referenceInfo at: 'packageName' put: packageName].
					referenceId := packageName
						ifNotNil: ['package_', packageName]
						ifNil: ['package'].
					referenceId -> referenceInfo]}
				otherwise:
					[((self at: #objectClassName) endsWith: ' class')
						ifTrue: ['class' -> (OrderedDictionary newFrom:
									{'type' -> 'class'.
									'className' -> ((self at: #objectClassName) copyUpTo: Character space).
									'content-type' -> (self class environment classNamed: (self at: #serializer)) contentType})]
						ifFalse: ['object' -> (OrderedDictionary newFrom: {'type' -> 'ValueHolder'})]])).
		(self at: #serializer) = #SquotSmartRefStreamSerializer ifTrue:
			[(references at: 1) value
				at: 'content-type' put: 'application/octet-stream';
				at: 'codec-class' put: 'SmartRefStream']].