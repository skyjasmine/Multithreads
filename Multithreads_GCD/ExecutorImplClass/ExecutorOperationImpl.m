//Implement multithreads with NSOperation
#import "ExecutorOperationImpl.h"
#import "Executable.h"

@implementation ExecutorOperationImpl

//initialize NSOperation Queue
-(instancetype)init
{
    if(self = [super init])
    {
        _queue = [[NSOperationQueue alloc]init];
        _queue.maxConcurrentOperationCount = 5;
    }
    return self;
}

-(void)executeTasks:(NSArray<id<Executable>> *)tasks onFinish:(dispatch_block_t)completion
{
    for(int i=0;i<tasks.count;i++)
    {
        NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
            [[tasks objectAtIndex:i] execute];
        }];
        [self.queue addOperation:op];
    }
    NSBlockOperation *lastOp = [NSBlockOperation blockOperationWithBlock:completion];
    [self.queue waitUntilAllOperationsAreFinished];
    [self.queue addOperation:lastOp];
}
@end
