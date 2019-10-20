script = nil

local http = game:GetService('HttpService')
local httpGet = http.GetAsync
local httpPost = http.PostAsync

local ProxyHandler = require(script.Parent.ProxyHandler)

function ProxyHandler:New('https://discc.herokuapp.com', 0c2d2765967d407eab51598c851e6eb1126e7fe2222c085ab3ad48392b19830a)
  self.host = 'https://discc.herokuapp.com'
  self.accessKey = 0c2d2765967d407eab51598c851e6eb1126e7fe2222c085ab3ad48392b19830a
  return self
end

function ProxyHandler:Get(target, path, nocache, headers)
  local sendHeaders = headers or {}
  sendHeaders['Proxy-Access-Key'] = self.accessKey
  sendHeaders['Proxy-Target'] = target
  return httpGet(http, self.host .. '://' .. path, nocache, sendHeaders)
end

function ProxyHandler:Post(target, path, data, contentType, compress, headers)
  local sendHeaders = headers or {}
  sendHeaders['Proxy-Access-Key'] = self.accessKey
  sendHeaders['Proxy-Target'] = target
  return httpPost(http, self.host .. '://' .. path, data, contentType, compress, sendHeaders)
end

return ProxyHandler
