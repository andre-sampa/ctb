#[system]
mod print_player_system {
    use debug::PrintTrait;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Castle, Player,};


fn printPlayer(player:Player,) {
        '---PRINTING PLAYER---'.print();
        'ENROLLED:'.print();
        player.enrolled.print();
        'NAME:'.print();
        player.name.print();
        'WALLET:'.print();
        player.wallet.print();
        'SHARPENED:'.print();
        player.sharp.print();
        'ATTACK DAMAGE:'.print();
        player.attack_damage.print();
}
}
#[cfg(test)]
mod tests {
    use ctb_dojo::components::{Player, PlayerTrait};
    use ctb_dojo::components::{Castle,};
    use super::print_player_system::printPlayer;
    use debug::PrintTrait;

    #[test]
    #[available_gas(100000)]
    fn printPlayerTEST() {
        let Name = 'Andre';
        let test_wallet = starknet::contract_address_const::<0x0>();
        let mut north_castle = Castle {name: 'north', HP: 100};
        let mut new_player = Player {enrolled: true, name: Name , wallet: test_wallet, sharp: false, attack_damage: 10,};
        printPlayer(new_player);
        assert(new_player.name == 'Andre', 'wrong player name');
    }

}





