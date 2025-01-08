#include <amxmodx>
#include <engine>
#include <fun>
#include <hamsandwich>

#define PLUGIN "Instagib Mode"
#define VERSION "1.0"
#define AUTHOR "Inpu"

new bool:instagib_enabled = false; // Instagib state

#define EXPLOSION_SOUND "misc/instahit3.wav"
#define ENABLE_SOUND "misc/prepareforbattle.wav"

public plugin_init() {
    register_plugin(PLUGIN, VERSION, AUTHOR);

    // Command to enable/disable Instagib
    register_clcmd("say /instagib", "ToggleInstagibMode");

    //Hooks
    RegisterHam( Ham_TakeDamage, "player", "fw_TakeDamage" );
    RegisterHam( Ham_Spawn, "player", "OnPlayerSpawn", 1 );
    RegisterHam(Ham_Killed, "player", "OnPlayerDeath", 0);
}

// Fonction de précache
public plugin_precache() {
    precache_sound(EXPLOSION_SOUND);
    precache_sound(ENABLE_SOUND);
}

// Commande pour activer le mode Instagib
public ToggleInstagibMode(id) {
    if (!instagib_enabled) {
        ActivateInstagib();
    }else{
		DisableInstagibMode();
	}

    return PLUGIN_HANDLED;
}


// Activation du mode Instagib
public ActivateInstagib() {

    client_print(0, print_center, "INSTAGIB ENABLED");
    instagib_enabled = true;
    emit_sound(0, CHAN_AUTO, ENABLE_SOUND, 1.0, ATTN_NORM, 0, PITCH_NORM);
    
	 server_cmd("sv_maxspeed 600"); //Speed
     server_cmd("sv_gravity 600"); //Gravity

    //Give all player longjump item if available
   for (new i = 1; i <= get_maxplayers(); i++) {
        if (is_user_connected(i) && is_user_alive(i)) {
               give_item( i, "item_longjump" );
        }
    }
}

// Désactiver le mode Instagib
public DisableInstagibMode() {
    if (!instagib_enabled) return;

    instagib_enabled = false;
    client_print(0, print_center, "INSTAGIB DISABLED");
	
	server_cmd("sv_maxspeed 300"); //Default speed
    server_cmd("sv_gravity 800"); //Default gravity
}

// Fonction appelée lorsqu'un joueur prend des dégâts
public fw_TakeDamage( victim , inflictor , attacker , Float:damage , damage_type )
{
    if (!instagib_enabled) {
        return HAM_IGNORED;
    }

    if(damage_type == DMG_FALL){ //Don't affect fall damage
       return HAM_IGNORED;
    }

    SetHamParamFloat( 4 , damage * 1000.0 ); //One shot to kill

    return HAM_HANDLED;
}

public OnPlayerDeath(victim, attacker, shouldgib)
{

    if (!instagib_enabled) {
        return PLUGIN_CONTINUE;
    }

     client_cmd(victim, "spk misc/instahit3.wav");
     client_cmd(attacker, "spk misc/instahit3.wav");

    SetHamParamInteger(3, 2); //Gibs on death

    return HAM_HANDLED;
}

public OnPlayerSpawn(player)
{

        if (!instagib_enabled) {
            return HAM_IGNORED;
        }

         give_item( player, "item_longjump" );

        return HAM_HANDLED;
}