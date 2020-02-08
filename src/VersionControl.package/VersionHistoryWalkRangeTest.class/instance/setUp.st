running
setUp
	super setUp.
	"version1 --- version2 --- version3 --- version6
	               `--- version4 --- version5 --´"
	versions := Array new: 6.
	versions at: 1 put: (self newVersion: '1' withParents: #()).
	versions at: 2 put: (self newVersion: '2' withParents: {versions at: 1}).
	versions at: 3 put: (self newVersion: '3' withParents: {versions at: 2}).
	versions at: 4 put: (self newVersion: '4' withParents: {versions at: 1}).
	versions at: 5 put: (self newVersion: '5' withParents: {versions at: 4}).
	versions at: 6 put: (self newVersion: '6' withParents: (versions atAll: #(3 5))).