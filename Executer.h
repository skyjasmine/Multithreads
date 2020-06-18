#import <Foundation/Foundation.h>
#import "Task.h"

typedef  void(^blk_t) (void);

NS_ASSUME_NONNULL_BEGIN

@interface Executer : NSObject

@property (nonatomic,strong) NSOperationQueue *queue;
@property (nonatomic,strong) NSMutableArray *taskArray;

-(void)execute;
-(void)onFinish:(blk_t)anBlock;

@end

NS_ASSUME_NONNULL_END
