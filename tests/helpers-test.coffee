chai        = require 'chai'
{ expect }  = chai
Helpers     = require '../lib/helpers'
pm          = require 'npm'

describe 'helpers-test =>', ->

  helpers = null

  beforeEach (done) ->
    pm.load((err, npm) ->
      helpers = new Helpers(npm)
      done())

  it "should have setup", ->
    expect(helpers).to.be.ok

  it "should find 'rstamp-' modules", ->
    expect(helpers).to.be.ok

  it "should have npm dirs", ->
    expect(helpers.globalDir).to.be.ok
    expect(helpers.cacheDir).to.be.ok

