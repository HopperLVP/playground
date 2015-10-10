// Copyright 2006-2015 Las Venturas Playground. All rights reserved.
// Use of this source code is governed by the MIT license, a copy of which can
// be found in the LICENSE file.

/**
 *
 * DO NOT ADD NEW FUNCTION CALLS, METHODS OR CODE TO THIS FILE. ONLY REMOVE EXISTING CODE AS YOU ARE
 * CLEANING IT UP. NEW CODE MUST USE THE NEW TIMER SYSTEM. SEE TIMERCONTROLLER.PWN FOR MORE INFO ON
 * HOW YOU CAN UTILIZE IT.
 *
 */

/**
 *
 * I'M NOT KIDDING. GO AWAY. SHUSH.
 *
 */

/**
 * As we can't just delete all existing timers, all of them will be wrapped in the various methods
 * in this class. It's been build upon the new timer system.
 *
 * @author Russell Krupke <russell@sa-mp.nl>
 */
class DeprecatedTimerRuntime {

    new m_fiveSecondTicker = 0;
    new m_threeMinuteTicker = 0;
    new m_fiveMinuteTicker = 0;
    new m_twentyMinuteTicker = 0;
    new m_ninetyMinuteTicker = 0;

    @list(SecondTimer)
    public onSecondTimerTick() {
        if (++m_fiveSecondTicker == 5) {
            CTheft__CheckNPCKick();

            for (new playerId = 0; playerId <= PlayerManager->highestPlayerId(); ++playerId)
                ResetDeathFloodCountForPlayer(playerId);

            m_fiveSecondTicker = 0;
        }

        waterFightProcess();
        CReaction__Process();
        IRCCommand ();
        CDerby__Process();
        CRobbery__Process();

        CLyse__Process();
        CBrief__Process();

        CChase__Process();
        CBrief__CheckEmpty();
        CShell__CheckStatus();
        CRace__Process();

        rwProcess();

        hayProcess();
        CHay__Process();
        ProcessMapZoneRaces();
#if Feature::EnableFightClub == 0
        CFightClub__Process();
#endif

        for (new playerId = 0; playerId <= PlayerManager->highestPlayerId(); ++playerId) {
            if (Player(playerId)->isConnected() == false)
                continue;

            ResetPlayerInteriorQuit(playerId);
            CBomb__Countdown (playerId);
            UpdateTime (playerId);
            CheckPlayerArea (playerId);
            TaxiArrived (playerId);

            WeaponCheat (playerId);
            CDrink__ProcessPlayer (playerId);
            CheckGymEntry (playerId);
            radioProcess(playerId);

            if (g_bPlayerGodmode[playerId])
            {
                SetPlayerHealth (playerId, 65535);
                if (IsPlayerInAnyVehicle (playerId))
                    RepairVehicle (GetPlayerVehicleID(playerId));
                    SetVehicleHealth (GetPlayerVehicleID (playerId), 1000.0);
            }

            CTheft__Process (playerId);

#if Feature::EnableSerializationController == 0
            CSave__Process(playerId);
#endif

            CBomb__CheckPlayer (playerId);
            CDerby__PlayerProcess (playerId);
            hayPlayerProcess(playerId);
            TeleportCheatProcess(playerId);
            ProcessPlayerBox(playerId);
            CheckPlayerClubAudioStream(playerId);

            validKillerId[playerId] = Player::InvalidId;
            validReasonId[playerId] = WEAPON_NONE;
        }
    }

    @list(TwoSecondTimer)
    public onTwoSecondTimerTick() {
        new bool: countDownDisabledForPlayer, bool: playerInMinigame;
        for (new playerId = 0; playerId <= PlayerManager->highestPlayerId(); ++playerId) {
            if (Player(playerId)->isConnected() == false || Player(playerId)->isNonPlayerCharacter() == true)
                continue;

            SetPlayerScore(playerId, GetPlayerMoney(playerId));

            if (iPlayerRampTime [playerId] > 0)
            {
                if (Time->currentTime() - iPlayerRampTime [playerId] > 2)
                    RemoveRamp (playerId);
            }

            /// @todo Remove this huge hack. It's necessary because we have no state manager, which
            ///       sucks to infinite levels. It also breaks disableGlobalCountdownForPlayer().
            countDownDisabledForPlayer = Countdown->isGlobalCountdownDisabledForPlayer(playerId);
            playerInMinigame = IsPlayerInMinigame(playerId) == 1;

            if (!countDownDisabledForPlayer && playerInMinigame)
                Countdown->disableGlobalCountdownForPlayer(playerId);
            if (countDownDisabledForPlayer && !playerInMinigame)
                Countdown->enableGlobalCountdownForPlayer(playerId);

            /// </hack>

            ProcessMapZoneVehicleRepair(playerId);
        }

        UpdateInteriorGodMode();
    }

    @list(TenSecondTimer)
    public onTenSecondTimerTick() {
        FortCarsonUpdate();
    }

    @list(MinuteTimer)
    public onMinuteTimerTick() {
        for (new playerId = 0; playerId <= PlayerManager->highestPlayerId(); ++playerId) {
            if (Player(playerId)->isConnected() == false)
                continue;

            CAchieve__CheckIngameHours(playerId);
            if (banWarning[playerId] >= 1)
                banWarning[playerId] --;
            if (tpWarning[playerId] >= 1)
                tpWarning[playerId] --;
        }

        TaxUpdate();
        CRace__OpenRaces();
        CReaction__ReactionExpire();

        if (++m_threeMinuteTicker == 3) {
            FreeTaxi();
            ShootingPlaceUpdate();

            m_threeMinuteTicker = 0;
        }

        if (++m_fiveMinuteTicker == 5) {
            ShowServerMessage();

            m_fiveMinuteTicker = 0;
        }

        if (++m_twentyMinuteTicker == 20) {
            BonusTime__Start();
            CExport__NewWantedVehicle();

            m_twentyMinuteTicker = 0;
        }

        if (++m_ninetyMinuteTicker == 90) {
            CTheft__Initalize();

            m_ninetyMinuteTicker = 0;
        }
    }
};

stock StartTimers() {
    SetTimer("QuickTimer", 100, 1);
}

forward QuickTimer();
public QuickTimer() {
    CDrift__Update();
    CHay__Process();
    CRace__ProcessLoadDisplay();
}