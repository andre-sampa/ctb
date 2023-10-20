// MAIN START
#[system]
mod main_system {
    use starknet::ContractAddress;
    use ctb_dojo::player::{Player, PlayerFunctions};
    use ctb_dojo::castle::{Castle, CastleFunctions};
    use ctb_dojo::lobby::{Lobby, LobbyFunctions};
    use ctb_dojo::game_settings::GameSettings;
    use ctb_dojo::random;
    use debug::PrintTrait;

/// @title: MAIN FUNCTION
/// @notice: This function sets a game and start a lobby;
/// @dev: start_lobby will call start_castles that will simulate 
/// a complete attack round with sharp and attack command.
fn main() {
    '---MAIN---'.print();
    // GAME SETTINGS
    '---Define Game Settings---'.print();
    '---Calling random fn for id---'.print();
    let id: u64 = random::Random(5);
    let cool_down:u64 = 60; 
    let Players_number:u32 = 1;
    let game_settings = GameSettings {game_settings_id: id, combat_cool_down: cool_down, players_number: Players_number, };
    assert(game_settings.combat_cool_down == 60, 'cooldown setting error');

    // HOW DO WE CALL A SYSTEM IF WE LET EXECUTE FUNCTION?
    // THIS ONE IS WORKING BECAUSE WE GAVE THE FUNCTION A DIFFERENT NAME
    '---Calling start_lobby fn---'.print();
    LobbyFunctions::start_lobby(game_settings);

    }
}

// ---------------------------
// ---------- Tests ----------
// ---------------------------
// MAIN TEST - main() will call start_lobby() that will call start_castles()
#[cfg(test)]
mod tests {
    use ctb_dojo::main::main_system::main;

    #[test]
    #[available_gas(200000)]
    fn main_test () {
        main();
    }

}
