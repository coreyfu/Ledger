#import <UIKit/UIKit.h>
#import "Ledger.h"
@interface AddItemVC : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate>
@property Ledger* ledger;
@property NSString *detail;
@property NSString *money;
@property Boolean jump;
@end
