#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Task : NSOperation

@property (nonatomic,getter=isExecuting) BOOL executing;       //Is task executing?
@property (nonatomic,getter=isFinished) BOOL finished;         //Is task finished?
@property NSOperationQueue *queue;

-(void)useCustomOperation;

@end

NS_ASSUME_NONNULL_END
