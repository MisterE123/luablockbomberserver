-- server.lua
require "enet"

--vars
local step = 100 -- ms

local host = enet.host_create"localhost:6789"
while true do
  local event = host:service(step)
  if event and event.type == "receive" then
    print("Got message: ", event.data, event.peer)
    event.peer:send(event.data)
  end
end