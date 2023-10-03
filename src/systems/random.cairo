#[system]
mod random_system {
    use debug::PrintTrait;

// RANDOM FUNCTION - Not Ready

fn random() -> u64 {
    '---RANDOM FUNCTION---'.print();
    let x:u64 = 20;
    x
}

}

// // RANDOM FUNCTION TEST
// #[cfg(test)]
// mod tests {
//     use debug::PrintTrait;
//     use super::random_system::random;
//     #[test]
//     #[available_gas(100000)]
//     fn random_function_test() {
//         '----RANDOM FUNCTION TEST----'.print();
//         let mut x:u64 = 0;
//         x.print();
//         x = random();
//         x.print();
//     }
// }

