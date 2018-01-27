#include <a_samp>
#include <Anti-Vehiclerepair>

public OnPlayerVehicleHealthHack(playerid)
{
  new string[128];
  format(string, sizeof(string),"%s (%d) 가 차량 수리핵으로 강제 정지 되었습니다.", PlayerName(playerid), playerid);
  SendClientMessageToAll(-1, string);
  WriteLog(playerid);
  BanEx(playerid, "차량수리핵");
  return 1;
}

stock WriteLog(playerid)
{
    new sLogFileName[64], sLogData[128];
	new year,  month, day, hour, minute, second;
    getdate(year, month, day); gettime(hour, minute, second);
    format(sLogFileName, 64, "Log/CarRepairHack/%s(%d.%d.%d-%d:%d:%d) - CarCleo.log", PlayerName(playerid), year, month, day, hour, minute, second);
    new File:log=fopen(sLogFileName, io_append);
    format(sLogData,sizeof sLogData,"%s 가 차량수리 클레오를 사용함.  IP:%s\r\n",PlayerName(playerid),GetIP(playerid));
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
