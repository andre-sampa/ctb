// CREATE A NEW PLAYER
#[system]
mod new_player_system {
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Player,};


fn execute(ctx: Context) {
let Name = 'Andre';
        set!(
            ctx.world,
            (
                Player {enrolled: true, name: Name , wallet: ctx.origin, sharp: false, attack_damage: 10,},

            )
        );
    }
}

// CAN'T MAKE THIS TEST TO COMPILE, TRIED EVERYTHING ALREADY!!
// COMPILOR SAYS PlayerTraitImpl HAS MULTIPLE IMPLEMENTATION
// ALSO CAN'T FIND THE RIGTH SYNTAX TO ACCESS ENROLLED BOOL


// NEW PLAYER CREATION AND PRINT TEST:

// #[cfg(test)]
// mod tests {
//     use ctb_dojo::components::{Player, PlayerTraitImpl };
//     use super::new_player_system;
//     use starknet::ContractAddress;
//     use debug::PrintTrait;

   
//     #[test]
//     #[available_gas(100000)]
//     fn player_test() {
//         let Name = 'Andre';
//         let test_wallet = starknet::contract_address_const::<0x0>();
//         let test_player = Player {enrolled: true, name: Name , wallet: test_wallet, sharp: false, attack_damage: 10,};
//         test_player.print();
//         assert(test_player,enrolled = true, 'player is not enrolled');
//     }
// }
