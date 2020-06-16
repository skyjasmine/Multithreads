#import "Executer.h"

static const int count = 5;

@implementation Executer

-(id)init
{
    self = [super init];
    if(self)
    {
        self.taskArray = [NSMutableArray arrayWithCapacity:count];
        for(int i=0; i<count; i++)
        {
            Task *task = [[Task alloc]init];
            [self.taskArray addObject:task];
        }
    }
    return self;
}
-(void)execute
{
    self.queue = [[NSOperationQueue alloc] init];
    for(int i=0;i<count;i++)
    {
        [self.queue addOperation:[self.taskArray objectAtIndex:i]];
    }
}
-(void)OnFinish:(blk_t)anBlock
{
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:anBlock];
    [self.queue waitUntilAllOperationsAreFinished];
    [self.queue addOperation:op];
}

@end
