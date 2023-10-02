// MAIN START
#[system]
mod main_system {
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Player, GameSettings};
    use ctb_dojo::systems::start_lobby::start_lobby::start_lobby;
    use ctb_dojo::systems::start_castles::initialize_castles::start_castles;
    use ctb_dojo::systems::random::random_system::random;
    use debug::PrintTrait;


fn main() {
    '---MAIN---'.print();
    // GAME SETTINGS 
    '---Define Game Settings---'.print();
    let id: u64 = random();
    let cool_down:u64 = 60; 
    let Players_number:u32 = 1;
    let game_settings = GameSettings {game_settings_id: id, combat_cool_down: cool_down, players_number: Players_number, };
    assert(game_settings.combat_cool_down == 60, 'cooldown setting error');

    // HOW DO WE CALL A SYSTEM IF WE LET EXECUTE FUNCTION?
    // THIS ONE IS WORKING BC WE GAVE THE FUNCTION A DIFFERENT NAME
    'Calling start_lobby fn'.print();
    start_lobby(game_settings);

    }
}

// MAIN TEST - main() will call start_lobby() that will call start_castles()
#[cfg(test)]
mod tests {
    use ctb_dojo::systems::main::main_system::main;

    #[test]
    #[available_gas(100000)]
    fn main_test () {
        main();
    }

}
