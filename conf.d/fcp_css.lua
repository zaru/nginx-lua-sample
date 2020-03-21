local _M = {}

function _M:replaceCSS()
    local args, err = ngx.req.get_uri_args()
    if err then
        ngx.log(ngx.STDERR, 'ERROR get_uri_args: ' .. err)
    end

    local bottomCSS = ''
    local fcpCSS = ''
    local body = ngx.arg[1]
    for key, val in pairs(args) do
        if key == 'usefcp' and val == '1' then
            body = string.gsub(body, '<link[^<>]*stylesheet[^<>]*>', function (match)
                bottomCSS = bottomCSS .. match
                ngx.log(ngx.STDERR, 'match is: ' .. match)
                return ''
            end)
            fcpCSS = '<link href="//fcp.css" rel="stylesheet" media="all">'
        end
        ngx.log(ngx.STDERR, 'arg key = ' .. key .. ' / val = ' .. val)
    end
    body = string.gsub(body, '</head>', fcpCSS .. '</head>')
    body = string.gsub(body, '</body>', bottomCSS .. '</body>')
    return body
end

return _M

