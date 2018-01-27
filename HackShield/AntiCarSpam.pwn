/*==================================================================================*/
/*                              Made By. Leehi                                      */
/*==================================================================================*/
#include <a_samp>
/*====================new,forward=====================*/
new carspam[MAX_PLAYERS];
forward carspamming(playerid);
/*====================================================*/

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    carspam[playerid] ++;
    SetTimerEx("carspamming", 1000,false,"i",playerid);
    return 1;
}

public carspamming(playerid)
{
    carspam[playerid] --;
    if(carspam[playerid] > 10)
    {
        new string[128];
        format(string, sizeof(carspam), "System: %s Anit Car Spam 에 의해 자동으로 밴됩니다.", PlayerName(playerid));
        SendClientMessageToAll(-1, string);
        WriteLog(playerid);
        BanEx(playerid, "");
    }
    return 1;
}

stock WriteLog(playerid)
{
    new sLogFileName[64], sLogData[128];
	new year,  month, day, hour, minute, second;
    getdate(year, month, day); gettime(hour, minute, second);
    format(sLogFileName, 64, "Log/CarSpamHack/%s(%d.%d.%d-%d:%d:%d) - CarCleo.log", PlayerName(playerid), year, month, day, hour, minute, second);
    new File:log=fopen(sLogFileName, io_append);
    format(sLogData,sizeof sLogData,"%s 가 차량스패밍을 사용함.  IP:%s\r\n",PlayerName(playerid),GetIP(playerid));
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
