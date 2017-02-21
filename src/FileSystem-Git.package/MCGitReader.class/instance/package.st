accessing
package
	self halt.
	^ package ifNil: [ package := self loadPackage ]