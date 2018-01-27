/*==================================================================================*/
/*                              Made By. Leehi                                      */
/*==================================================================================*/
#include <a_samp>
#define WEAPON_HACK 46
/*======================new, forward========================*/
new bool:WeaponHack[MAX_PLAYERS][WEAPON_HACK];
forward SafeGivePlayerWeapon(playerid, weaponid, ammo);
/*==========================================================*/

public OnPlayerConnect(playerid)
{
    for(new w = 1; w < WEAPON_HACK; w++)
	{
		WeaponHack[playerid][w] = false;
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
    new weaponid = GetPlayerWeapon(playerid);
	if (weaponid > 0)
	{
	    if (WeaponHack[playerid][weaponid] == false)
	    {
		    new string[128];
			ResetPlayerWeapons(playerid);
			format(string, sizeof(string),"%s (%d) 가 서비스 블럭처리 되었습니다. [사유: 무기핵사용]", PlayerName(playerid), playerid); // usehack: server msg
			SendClientMessageToAll(0xFF0000FF, string);
			BanEx(playerid, "무기핵사용");
		}
	}
	return 1;
}

public SafeGivePlayerWeapon(playerid, weaponid, ammo)
{
	WeaponHack[playerid][weaponid] = true;
	if (GetPlayerWeapon(playerid) == weaponid)
	{
	    ammo += GetPlayerAmmo(playerid);
	}
	GivePlayerWeapon(playerid, weaponid, ammo);
	return 1;
}

stock WriteLog(playerid)
{
    new sLogFileName[64], sLogData[128];
	new year,  month, day, hour, minute, second;
    getdate(year, month, day); gettime(hour, minute, second);
    format(sLogFileName, 64, "Log/WeaponHack/%s(%d.%d.%d-%d:%d:%d) - WeaponHack.log", PlayerName(playerid), year, month, day, hour, minute, second);
    new File:log=fopen(sLogFileName, io_append);
    format(sLogData,sizeof sLogData,"%s 가 무기핵을 사용함.  IP:%s\r\n",PlayerName(playerid),GetIP(playerid));
    fwrite(log, sLogData);
    fclose(log);
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
	return name;
}

stock GetIP( playerid )
{
    new IPAddress[16];
    GetPlayerIp( playerid, IPAddress, 16 );
    return IPAddress;
}
