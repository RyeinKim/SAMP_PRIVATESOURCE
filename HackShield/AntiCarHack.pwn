/*==================================================================================*/
/*                              Made By. Leehi                                      */
/*==================================================================================*/
#include <a_samp>
/*====================new, forward====================*/
new	g_VehTime[MAX_PLAYERS];
forward OnPlayerChangeVehicle(playerid, vehicleid);
/*====================================================*/

public OnPlayerChangeVehicle(playerid, vehicleid)
{
    new string[256];
	#pragma unused vehicleid
	if((GetTickCount() - g_VehTime[playerid]) < 400)
	{
	    SendClientMessage(playerid, 0xFF0000FF, "차량 클레오를 사용 하여 서비스 블럭 처리됩니다.");
		format(string, sizeof(string),"%s (%d) 가 서비스 블럭처리 되었습니다. [사유: 차량클레오]", PlayerName(playerid), playerid);
		SendClientMessageToAll(0xFF0000FF, string);
		WriteLog(playerid);
		BanEx(playerid, "차량클레오");
	}
	g_VehTime[playerid] = GetTickCount();
	return 1;
}

stock WriteLog(playerid)
{
    new sLogFileName[64], sLogData[128];
	new year,  month, day, hour, minute, second;
    getdate(year, month, day); gettime(hour, minute, second);
    format(sLogFileName, 64, "Log/CarHack/%s(%d.%d.%d-%d:%d:%d) - CarCleo.log", PlayerName(playerid), year, month, day, hour, minute, second);
    new File:log=fopen(sLogFileName, io_append);
    format(sLogData,sizeof sLogData,"%s 가 차량클레오를 사용함.  IP:%s\r\n",PlayerName(playerid),GetIP(playerid));
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
