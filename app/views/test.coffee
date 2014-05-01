CocoView = require 'views/kinds/CocoView'
template = require 'templates/test'

module.exports = class TestView extends CocoView
  id: "test-view"
  template: template

  constructor: (options, subpath) ->
    super(options)
    console.log 'subpath', subpath
    allFiles = window.require.list()
    console.log 'files', allFiles.length
    specFiles = (f for f in allFiles when f.indexOf('.spec') > -1)
    console.log 'spec files', specFiles
    subset = (f for f in specFiles when f.startsWith subpath)
    console.log 'subset', subset
    require f for f in subset # runs the tests