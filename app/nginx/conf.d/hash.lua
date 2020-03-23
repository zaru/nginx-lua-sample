local _M = {}

-- string を SHA1 ハッシュ文字列にして返す
function _M:stringToHash(string)
  local resty_sha1 = require "resty.sha1"
  local sha1 = resty_sha1:new()
  sha1:update(string)
  local str = require "resty.string"
  local digest = sha1:final()
  return str.to_hex(digest)
end

return _M

