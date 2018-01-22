/*==================================================================================*/
/*                              Made By. Leehi                                      */
/*==================================================================================*/
#include <a_samp>
#include <foreach>
/*====================new, forward====================*/
forward AntiSpeedHack();
new SpeedWarnings[MAX_PLAYERS];
/*====================================================*/

/*=======================define=======================*/
#define red "{FF002B}"
#define MAX_SPEED_WARNINGS 3
#define MAX_SPEED 450
/*====================================================*/

public OnPlayerConnect(playerid)
{
    SpeedWarnings[playerid] = 0;
    SetPVarInt(playerid, "spawned", 0);
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    SetPVarInt(playerid, "spawned", 0);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	SetPVarInt(playerid, "spawned", 0);
	return 1;
}

public OnPlayerSpawn(playerid)
{
    SetPVarInt(playerid, "spawned", 1);
    return 1;
}

public AntiSpeedHack()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	 	new currentspeed = GetPlayerSpeed(i,true);
		if(currentspeed > MAX_SPEED)
		{
		    new tmpcar = GetPlayerVehicleID(i), surf = GetPlayerSurfingVehicleID(i);
			if(!IsAPlane(tmpcar) && !(GetPlayerState(i) == PLAYER_STATE_PASSENGER) && !(IsATrain(tmpcar)) && surf == INVALID_VEHICLE_ID && GetPVarInt(i, "spawned") == 1)
			{
			 	new sendername[MAX_PLAYER_NAME];
				GetPlayerName(i, sendername, sizeof(sendername));
				new vehicleid = GetPlayerVehicleID(i);
				new Float:hp; GetVehicleHealth(vehicleid, hp);
				SpeedWarnings[i]++; 
				if(SpeedWarnings[i] >= MAX_SPEED_WARNINGS)
				{
					new ok[128];
					new IP[16];
					GetPlayerIp(i, IP, sizeof(IP));
				    format(ok, sizeof(ok), "** System: %s (%d) 가 스피드핵을 사용하여 밴됩니다.  (%d km/h)", sendername,i,currentspeed);
					SendClientMessageToAll(-1, ok);
					Ban(i);
					SpeedWarnings[i] = 0;
				}
			}
		}
	}
}

stock GetPlayerSpeed(playerid,bool:kmh)
{
  new Float:Vx,Float:Vy,Float:Vz,Float:rtn;
  if(IsPlayerInAnyVehicle(playerid)) GetVehicleVelocity(GetPlayerVehicleID(playerid),Vx,Vy,Vz); else GetPlayerVelocity(playerid,Vx,Vy,Vz);
  rtn = floatsqroot(floatabs(floatpower(Vx + Vy + Vz,2)));
  return kmh?floatround(rtn * 100 * 1.61):floatround(rtn * 100);
}

stock IsATrain(vehicleid)
{
    switch(GetVehicleModel(vehicleid))
    {
        case 449,537,538,569,570,590: return 1;
    }
    return 0;
}

stock IsAPlane(vehicleid)
{
    switch(GetVehicleModel(vehicleid))
    {
        case 460,464,476,511,512,513,519,520,553,577,592,593: return 1;
    }
    return 0;
}
