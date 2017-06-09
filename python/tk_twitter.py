TW_ERROR_CODES = {
  '32' : { 'text': 'Could not authenticate you', 'description': 'Your call could not be completed as dialed.' },
  '34' : { 'text': 'Sorry, that page does not exist', 'description': 'Corresponds with an HTTP 404 - the specified resource was not found.' },
  '64' : { 'text': 'Your account is suspended and is not permitted to access this feature', 'description': 'Corresponds with an HTTP 403 - the access token being used belongs to a suspended user and they can\'t complete the action you\'re trying to take' },
  '68' : { 'text': 'The Twitter REST API v1 is no longer active. Please migrate to API v1.1. https://dev.twitter.com/rest/public', 'description': 'Corresponds to a HTTP request to a retired v1-era URL.' },
  '88' : { 'text': 'Rate limit exceeded', 'description': 'The request limit for this resource has been reached for the current rate limit window.' },
  '89' : { 'text': 'Invalid or expired token', 'description': 'The access token used in the request is incorrect or has expired. Used in API v1.1' },
  '92' : { 'text': 'SSL is required', 'description': 'Only SSL connections are allowed in the API, you should update your request to a secure connection. See how to connect using SSL' },
  '130': { 'text': 'Over capacity', 'description': 'Corresponds with an HTTP 503 - Twitter is temporarily over capacity.' },
  '131': { 'text': 'Internal error', 'description': 'Corresponds with an HTTP 500 - An unknown internal error occurred.' },
  '135': { 'text': 'Could not authenticate you', 'description': 'Corresponds with a HTTP 401 - Your oauth_timestamp is either ahead or behind our acceptable range.' },
  '136': { 'text': 'You have been blocked from {action}', 'description': 'Corresponds with a HTTP 401 - The user associated with the action you are performing has blocked you.' },
  '161': { 'text': 'You are unable to follow more people at this time', 'description': 'Corresponds with HTTP 403 - thrown when a user cannot follow another user due to some kind of limit.' },
  '179': { 'text': 'Sorry, you are not authorized to see this status', 'description': 'Corresponds with HTTP 403 - thrown when a Tweet cannot be viewed by the authenticating user, usually due to the tweet\'s author having protected their tweets.' },
  '185': { 'text': 'User is over daily status update limit', 'description': 'Corresponds with HTTP 403 - thrown when a tweet cannot be posted due to the user having no allowance remaining to post. Despite the text in the error message indicating that this error is only thrown when a daily limit is reached, this error will be thrown whenever a posting limitation has been reached. Posting allowances have roaming windows of time of unspecified duration.' },
  '187': { 'text': 'Status is a duplicate', 'description': 'The status text has been Tweeted already by the authenticated account.' },
  '215': { 'text': 'Bad authentication data', 'description': 'Typically sent with 1.1 responses with HTTP code 400. The method requires authentication but it was not presented or was wholly invalid.' },
  '226': { 'text': 'This request looks like it might be automated. To protect our users from spam and other malicious activity, we can\'t complete this action right now.', 'description': 'We constantly monitor and adjust our filters to block spam and malicious activity on the Twitter platform. These systems are tuned in real-time. If you get this response our systems have flagged the Tweet or DM as possibly fitting this profile. If you feel that the Tweet or DM you attempted to create was flagged in error, please report the details around that to us by filing a ticket at https://support.twitter.com/forms/platform.' },
  '231': { 'text': 'User must verify login', 'description': 'Returned as a challenge in xAuth when the user has login verification enabled on their account and needs to be directed to twitter.com to generate a temporary password.' },
  '251': { 'text': 'This endpoint has been retired and should not be used.', 'description': 'Corresponds to a HTTP request to a retired URL.' },
  '261': { 'text': 'Application cannot perform write actions.', 'description': 'Corresponds with HTTP 403 - thrown when the application is restricted from POST, PUT, or DELETE actions. See How to appeal application suspension and other disciplinary actions.' },
  '271': { 'text': 'You can\'t mute yourself.', 'description': 'Corresponds with HTTP 403. The authenticated user account cannot mute itself.' },
  '272': { 'text': 'You are not muting the specified user.', 'description': 'Corresponds with HTTP 403. The authenticated user account is not muting the account a call is attempting to unmute.' },
  '354': { 'text': 'The text of your direct message is over the max character limit.', 'description': 'Corresponds with HTTP 403. The message size exceeds the number of characters permitted in a direct message.' },
}

print(TW_ERROR_CODES['136'])