#import <Foundation/Foundation.h>
#import "Task.h"

typedef  void(^blk_t) (void);

NS_ASSUME_NONNULL_BEGIN

@interface Executer : NSObject

@property NSOperationQueue *queue;
@property NSMutableArray *taskArray;

-(void)execute;
-(void)OnFinish:(blk_t)anBlock;

@end

NS_ASSUME_NONNULL_END
