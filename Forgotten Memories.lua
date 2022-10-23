--	Initialize	--

repeat wait() until game:IsLoaded()
	print("[SexyCode] Game Loaded...")
repeat wait() until game:GetService("Players")
	print("[SexyCode] Players Loaded...")
repeat wait() until game:GetService("Players").LocalPlayer.Character
	print("[SexyCode] Character Loaded...")

-- Vars --

getgenv().EntityTog = false
getgenv().PlayerTog = false


--	Funcrions	--

function entityesp()
	spawn(function()
		if getgenv().EntityTog then
		--	Exist	--
			for i, v in next, workspace:GetChildren() do
				if v.Name == "Freddy" or
				v.Name == "Bonnie" or
				v.Name == "Chica" or
				v.Name == "Foxy" or
				v.Name == "GoldenFreddy" or
				v.Name == "Marionette"
				and v.Parent == workspace then
					wait()
					local v_ESP = Instance.new("Highlight", v)
					v_ESP.DepthMode = 0 -- Always On Top / Occluded , 0 / 1
					v_ESP.Name = "v_ESP"
					v_ESP.FillColor = Color3.fromRGB(160, 32, 240)-- Purple inside
					v_ESP.OutlineColor = Color3.fromRGB(255, 0, 0)-- Red outline
					v_ESP.FillTransparency = 0.62
					v_ESP.OutlineTransparency = 0
				end
			end
		--	Not Exist Yet	--
			local function onChildAdded(Target)
				--print(Target.Name .. " added to the workspace")
				if Target.Name == "Freddy" or
				Target.Name == "Bonnie" or
				Target.Name == "Chica" or
				Target.Name == "Foxy" or
				Target.Name == "GoldenFreddy" or
				Target.Name == "Marionette"
				and Target.Parent == workspace then
					wait()
					local Target_ESP = Instance.new("Highlight", Target)
					Target_ESP.DepthMode = 0 -- Always On Top / Occluded , 0 / 1
					Target_ESP.Name = "Target_ESP"
					Target_ESP.FillColor = Color3.fromRGB(160, 32, 240)-- Purple inside
					Target_ESP.OutlineColor = Color3.fromRGB(255, 0, 0)-- Red outline
					Target_ESP.FillTransparency = 0.62
					Target_ESP.OutlineTransparency = 0
				end
			end
		end
	end)
end


--	Ui Library	--

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
	Name = 'Forgor 💀',
	HidePremium = true,
	SaveConfig = false,
	IntroEnabled = false,
	})

OrionLib:MakeNotification({
	Name = "Code Very Pro, Code Very Sexy",
	Content = "Very Pro Code, Very Sexy Code",
	Image = "rbxassetid://4483345998",
	Time = 7.9
})


--	Tab 0	--

	local Tab0 = Window:MakeTab({
		Name = "Misc",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})

	Tab0:AddToggle({
		Name = "Toggle Render",
		Default = false,
		Callback = function(Value)
			if Value then
				game.RunService:Set3dRenderingEnabled(false)
			end
			if not Value then
				game.RunService:Set3dRenderingEnabled(true)
			end
		end
	})


