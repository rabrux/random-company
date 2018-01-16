request = require 'sync-request'

getName = ( times ) ->
  times = parseInt times
  if isNaN( times )
    throw Error 'times must be a number'

  res  = request 'GET', 'https://www.switchplane.com/_project/ajax-business-name-generator.php'
  name = JSON.parse( res.getBody().toString() ).data

  if times is 1
    return name

  name + '|' + getName times - 1

generate = ( times = 1 ) ->
  ( getName times ).split '|'

module.exports = generate
