// ATTACK_SYSTEM
#[system]
mod attack_system {
    use array::ArrayTrait;
    use traits::Into;
    use debug::PrintTrait;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Castle, Player,};


// ATTACK FUNCTION
fn attack(player:Player, ref castle: Castle) {

        if castle.name == 'north' {
            '---ATTACKING NORTH FUNCTION---'.print();
            'Show North HP'.print();
             castle.HP.print();
            'Attacking north'.print();
            let x = player.attack_damage;
            'Show attack damage'.print();
            x.print();
            castle.HP = castle.HP - x;
            'Show final North HP:'.print();
            castle.HP.print();

        }

    }

}


// ATTACK TEST - Creates a new player and a castle to verify attack and damage
#[cfg(test)]
mod tests {
    use ctb_dojo::components::{Player, PlayerTrait};
    use ctb_dojo::components::{Castle,};
    use super::attack_system::attack;

    #[test]
    #[available_gas(100000)]
    fn attack_test() {
        let Name = 'Andre';
        let test_wallet = starknet::contract_address_const::<0x0>();
        let mut north_castle = Castle {name: 'north', HP: 100};
        let mut new_player = Player {enrolled: true, name: Name , wallet: test_wallet, sharp: false, attack_damage: 10,};
        attack (new_player, ref north_castle);
        assert(north_castle.HP < 100, 'no damage');
    }


}





