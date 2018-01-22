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
	new PlayerName[128];
    new weaponid = GetPlayerWeapon(playerid);
	if (weaponid > 0)
	{
	    if (WeaponHack[playerid][weaponid] == false)
	    {
		    new string[128];
			GetPlayerName(playerid, PlayerName, sizeof(PlayerName));
			ResetPlayerWeapons(playerid);
			format(string, sizeof(string),"%s (%d) 가 서비스 블럭처리 되었습니다. [사유: 무기핵사용]", PlayerName, playerid); // usehack: server msg
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
