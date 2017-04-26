# Squot [![Build Status][travis_badge]][travis]
Squeak Object Tracker - Version control for arbitrary objects in Squeak, currently with Git storage

This repository also contains a variant of the FileSystem library,
which is an alternative to the FileDirectory API and has replaced the latter in Pharo.
However, our version of the FileSystem library descends from the last version of it for Squeak
and is not compatible with Pharo's FileSystem classes.

The package that provides Git connectivity for Squot is named Squit.
It uses the package FileSystem-Git (also included here) to browse and manipulate Git repositories.

## Installation instructions

You will need a Squeak trunk image that is newer than 2017-03-12. The image's version number should be at about 17037 or higher.

First install the latest [Metacello](//github.com/dalehenrich/metacello-work), then you can use the following code to load Squot and all its prerequisites:

```smalltalk
Metacello new
  baseline: 'Squot';
  repository: 'github://hpi-swa/Squot:master/src';
  load.
```

## Usage instructions

Squot uses an ImageStore to remember objects (including packages) that should be tracked.
A WorkingCopy combines such a store with a repository, for example a SquitRepository (a Git repository).

Terminology note: Squot is based on an abstraction for version control systems named Pur.
It coins the name "Historian" for label-based branches, such as Git's head references.

```smalltalk
workingCopy := SquotWorkingCopy new.
workingCopy store: SquotImageStore new.
workingCopy repository:
  (SquitRepository onDirectory: FileSystem disk / 'path' / 'to' / 'your' / 'repository.git').
workingCopy loadedHistorian: (workingCopy repository historianNamed: 'master').
workingCopy add: (PackageInfo named: 'YourPackage') at: 'src'.
workingCopy add: (PackageInfo named: 'AnotherPackage') at: 'src'.
workingCopy add: anyObject at: 'objects/myObject'.
workingCopy saveNewVersionInteractively.
workingCopy loadCurrentVersionInteractively.
```

Note that Monticello versions will be created in the package cache repository
whenever you save a new version (commit) that modifies the code of a package.
These are for backup purposes until Squot and Squit are sufficiently stable.

## Converting Monticello history

A converter and a verifier for the created versions is included.

```smalltalk
repository := SquitRepository onDirectory: FileSystem disk / 'path' / 'to' / 'your' / 'repository.git'.
packageName := 'FileSystem-Git'.
historianName := 'refs/heads/import-fsgit'.
SquotMonticelloConverter
  convertUpToLoadedVersionOfPackageNamed: packageName
  asHistorianNamed: historianName in: repository.
SquotMonticelloConverterVerifier
  verifyVersionsOf: (repository historianNamed: historianName)
  ofLoadedPackageNamed: packageName.
```

## Goodies

Because Squot does not yet include a sufficient set of tools to manipulate a
Git repository, you may want to create a button that opens gitk or another
program on the repository.

Here a do-it for Windows users (requires OSProcess):
```smalltalk
OSProcess command: 'cmd /C start /D "', (squitRepository gitRepository repository baseDir pathString), '" gitk --all'.
```

[travis]: https://travis-ci.org/hpi-swa/Squot
[travis_badge]: https://travis-ci.org/hpi-swa/Squot.svg?branch=master
