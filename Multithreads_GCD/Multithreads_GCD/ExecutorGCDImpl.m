//Implement multithreads with GCD
#import "ExecutorGCDImpl.h"

@implementation ExecutorGCDImpl

-(instancetype)init
{
    if(self = [super init])
    {
        _queue = dispatch_queue_create("coom.example.gcd.ForBarrier", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

-(void)executeTasks:(NSArray<id<Executable>> *)tasks onFinish:(dispatch_block_t)completion
{
    for(int i=0;i<tasks.count;i++)
    {
        dispatch_async(self.queue, ^{
            [[tasks objectAtIndex:i] execute];
        });
    }
    
    dispatch_barrier_async(self.queue, completion);
}

@end
