#include <a_samp>
#include <Anti-Vehiclerepair>

public OnPlayerVehicleHealthHack(playerid)
{
  new string[128];
  format(string, sizeof(string),"%s (%d) �� ���� ���������� ���� ���� �Ǿ����ϴ�.", PlayerName(playerid), playerid);
  SendClientMessageToAll(-1, string);
  WriteLog(playerid);
  BanEx(playerid, "����������");
  return 1;
}

stock WriteLog(playerid)
{
    new sLogFileName[64], sLogData[128];
	new year,  month, day, hour, minute, second;
    getdate(year, month, day); gettime(hour, minute, second);
    format(sLogFileName, 64, "Log/CarRepairHack/%s(%d.%d.%d-%d:%d:%d) - CarCleo.log", PlayerName(playerid), year, month, day, hour, minute, second);
    new File:log=fopen(sLogFileName, io_append);
    format(sLogData,sizeof sLogData,"%s �� �������� Ŭ������ �����.  IP:%s\r\n",PlayerName(playerid),GetIP(playerid));
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
