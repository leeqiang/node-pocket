
qs = require('qs')
request = require('request')

class Pocket

	requestTokenUrl: 'https://getpocket.com/v3/oauth/request'
	authorizeUrl: 'https://getpocket.com/auth/authorize'
	accessTokenUrl: 'https://getpocket.com/v3/oauth/authorize'

	constrcutor: (@consumer_key, @callback) ->


	authorize: (callback) ->
		request.post(
			headers: {'content-type' : 'application/x-www-form-urlencoded'}
			url: @requestTokenUrl
			body: qs.stringify({
				consumer_key: @consumer_key
				redirect_uri: @callback
			})
		, (err, resp, result) ->
			try
				result = qs.parse(result)
				ri = encodeURIComponent("#{@callback}?code=#{result.code}")
				return callback(null, {redirect: "#{@authorizeUrl}?request_token=#{result.code}&redirect_uri=#{ri}"})
			catch e
				callback(e)
		)

	getAccessToken: (code, callback) ->
		request.post(
			headers: {'content-type' : 'application/x-www-form-urlencoded'}
			url: @accessTokenUrl
			body: qs.stringify({
				consumer_key: @consumer_key
				code: code
			})
		, (err, resp, result) ->
			try
				return callback(null, qs.parse(result))
			catch e
				callback(e)
		)

module.exports = Pocket