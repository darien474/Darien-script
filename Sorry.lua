local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

Rayfield:Notify({
	Title = "KEY IS hello",
	Content = "Hello is the key",
	Duration = 6.5,
	Image = 4483362458,
	Actions = { -- Notification Buttons
		Ignore = {
			Name = "Okay!",
			Callback = function()
				print("The user tapped Okay!")
			end
		},
	},
})

local Window = Rayfield:CreateWindow({
   Name = "Darien scripts",
   LoadingTitle = "Darien script",
   LoadingSubtitle = "by darien",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "darien script"
   },
   Discord = {
      Enabled = false,
      Invite = "sirius", -- The Discord invite code, do not include discord.gg/
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sirius Hub",
      Subtitle = "Key System",
      Note = "Join the discord (discord.gg/sirius)",
      FileName = "SiriusKey",
      SaveKey = true,
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = "Hello"
   }
})

local Tab = Window:CreateTab("Scripts", 4483362458) -- Title, Image

Window:Prompt({
	Title = 'Script',
	SubTitle = 'test',
	Content = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
	Actions = {
		Accept = {
			Name = 'Accept',
			Callback = function()
				-- You know what a callback is...
			end,
		}
	}
})

local Section = Tab:CreateSection("script",true/false) -- The 2nd argument is to tell if its only a Title and doesnt contain elements
