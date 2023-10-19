use debug::PrintTrait;
use array::ArrayTrait;
use starknet::ContractAddress;


/// PLAYER - Define Player attributes
#[derive(Component, Copy, Drop, Serde, SerdeLen)]
struct Player {
    #[key]
    enrolled: bool,
    name: felt252,
    wallet: ContractAddress,
    sharp: bool,
    coins: u64,
}


#[generate_trait]
impl PlayerFunctions of PlayerTrait {
    /// @title SHARPEN FUNCTION
    /// @notice - Define a Player Trait for '!sharpen' command 
    /// @dev - Check why we can't add a character on message variable. (felt252 size)
    /// @param - Self: Player method (player.method())
    /// @return - Bool value of player's sharpen.
    fn sharpen (ref self: Player) -> bool {
    '---!sharpen FUNCTION---'.print();
        if self.sharp == false {
            'Your sword is now sharpened.'.print();
            'The blacksmith did a great job.'.print();
            'Ready for war, my Lord!'.print();
            self.sharp = true;
            return (self.sharp);
            } 
            else {
                let message: felt252 = 'Your sword is already sharpened'; // if we add one more character we get felt252 error, check it out later
                message.print(); 
                return (self.sharp);
            
            }
        }
    
    /// @title NEW PLAYER FUNCTION
    /// @notice - Creates a new player instance
    /// @dev - 
    /// @param - name: Name wallet: Wallet
    /// @return - A Player struct initialized with default and provided values.
    fn new (name: felt252, wallet: ContractAddress) -> Player {
        let test_player = Player {
            enrolled: true, 
            name: name , 
            wallet: wallet, 
            sharp: false, 
            coins: 0,};
        test_player
    }

    fn print_player(self: Player) {
        '---PRINTING PLAYER---'.print();
        'ENROLLED:'.print();
        self.enrolled.print();
        'NAME:'.print();
        self.name.print();
        'WALLET:'.print();
        self.wallet.print();
        'SHARPENED:'.print();
        self.sharp.print();
        'COINS BALANCE:'.print();
        self.coins.print();
    }
}


  
// PRINT PLAYER IMPLEMENTATION - Implement a player print to PrintTrait<>
// CHECK WHY WE CAN'T MAKE player.print() to work 
// WHY WE MUST CHANGE NAME? A BUG SAYS PlayerPrintImpl IS DEFINED MULTIPLE TIMES
// IS PRINT ALREADY IMPLEMENTED? 

// impl PlayerPrintImpl_AAA of PrintTrait<Player> {
//     fn print_player(self: Player) {
//         '---PRINTING PLAYER---'.print();
//         'ENROLLED:'.print();
//         self.enrolled.print();
//         'NAME:'.print();
//         self.name.print();
//         'WALLET:'.print();
//         self.wallet.print();
//         'SHARPENED:'.print();
//         self.sharp.print();
//         'COINS BALANCE:'.print();
//         self.coins.print();
//     }
// }



// TESTS:
#[cfg(test)]
mod tests {

    use ctb_dojo::player::{PlayerFunctions};
    use debug::PrintTrait;

    // PLAYER SHARPEN TEST - Verify player.sharpen bool 
    #[test]
    #[available_gas(100000)]
    fn sharpen_test() {
        let test_wallet = starknet::contract_address_const::<0x01>();
        let mut test_sharpen_player = PlayerFunctions::new('Andre', test_wallet);
        test_sharpen_player.print_player();
        assert(PlayerFunctions::sharpen(ref test_sharpen_player), 'not sharpened');
        assert(test_sharpen_player.sharpen(), 'error');

    }


}