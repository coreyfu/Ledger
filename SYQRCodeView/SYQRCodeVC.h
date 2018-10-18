#import <UIKit/UIKit.h>
@interface SYQRCodeVC : UIViewController
@property (nonatomic, copy) void (^SYQRCodeCancleBlock) (SYQRCodeVC *);
@property (nonatomic, copy) void (^SYQRCodeSuncessBlock) (SYQRCodeVC *,NSString *);
@property (nonatomic, copy) void (^SYQRCodeFailBlock) (SYQRCodeVC *);
@end
