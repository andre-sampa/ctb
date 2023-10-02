// castle.print() is not working
// so we did a print function to debug


#[system]
mod print_castle_system {
    use debug::PrintTrait;
    use dojo::world::Context;
    use starknet::ContractAddress;
    use ctb_dojo::components::{Castle, Player,};


fn printCastle(castle:Castle,) {
    '---PRINTING CASTLE---'.print();
   'CASTLE NAME:'.print();
    castle.name.print();
    'CASTLE HP:'.print();
    castle.HP.print();

}
}

// PRINT CASTLE TEST 
#[cfg(test)]
mod tests {
    use ctb_dojo::components::Castle;
    use starknet::ContractAddress;
    use super::print_castle_system::printCastle;
    #[test]
    #[available_gas(100000)]
    fn print_castle_test() {
        let test_wallet = starknet::contract_address_const::<0x0>();
        let mut new_castle = Castle {name: 'north', HP: 100};
        printCastle(new_castle);
        assert(new_castle.name == 'north', 'wrong castle name');
    }
}


