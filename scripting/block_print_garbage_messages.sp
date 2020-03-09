#pragma semicolon 1

#include <sourcemod>

#pragma newdecls required

// block_print_garbage_messages.sp
public Plugin myinfo = 
{
	name = "Block Print Garbage Messages",
	author = "Wend4r",
	version = "1.0",
	url = "Discord: Wend4r#0001 | https://discord.gg/9gGHgBP"
};

char	g_sMsgFromSSRejec[2],
		g_sSendnetmsgSStr[2],
		g_sPutclientinser[2],
		g_sPutclientinser_0[2];

Address	g_psMsgFromSSRejec,
		g_psSendnetmsgSStr,
		g_psPutclientinser,
		g_psPutclientinser_0;

public void OnPluginStart()
{
	static const char sGameData[] = "block_print_garbage_messages.games";

	GameData hGameData = LoadGameConfigFile(sGameData);
	
	if(!hGameData)
	{
		SetFailState("Failed to load \"%s\" gamedata.", sGameData);

		return;
	}

	g_psMsgFromSSRejec = hGameData.GetAddress("aMsgFromSSRejec"),
	g_psSendnetmsgSStr = hGameData.GetAddress("aSendnetmsgSStr"),
	g_psPutclientinser = hGameData.GetAddress("aPutclientinser"),
	g_psPutclientinser_0 = hGameData.GetAddress("aPutclientinser_0");

	hGameData.Close();

	if(!g_psMsgFromSSRejec || !g_psSendnetmsgSStr || !g_psPutclientinser || !g_psPutclientinser_0)
	{
		SetFailState("Failed to get engine poiters. Data: %X, %X, %X, %X.", g_psMsgFromSSRejec, g_psSendnetmsgSStr, g_psPutclientinser, g_psPutclientinser_0);

		return;
	}

	g_sMsgFromSSRejec[0] = LoadFromAddress(g_psMsgFromSSRejec, NumberType_Int8);
	g_sSendnetmsgSStr[0] = LoadFromAddress(g_psSendnetmsgSStr, NumberType_Int8);
	g_sPutclientinser[0] = LoadFromAddress(g_psPutclientinser, NumberType_Int8);
	g_sPutclientinser_0[0] = LoadFromAddress(g_psPutclientinser_0, NumberType_Int8);

	StoreToAddress(g_psMsgFromSSRejec, 0, NumberType_Int8);
	StoreToAddress(g_psSendnetmsgSStr, 0, NumberType_Int8);
	StoreToAddress(g_psPutclientinser, 0, NumberType_Int8);
	StoreToAddress(g_psPutclientinser_0, 0, NumberType_Int8);
}

public void OnPluginEnd()
{
	StoreToAddress(g_psMsgFromSSRejec, g_sMsgFromSSRejec[0], NumberType_Int8);
	StoreToAddress(g_psSendnetmsgSStr, g_sSendnetmsgSStr[0], NumberType_Int8);
	StoreToAddress(g_psPutclientinser, g_sPutclientinser[0], NumberType_Int8);
	StoreToAddress(g_psPutclientinser_0, g_sPutclientinser_0[0], NumberType_Int8);
}