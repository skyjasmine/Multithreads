#import "Task.h"
@implementation Task

// 因为父类的属性是Readonly的，重载时如果需要setter的话则需要手动合成。
@synthesize executing = _executing;
@synthesize finished = _finished;

-(void)start
{
    @autoreleasepool {
        self.executing = YES;
        if(self.cancelled)
        {
            [self done];
            return;
        }
        
        //operation
        [NSThread sleepForTimeInterval:1];
        NSLog(@"task--------%@",[NSThread currentThread]);
        [self done];
    }
}

-(void)done
{
    self.finished = YES;
    self.executing = NO;
}

#pragma mark - setter -- getter
-(void)setExecuting:(BOOL)executing
{
    //调用KVO通知
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}

-(BOOL)isExecuting
{
    return _executing;
}

-(void)setFinished:(BOOL)finished
{
    if(_finished != finished)
    {
        [self willChangeValueForKey:@"isFinished"];
        _finished = finished;
        [self didChangeValueForKey:@"isFinished"];
    }
}

-(BOOL)isFinished
{
    return _finished;
}

//return YES, indicate Operation is concurrent
-(BOOL)isAsynchronous
{
    return YES;
}

-(void)useCustomOperation
{
    self.queue = [[NSOperationQueue alloc]init];
    Task *task = [[Task alloc]init];
    [self.queue addOperation:task];
}

@end







