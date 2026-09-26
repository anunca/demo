#![allow(unused_variables)]
type T = i32;
const TOUCHDOWN_POINTS: i32 = 6;
fn main() {
    let season: &str = "summer";
    let mut points_scored: u8 = 28;
    let f: f32 = -28.99;
    let long = 6_000_000;
    let r: isize = -99;
    let r: usize = 99;
    let r: u8 = 255;
    let cast = r as char;
    let raws = r"c:\users";
    let mut o = 1;
    o += 1;
    let e: char = '😅';
    let mut a: [i16; 2] = [1, 2];
    let mut u = ("alz", 43);
    let users = ["alz", "t"];
    for us in users {
        println!("{us}")
    }
    let ra = 'a'..='z';
    for us in ra {
        println!("{us}")
    }
    let ra = 1..10;
    for us in ra {
        println!("{us}")
    }
    u.0 = "al";
    dbg!(u);
    dbg!(a);
    print!("{}\n", u.0);
    print!("{:.1}\n", f);
    print!("{}\n", a[1]);
    a[1] = 3;
    print!("{}\n", a[1]);
    print!("{e}\n");
    print!("{o}\n");
    print!("{raws} {cast}\n");
    print!(
        "Hello, \n\n\t\tworld! {season} {} {f} {long}\n",
        points_scored
    );
    points_scored = 35;

    let event_time = "06:00";
    let event_time: T = 6;
    {
        let test: T = 9;
        print!("TEST {test}");
    }
    // print!("TEST {test}");
    let _favorite_beverage = "cofeee";
    println!(
        "Hello, world! {season} {} TP: {TOUCHDOWN_POINTS}",
        points_scored
    );
    println!(
        "Hello,  world! {season} {0} , {0}, {0} et: {event_time}",
        points_scored
    );
    apply_to_jobs(4, "te");
    lp();
}
fn apply_to_jobs(number: i32, title: &str) {
    println!("I'm applying to {number} {title} jobs");
    println!("{}", is_even(45));
    println!("{:?}", alphabets("aardvark"));
    println!("{:?}", alphabets("aardvarz"));
    println!("{:?}", alphabets("rdvrz"));
    println!("{:?}", alphabets("rdvr"));
}
fn is_even(mut number: i32) -> bool{
    number %= 2;
    println!("{}", number);
    return number == 0;
}
fn alphabets(text: &str)->(bool,bool){
    let is_a = text.contains("a");
    let is_z = text.contains("z");
    let m = match is_a {
        true => "yes",
        false => "no",
        _ => unreachable!()
    };
    println!("{m}");
    return (is_a, is_z);
}
fn lp() {
        let mut s = 1_000_000_000;
    println!("{s}");
    loop {
        if s == 0 {
            break;
        }
        // println!("{s}");
        s -= 1;
    }
    println!("{s}");
    let mut city: String = start_trip();
    visit_philadelphia(&mut city);
    visit_new_york(&mut city);
    visit_boston(&mut city);
    show_itinerary(&city);
}
fn start_trip()->String {
    String::from("The plan is...")
}
fn visit_philadelphia(city: &mut String){
    city.push_str("Phil");
}
fn visit_boston(mut city: &mut String){
    city.push_str(" and Boston");
}
fn visit_new_york(mut city: &mut String){
    city.push_str(" and NY");
}
fn show_itinerary(city: &String){
    println!("{city}")
}