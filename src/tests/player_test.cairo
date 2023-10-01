#[cfg(test)]
mod tests {
    use ctb_dojo::components::{Player, PlayerTraitImpl };
    use starknet::ContractAddress;
    use debug::PrintTrait;

   
    #[test]
    #[available_gas(100000)]
    fn player_test() {
        let test_wallet = starknet::contract_address_const::<0x0>();
        let test_player = Player {enrolled: true, name: 'Andre' , wallet: test_wallet, sharp: false, attack_damage: 10,};
        //test_player.print();
        assert(test_player.enrolled == true, 'player is not enrolled');
    }
}