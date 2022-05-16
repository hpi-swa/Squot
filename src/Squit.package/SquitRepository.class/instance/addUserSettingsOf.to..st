*Squit-UI
addUserSettingsOf: aSquotWorkingCopy to: aPluggableMenuSpec
	| serializers |
	serializers := ((aSquotWorkingCopy artifacts
		groupBy: [:each | each value storeInfo serializer])
		associations
		reject: [:each | each key isNil])
		collect: [:each | (self class environment classNamed: each key) -> each value].
	serializers do:
		[:each | each key
					addUserSettingsOfAll: each value
					in: aSquotWorkingCopy
					to: aPluggableMenuSpec].
	^ aPluggableMenuSpec