ThreadSpeed = 500;--- How long the thread will sleep after every tick
Owner = "MrFade";  ---Declaring the owner of this plugin
Name = "Fishing Example";  --- Plugin Name

Player = GetPlayer();  -- Returns the current Player wUnit;
Units = GetUnitsList(); -- returns a list of all current wUnits (includes players).
Objects = GetObjectList(); -- returns a list of all current uObjects.

UseLure = true;  --- Set this to true if you want the BOT to apply a lure to the fishing Rod MAKE SURE UPDATE THE LURE MACRO IN-GAME!
                  --- In-game type /m look for a macro named Lure, if you do not see one youre not running our addon.
				  --- within that macro you should see /use :
				  ---                                  /use 16;
				  --- Change the first line to   /use Lure_name_Here;
				  ---                            /use 16;
				  --- Save it then set the above UseLure to true in this file.



if ItemHasEnch(15) ~= true and UseLure == true then
  UseMacro("Lure");  
end;


if not Player.IsCasting() and not Player.IsChanneling() then  --- If the player is not currently casting cast fishing.
CastSpell("Fishing");
Sleep(800);     --- Basic method to wait for player to cast fishing in-game.
end

if(Objects.Count >= 1) then  --- If there are no objects near the player we would throw an error in the loop below.
	foreach Object in Objects do  -- Loop through every object near the player

		 if Object.Name == "Fishing Bobber" and IsObjectOwnedByPlayer(Object) and Object.IsActive() then --- Checking the object name.
			Bobber = Object;   --- Store our current Bobber in a variable.        
		 end;   
	end;
end;


if IsObjectValid(Bobber) and IsObjectOwnedByPlayer(Bobber) and Bobber.IsBobbing() then  -- Checking to see if the BOT is not nil (plugin would crash otherwise).
      Log("Catching fish!");
      InteractWithObject(Bobber);   --- Interact with our Object to catch "Click" the bobber.
      Sleep(500);                    --- Basic method to wait for auto-loot etc etc
 else
      --   Log("Not bobbing");
 end
 
 
