#import "Person.h"

@implementation Person

- (void)displayDetails {
    NSLog(@"Name: %@, Age: %ld", self.name, (long)self.age);
}

@end