--	Tab 1	--

	local Tab1 = Window:MakeTab({
		Name = "Main",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})

	--	Sec 1_1	--

		local Section1_1 = Tab1:AddSection({
			Name = "Entity Chams"
		})

		Tab1:AddToggle({
			Name = "Sexy ESP",
			Default = false,
			Callback = function(Value)
				getgenv().EntityTog = Value
				if Value then
					entityesp()
				end
				if not Value then
					for i, v in next, workspace:GetChildren() do
						if v.Name == "v_ESP"
						or v.Name == "Target_ESP" then
							v:Destroy()
						end
					end
				end
			end
		})

	--	Sec 1_2	--

		local Section1_2 = Tab1:AddSection({
			Name = "Player Chams"
		})

		Tab1:AddToggle({
			Name = "Sexy ESP",
			Default = false,
			Callback = function(Value)
				if Value then
					getgenv().enabled = true --Toggle on/off
					getgenv().uselocalplayer = true --Choose whether the ESP highlights LocalPlayer or not
					getgenv().filluseteamcolor = false --Toggle fill color using player team color on/off
					getgenv().outlineuseteamcolor = false --Toggle outline color using player team color on/off
					getgenv().fillcolor = Color3.fromRGB(32, 255, 12) --Change fill color, no need to edit if using team color
					getgenv().outlinecolor = Color3.fromRGB(255, 255, 255) --Change outline color, no need to edit if using team color
					getgenv().filltrans = 0.62 --Change fill transparency
					getgenv().outlinetrans = 0 --Change outline transparency
					if game.PlaceId ~= 8482713490 then
						loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()						
					else
						OrionLib:MakeNotification({
							Name = "Sorry!",
							Content = "Player Chams Can't Run On This Place...",
							Image = "rbxassetid://4483345998",
							Time = 6
						})
					end
				elseif not Value then
					getgenv().enabled = false
					if game.PlaceId ~= 8482713490 then
						loadstring(game:HttpGet("https://raw.githubusercontent.com/zntly/highlight-esp/main/esp.lua"))()
					end
				end
			end
		})

	--	Sec 1_3	--

		local Section1_3 = Tab1:AddSection({
			Name = "Auto Fix"
		})

		Tab1:AddToggle({
			Name = "Oxygen",
			Default = false,
			Callback = function(Value)
				if Value then
					game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Restart Ventilation", workspace.WorkspaceUtilities.VentsLever)
					wait(1)
				end
			end
		})

		Tab1:AddToggle({
			Name = "Generators",
			Default = false,
			Callback = function(Value)
				if Value then
					game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Restart Gen", workspace.WorkspaceUtilities.Generator)
					wait(1)
				end
			end
		})

		Tab1:AddToggle({
			Name = "Curtain",
			Default = false,
			Callback = function(Value)
				if Value then
					game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Close Curtain", workspace.WorkspaceUtilities.Curtains)
					wait(1)
				end
			end
		})

		Tab1:AddToggle({
			Name = "Windup Box",
			Default = false,
			Callback = function(Value)
				if Value then
					game:GetService("ReplicatedStorage").Remotes.Client:FireServer("Windup Box Finished", workspace.WindupBox)
					wait(1)
				end
			end
		})

	--	Sec 1_5	--

		local Section1_5 = Tab1:AddSection({
			Name = "Create Exploited Custom Night"
		})

		Tab1:AddButton({
			Name = "Create",
			Callback = function()
				local args = {
					[1] = "Create Game",
					[2] = {
						["NIGHT"] = 6,
						["OWNER"] = game:GetService("Players").LocalPlayer.Name,
						["PLAYERCOUNT"] = getgenv().PlayerCount,
						["ANIMATRONIC_LEVELS"] = {
							["Freddy"] = getgenv().Freddy,
							["GoldenFreddy"] = getgenv().GoldenFreddy,
							["Foxy"] = getgenv().Foxy,
							["Chica"] = getgenv().Chica,
							["Marionette"] = getgenv().Marionette,
							["Bonnie"] = getgenv().Bonnie
						},
						["DIFFICULTY"] = "CUSTOM NIGHT",
						["PRIVACY"] = getgenv().Privacy
					}
				}
				game:GetService("ReplicatedStorage").Remotes.ClientInvoke:InvokeServer(unpack(args))
			end
		})
		
		Tab1:AddSlider({
			Name = "Player Count",
			Min = 1,
			Max = 4,
			Default = 1,
			Color = Color3.fromRGB(128, 128, 128),
			Increment = 1,
			ValueName = "Playerz",
			Callback = function(Value)
				getgenv().PlayerCount = Value
			end
		})

	--	Sec 1_6	--

		local Section1_6 = Tab1:AddSection({
				Name = "Freddy"
			})

		local s1 = 
				Tab1:AddSlider({
				Name = "Freddy Level",
				Min = 0,
				Max = 10000,
				Default = 0,
				Color = Color3.fromRGB(128, 128, 128),
				Increment = 1,
				ValueName = "	",
				Callback = function(Value)
					getgenv().Freddy = Value
				end
			})
				Tab1:AddTextbox({
					Name = "Manual input",
					Default = 0,
					TextDisappear = true,
					Callback = function(Value)
						s1:Set(Value)
						getgenv().Freddy = Value
					end	  
				})

	--	Sec 1_7	--
		local Section1_7 = Tab1:AddSection({
			Name = "Bonnie"
		})
		local s6 =
			Tab1:AddSlider({
				Name = "Bonnie Level",
				Min = 0,
				Max = 10000,
				Default = 0,
				Color = Color3.fromRGB(128, 128, 128),
				Increment = 1,
				ValueName = "	",
				Callback = function(Value)
					getgenv().Bonnie = Value
				end
			})
				Tab1:AddTextbox({
					Name = "Manual input",
					Default = 0,
					TextDisappear = true,
					Callback = function(Value)
						s6:Set(Value)
						getgenv().Bonnie = Value
					end	  
				})

	-- Sec 1_8	--
		local Section1_8 = Tab1:AddSection({
			Name = "Chica"
		})

		local s4 =
			Tab1:AddSlider({
				Name = "Chica Level",
				Min = 0,
				Max = 10000,
				Default = 0,
				Color = Color3.fromRGB(128, 128, 128),
				Increment = 1,
				ValueName = "	",
				Callback = function(Value)
					getgenv().Chica = Value
				end
			})
				Tab1:AddTextbox({
					Name = "Manual input",
					Default = 0,
					TextDisappear = true,
					Callback = function(Value)
						s4:Set(Value)
						getgenv().Chica = Value
					end	  
				})

	--	Sec 1_9	--
		local Section1_9 = Tab1:AddSection({
			Name = "Foxy"
		})

		local s3 =
			Tab1:AddSlider({
				Name = "Foxy Level",
				Min = 0,
				Max = 10000,
				Default = 0,
				Color = Color3.fromRGB(128, 128, 128),
				Increment = 1,
				ValueName = "	",
				Callback = function(Value)
					getgenv().Foxy = Value
				end
			})
				Tab1:AddTextbox({
					Name = "Manual input",
					Default = 0,
					TextDisappear = true,
					Callback = function(Value)
						s3:Set(Value)
						getgenv().Foxy = Value
					end	  
				})

	-- Sec 1_10	--
		local Section1_10 = Tab1:AddSection({
			Name = "Marionette"
		})

		local s5 =
			Tab1:AddSlider({
				Name = "Marionette Level",
				Min = 0,
				Max = 10000,
				Default = 0,
				Color = Color3.fromRGB(128, 128, 128),
				Increment = 1,
				ValueName = "	",
				Callback = function(Value)
					getgenv().Marionette = Value
				end
			})
				Tab1:AddTextbox({
					Name = "Manual input",
					Default = 0,
					TextDisappear = true,
					Callback = function(Value)
						s5:Set(Value)
						getgenv().Marionette = Value
					end	  
				})

	-- Sec 1_11	--

		local Section1_11 = Tab1:AddSection({
			Name = "GoldenFreddy"
		})

		local s2 =
				Tab1:AddSlider({
				Name = "GoldenFreddy Level",
				Min = 0,
				Max = 10000,
				Default = 0,
				Color = Color3.fromRGB(128, 128, 128),
				Increment = 1,
				ValueName = "	",
				Callback = function(Value)
					getgenv().GoldenFreddy = Value
				end
			})
				Tab1:AddTextbox({
					Name = "Manual input",
					Default = 0,
					TextDisappear = true,
					Callback = function(Value)
						s2:Set(Value)
						getgenv().GoldenFreddy = Value
					end	  
				})

	--	Sec 1_12	--
		local Section1_12 = Tab1:AddSection({
			Name = "Privacy"
		})

			Tab1:AddToggle({
				Name = "Private",
				Default = false,
				Callback = function(Value)
					if Value then
						getgenv().Privacy = "PRIVATE"
					end
					if not Value then
						getgenv().Privacy = "PUBLIC"
					end
				end
			})


--	Lib Start Up	--

OrionLib:Init()
print("[SexyCode] Executed...")


--	End	--