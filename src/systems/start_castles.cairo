// INITIALIZE CASTLES - Initialize north and south castles
#[system]
mod initialize_castles {
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Player, Castle};
    use debug::PrintTrait;
    use ctb_dojo::systems::print_castle::print_castle_system::printCastle;
    use ctb_dojo::systems::attack::attack_system::attack;


    fn start_castles () {
        '----START CASTLES FUNCTION----'.print();
        let mut south_castle = Castle {name: 'south', HP: 100};
        let mut north_castle = Castle {name: 'north', HP: 100};
        printCastle(south_castle);
        printCastle(north_castle);

        '---CONGRATS, THE GAME IS ON!---'.print();

        '---ATTACK TEST!---'.print();
        let test_wallet = starknet::contract_address_const::<0x0>();
        let mut test_player = Player {enrolled: true, name: 'Andre' , wallet: test_wallet, sharp: false, attack_damage: 10,};
        attack (test_player, ref south_castle);
    }
}


// // CASTELS TEST - CHECK NAME AND HP FOR BOTH CASTLES
// #[cfg(test)]
// mod tests {
//     use ctb_dojo::components::Castle;
//     use ctb_dojo::systems::start_castles::initialize_castles::start_castles;
//     #[test]
//     #[available_gas(100000)]
//     fn castles_test() {
//         let test_south = Castle {name: 'south', HP: 100};
//         assert(test_south.name == 'south', 'South castle name is wrong');
//         assert(test_south.HP == 100, 'South HP not 100');
//         let test_north = Castle {name: 'north', HP: 100};
//         assert(test_north.name == 'north', 'North castle name is wrong');
//         assert(test_north.HP == 100, 'South HP not 100');
//     }
// }
