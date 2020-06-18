#import "Task.h"

@implementation Task

-(void)execute
{
    [NSThread sleepForTimeInterval:1];
    NSLog(@"task--------%@",[NSThread currentThread]);
}

@end







