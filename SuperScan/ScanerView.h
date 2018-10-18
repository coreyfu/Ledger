#import <UIKit/UIKit.h>
@interface ScanerView : UIView
@property (nonatomic, assign) CGFloat   scanAreaEdgeLength;
@property (nonatomic, assign, readonly) CGRect scanAreaRect;
@end
