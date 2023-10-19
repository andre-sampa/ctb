// CREATE A NEW PLAYER
#[system]
mod new_player_system {
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::player::{Player,};


fn execute(ctx: Context) {
        set!(
            ctx.world,
            (
                Player {enrolled: true, name: 'Andre' , wallet: ctx.origin, sharp: false, attack_damage: 10,},

            )
        );
    }
}



#[cfg(test)]
mod tests {
    use ctb_dojo::player::{PlayerFunctions };
    use starknet::ContractAddress;
    use debug::PrintTrait;

   
    #[test]
    #[available_gas(100000)]
    fn player_system_test() {
        let test_wallet = starknet::contract_address_const::<0x0>();
        let test_player = PlayerFunctions::new('Andre', test_wallet);
        assert(test_player.enrolled == true, 'player is not enrolled');
    }
}
