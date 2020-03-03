actions
excludeMethodsThatAreAssumedUnchanged
	| packageNodes changeSet classNames |
	changeSet := ChangeSet named: 'AssumeUnchanged'.
	changeSet ifNil: [^ self].
	classNames := changeSet changedClassNames asSet.
	packageNodes := rootNodes select: [:each | each content object shadowOfTrackedObject isKindOf: SquotPackageShadow].
	packageNodes do: [:eachPackage |
		eachPackage children do: [:eachClass |
			((eachClass content isKindOf: SquotPackageDiffClassChanges)
				and: [classNames includes: eachClass content className]) ifTrue:
				[ | selectors |
				selectors := ((changeSet selectorsInClass: eachClass content className), (changeSet selectorsInClass: eachClass content className, ' class')) asSet.
				eachClass children
					select: [:each | each content definition isMethodDefinition]
					thenDo: [:eachMethod |
						(selectors includes: eachMethod content definition selector) ifTrue:
							[eachMethod exclude]].
				(changeSet classChangeAt: eachClass content className) ifNotEmpty:
					[eachClass children
						select: [:each | each content definition isClassDefinition]
						thenDo: [:eachClassDef | eachClassDef exclude]].
				eachClass hasActiveChildren ifFalse: [eachClass exclude]]]].