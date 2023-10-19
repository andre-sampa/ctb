#[system]
mod test_system {
    use dojo::world::Context;
    fn execute(ctx: Context) {
       let x = 4;
        
    }
}

// HOW CAN WE TEST THE VALUE OF X INSIDE THE EXECUTE FUNCTION?


// #[cfg(test)]
// mod test_tmp {
//     use ctb_dojo::temp_test::test_system;
//     #[test]
//     #[available_gas(100000)]
//     fn temp_test2() {
//         assert(test_system::execute::x == 4, 'its not 4');
//     }
// }
