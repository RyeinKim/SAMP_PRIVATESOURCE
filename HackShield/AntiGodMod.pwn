/*==================================================================================*/
/*                              Made By. Leehi                                      */
/*==================================================================================*/
#include <a_samp>
/*====================new, forward====================*/
forward healthcheck();
/*====================================================*/

public healthcheck()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		new Float:phealth;
		GetPlayerHealth(i, phealth);
		if(phealth > 100)
		{
		    new string[200];
		    format(string, sizeof(string), "System: %s (%d) 가 무적핵 사용으로 자동밴 처리 됩니다. ", PlayerName(i), i);
		    SendClientMessageToAll(0xffffffff, string);
		    BanEx(i,string);
		}
	}
	return 1;
}

stock WriteLog(playerid)
{
    new sLogFileName[64], sLogData[128];
	new year,  month, day, hour, minute, second;
    getdate(year, month, day); gettime(hour, minute, second);
    format(sLogFileName, 64, "Log/GodMod/%s(%d.%d.%d-%d:%d:%d) - GodMod.log", PlayerName(playerid), year, month, day, hour, minute, second);
    new File:log=fopen(sLogFileName, io_append);
    format(sLogData,sizeof sLogData,"%s 가 무적클레오를 사용함.  IP:%s\r\n",PlayerName(playerid),GetIP(playerid));
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
