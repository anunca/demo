#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        person.name = @"John Doe";
        person.age = 30;

        [person displayDetails];
    }
    return 0;
}
