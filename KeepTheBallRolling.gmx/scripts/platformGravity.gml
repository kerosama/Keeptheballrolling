return 1;
for(i = 0; i < 1; i++)
    {
        if(place_meeting(x + hspeed, y + vspeed, global.platforms[i]) && topsolid == 1)
            return 1;
    }
return 1;
