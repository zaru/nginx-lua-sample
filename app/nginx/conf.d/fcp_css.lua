local _M = {}

function _M:replaceCSS()
  local args, err = ngx.req.get_uri_args()
  if err then
    ngx.log(ngx.STDERR, 'ERROR get_uri_args: ' .. err)
  end

  local uri = ngx.var.http_host .. ngx.var.request_uri
  local hashLib = require("hash")
  local hash = hashLib:stringToHash(uri)

  local bottomCSS = ''
  local fcpCSS = ''
  local body = ngx.arg[1]
  for key, val in pairs(args) do
    -- FCP 用の CSS が存在している場合は、読み込みようのタグを修正する
    if key == 'usefcp' and val == '1' then
      body = string.gsub(body, '<link[^<>]*stylesheet[^<>]*>', function (match)
        bottomCSS = bottomCSS .. match
        return ''
      end)
      fcpCSS = '<link href="//localhost:8080/' .. hash .. '.css" rel="stylesheet" media="all">'
    end
  end

  body = string.gsub(body, '</head>', fcpCSS .. '</head>')
  body = string.gsub(body, '</body>', bottomCSS .. '</body>')
  return body
end

return _M

