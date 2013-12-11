# nodejs for [Pocket](http://getpocket.com)
nodejs for Pocket

## Install

First, install the pocket sdk with [npm](http://npmjs.org).
```
npm install getpocket
```

## Functions
- constructor: (consumer_key, redirect_uri) ->
- authorizeRoute: (req, res) ->
- authorize: (callback) ->
- getAccessToken: (code, callback) ->
- Pocket.getPocket(options, callback)


## Get pocket instance
`pocket = require('getpocket').getPocket({consumer_key: 'xxx', redirect_uri: 'http://example.com/pocket/callback'})`
or
```
  Pocket = require('getpocket')
  pocket = new Pocket('consumer_key', 'redirect_uri')
```
## How to use

```
  # res redirect to pocket auth
  app.get('/pocket/authorize', (req, res) -> pocket.authorizeRoute(req, res))

  app.get('/pocket/callback', (req,res) ->
  	pocket.getAccessToken(req.query.code, (err, r) ->
  		# r: { access_token: '', username: ''}
  		res.json(r)
  	)
  )
```
