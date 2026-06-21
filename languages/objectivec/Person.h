#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger age;

- (void)displayDetails;

@end
