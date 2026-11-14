os.loadAPI("sha256.lua")
local oldPull = os.pullEvent
os.pullEvent = os.pullEventRaw

print("Profile(Admin or User):")
local adminHash = "b1fecb61ab1f157a1baac0e765e107a47674cd83dca91fce05a1de85629163c8" -- Glory
local userHash = "dfeac34cc54e5615cb196bd66bf906b638c99fabbef546b0f1e94c8aa9e22455" -- Best
local salt = "USSR"
local currentProfile = nil

while true do
  io.write(">")
  local input1 = read()
  if string.lower(input1) == "admin" then
    currentProfile = "ADMIN"
    break
  elseif string.lower(input1) == "user" then
    currentProfile = "USER"
    break
  else
    print("Invalid Profile(User or Admin)")
  end
end

print("Input Password:")

while true do
  io.write(">")
  local input2 = read("*")
  if currentProfile == "ADMIN" then
    if sha256.sha256(input2 .. salt) == adminHash then
      print("Access Granted")
      break
    else
      print("Incorrect Password")
    end
  elseif currentProfile == "USER" then
      if sha256.sha256(input2 .. salt) == userHash then
        print("Access Granted")
        break
      else
        print("Incorrect Password")
      end

os.pullEvent = oldPull
